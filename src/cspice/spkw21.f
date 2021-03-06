C$Procedure      SPKW21 ( Write SPK segment, type 21 )
 
      SUBROUTINE SPKW21 ( HANDLE, BODY,   CENTER, FRAME,  
     .                    FIRST,  LAST,   SEGID,  N, 
     .                    DLSIZE, DLINES, EPOCHS        )
 
C$ Abstract
C
C     Write a type 21 segment to an SPK file.
C
C$ Disclaimer
C
C     THIS SOFTWARE AND ANY RELATED MATERIALS WERE CREATED BY THE
C     CALIFORNIA INSTITUTE OF TECHNOLOGY (CALTECH) UNDER A U.S.
C     GOVERNMENT CONTRACT WITH THE NATIONAL AERONAUTICS AND SPACE
C     ADMINISTRATION (NASA). THE SOFTWARE IS TECHNOLOGY AND SOFTWARE
C     PUBLICLY AVAILABLE UNDER U.S. EXPORT LAWS AND IS PROVIDED "AS-IS"
C     TO THE RECIPIENT WITHOUT WARRANTY OF ANY KIND, INCLUDING ANY
C     WARRANTIES OF PERFORMANCE OR MERCHANTABILITY OR FITNESS FOR A
C     PARTICULAR USE OR PURPOSE (AS SET FORTH IN UNITED STATES UCC
C     SECTIONS 2312-2313) OR FOR ANY PURPOSE WHATSOEVER, FOR THE
C     SOFTWARE AND RELATED MATERIALS, HOWEVER USED.
C
C     IN NO EVENT SHALL CALTECH, ITS JET PROPULSION LABORATORY, OR NASA
C     BE LIABLE FOR ANY DAMAGES AND/OR COSTS, INCLUDING, BUT NOT
C     LIMITED TO, INCIDENTAL OR CONSEQUENTIAL DAMAGES OF ANY KIND,
C     INCLUDING ECONOMIC DAMAGE OR INJURY TO PROPERTY AND LOST PROFITS,
C     REGARDLESS OF WHETHER CALTECH, JPL, OR NASA BE ADVISED, HAVE
C     REASON TO KNOW, OR, IN FACT, SHALL KNOW OF THE POSSIBILITY.
C
C     RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE OF
C     THE SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO INDEMNIFY
C     CALTECH AND NASA FOR ALL THIRD-PARTY CLAIMS RESULTING FROM THE
C     ACTIONS OF RECIPIENT IN THE USE OF THE SOFTWARE.
C
C$ Required_Reading
C
C     NAIF_IDS
C     SPK
C     TIME
C
C$ Keywords
C
C     EPHEMERIS
C     FILES
C
C$ Declarations
 
      IMPLICIT NONE 

      INCLUDE 'spk21.inc' 

      INTEGER               HANDLE
      INTEGER               BODY
      INTEGER               CENTER
      CHARACTER*(*)         FRAME
      DOUBLE PRECISION      FIRST
      DOUBLE PRECISION      LAST
      CHARACTER*(*)         SEGID
      INTEGER               N
      INTEGER               DLSIZE
      DOUBLE PRECISION      DLINES ( DLSIZE, * )
      DOUBLE PRECISION      EPOCHS (         * )
 
C$ Brief_I/O
C
C     Variable  I/O  Description
C     --------  ---  --------------------------------------------------
C     HANDLE     I   Handle of an SPK file open for writing.
C     BODY       I   NAIF code for an ephemeris object.
C     CENTER     I   NAIF code for center of motion of BODY.
C     FRAME      I   Reference frame name.
C     FIRST      I   Start time of interval covered by segment.
C     LAST       I   End time of interval covered by segment.
C     SEGID      I   Segment identifier.
C     N          I   Number of difference lines in segment.
C     DLSIZE     I   Difference line size.
C     DLINES     I   Array of difference lines.
C     EPOCHS     I   Coverage end times of difference lines.
C     MAXTRM     P   Maximum number of terms per difference table
C                    component.
C
C$ Detailed_Input
C
C     HANDLE         is the file handle of an SPK file that has been
C                    opened for writing.
C
C     BODY           is the NAIF integer code for an ephemeris object
C                    whose state relative to another body is described
C                    by the segment to be created.
C
C     CENTER         is the NAIF integer code for the center of motion
C                    of the object identified by BODY.
C
C     FRAME          is the NAIF name for a reference frame relative to
C                    which the state information for BODY is specified.
C
C     FIRST,
C     LAST           are, respectively, the start and stop times of
C                    the time interval over which the segment defines
C                    the state of BODY.
C
C     SEGID          is the segment identifier.  An SPK segment
C                    identifier may contain up to 40 characters.
C
C     N              is the number of difference lines in the input 
C                    difference line array.  
C
C     DLSIZE         is the size of each difference line data structure
C                    in the difference line array input DLINES. Let
C                    MAXDIM be the dimension of each component of the
C                    difference table within each difference line. Then
C                    the size DLSIZE of the difference line is
C
C                       ( 4 * MAXDIM ) + 11
C 
C
C     DLINES         contains a time-ordered array of difference lines.
C                    The Ith difference line occupies elements (1,I)
C                    through (MAXDIM,I) of DLINES, where MAXDIM is
C                    as described above in the description of DLSIZE.
C                    Each difference line represents the state (x, y,
C                    z, dx/dt, dy/dt, dz/dt, in kilometers and
C                    kilometers per second) of BODY relative to CENTER,
C                    specified relative to FRAME, for an interval of
C                    time.  The time interval covered by the Ith
C                    difference line ends at the Ith element of the
C                    array EPOCHS (described below). The interval
C                    covered by the first difference line starts at the
C                    segment start time.
C
C                    The contents of a difference line are as shown
C                    below:
C
C                       Dimension  Description
C                       ---------  ----------------------------------
C                       1          Reference epoch of difference line
C                       MAXDIM     Stepsize function vector
C                       1          Reference position vector,  x
C                       1          Reference velocity vector,  x
C                       1          Reference position vector,  y
C                       1          Reference velocity vector,  y
C                       1          Reference position vector,  z
C                       1          Reference velocity vector,  z
C                       MAXDIM,3   Modified divided difference
C                                  arrays (MDAs)
C                       1          Maximum integration order plus 1
C                       3          Integration order array
C
C                    The reference position and velocity are those of
C                    BODY relative to CENTER at the reference epoch.
C                    (A difference line is essentially a polynomial
C                    expansion of acceleration about the reference
C                    epoch.)  
C
C
C     EPOCHS         is an array of epochs corresponding to the members
C                    of the difference line array. The epochs are
C                    specified as seconds past J2000 TDB.
C
C                    The first difference line covers the time interval
C                    from the segment start time to EPOCHS(1). For 
C                    I > 1, the Ith difference line covers the half-open
C                    time interval from, but not including, EPOCHS(I-1)
C                    through EPOCHS(I). 
C
C                    The elements of EPOCHS must be strictly increasing.
C
C
C$ Detailed_Output
C
C     None.  See $Particulars for a description of the effect of this
C     routine.
C
C$ Parameters
C
C     MAXTRM      is the maximum number of terms allowed in
C                 each component of the difference table 
C                 contained in the input argument RECORD.
C                 See the INCLUDE file spk21.inc for the value
C                 of MAXTRM.
C
C$ Exceptions
C
C     If any of the following exceptions occur, this routine will return
C     without creating a new segment.
C
C     1) If FRAME is not a recognized name, the error
C        SPICE(INVALIDREFFRAME) is signaled.
C
C     2) If the last non-blank character of SEGID occurs past index 40,
C        the error SPICE(SEGIDTOOLONG) is signaled.
C
C     3) If SEGID contains any nonprintable characters, the error
C        SPICE(NONPRINTABLECHARS) is signaled.
C
C     4) If the number of difference lines N is not at least one, 
C        the error SPICE(INVALIDCOUNT) will be signaled.
C
C     5) If FIRST is greater than LAST then the error
C        SPICE(BADDESCRTIMES) will be signaled.
C
C     6) If the elements of the array EPOCHS are not in strictly
C        increasing order, the error SPICE(TIMESOUTOFORDER) will be
C        signaled.
C
C     7) If the last epoch EPOCHS(N) is less than LAST, the error
C        SPICE(COVERAGEGAP) will be signaled.
C
C     8) If DLSIZE is greater than the limit
C
C           ( 4 * MAXTRM ) + 11
C
C        the error SPICE(DIFFLINETOOLARGE) will be signaled. If
C        DLSIZE is less than 71, the error SPICE(DIFFLINETOOSMALL)
C        will be signaled.
C
C     9) Let KQMAX1 be the maximum integration order for a given
C        difference line. If any value at index KQMAX1-1 or greater
C        in the step size array of that difference line is zero, the 
C        error SPICE(ZEROSTEP) will be signaled. The checked portion
C        of the step size vector lies in the index range 2:KQMAX-1
C        of the difference line containing the vector.
C
C$ Files
C
C     A new type 21 SPK segment is written to the SPK file attached
C     to HANDLE.
C
C$ Particulars
C
C     This routine writes an SPK type 21 data segment to the open SPK
C     file according to the format described in the type 21 section of
C     the SPK Required Reading. The SPK file must have been opened with
C     write access.
C
C$ Examples
C
C     Suppose that you have difference lines and are prepared to
C     produce a segment of type 21 in an SPK file.
C
C     The following code fragment could be used to add the new segment
C     to a previously opened SPK file attached to HANDLE. The file must
C     have been opened with write access.
C
C        C
C        C     Create a segment identifier.
C        C
C              SEGID = 'MY_SAMPLE_SPK_TYPE_21_SEGMENT'
C
C        C
C        C     Write the segment.
C        C
C              CALL SPKW21 (  HANDLE,  BODY,    CENTER,  FRAME,
C             .               FIRST,   LAST,    SEGID,   N,
C             .               DLSIZE,  DLINES,  EPOCHS         )
C
C$ Restrictions
C
C     1) The validity of the difference lines is not checked by
C        this routine.
C
C$ Literature_References
C
C     None.
C
C$ Author_and_Institution
C
C     N.J. Bachman   (JPL)
C
C$ Version
C
C-    SPICELIB Version 2.0.0, 21-AUG-2015 (NJB) 
C
C        Relaxed step size error check to allow zero
C        values in elements indexed greater than KQMAX1-2.
C
C-    SPICELIB Version 1.0.0, 03-FEB-2014 (NJB) 
C
C-&
 
C$ Index_Entries
C
C     write spk type_21 ephemeris data segment
C
C-&
 
 
 
C
C     SPICELIB functions
C
      INTEGER               LASTNB
      
      LOGICAL               FAILED
      LOGICAL               RETURN
 
C
C     Local parameters
C
      INTEGER               SIDLEN
      PARAMETER           ( SIDLEN  =  40 )
 
      INTEGER               FPRINT
      PARAMETER           ( FPRINT  =  32 )
 
      INTEGER               LPRINT
      PARAMETER           ( LPRINT  = 126 )
 
C
C     MINDSZ is the minimum MDA size; this is the size
C     of type 1 MDAs.
C
      INTEGER               MINDSZ
      PARAMETER           ( MINDSZ =   71 )

C
C     Local variables
C
      INTEGER               DSCSIZ
      PARAMETER           ( DSCSIZ  =   5 )
      
      INTEGER               DTYPE
      PARAMETER           ( DTYPE   =  21 )

      INTEGER               DIRSIZ
      PARAMETER           ( DIRSIZ  = 100 )
 
       
C
C     Local variables
C
      DOUBLE PRECISION      DESCR  ( DSCSIZ )
      DOUBLE PRECISION      PRVEPC
 
      INTEGER               CHRCOD
      INTEGER               I
      INTEGER               J
      INTEGER               KQMAX1
      INTEGER               KQMLOC
      INTEGER               MAXDIM
      INTEGER               MAXDSZ
      INTEGER               REFCOD
      

C
C     Standard SPICE error handling.
C
      IF ( RETURN () ) THEN
         RETURN
      END IF

      CALL CHKIN ( 'SPKW21' )

C
C     Make sure the difference line size is within limits.
C
      MAXDSZ = ( 4 * MAXTRM ) + 11

      IF ( DLSIZE .GT. MAXDSZ ) THEN

         CALL SETMSG ( 'The input difference line size is #, '
     .   //            'while the maximum supported by '
     .   //            'this routine is #. It is possible '
     .   //            'that this problem is due to your '
     .   //            'SPICE Toolkit being out of date.'      )
         CALL ERRINT ( '#',  DLSIZE                            )
         CALL ERRINT ( '#',  MAXDSZ                            )
         CALL SIGERR ( 'SPICE(DIFFLINETOOLARGE)'               )
         CALL CHKOUT ( 'SPKW21'                                )
         RETURN

      END IF

      IF ( DLSIZE .LT. MINDSZ ) THEN

         CALL SETMSG ( 'The input difference line size is #, '
     .   //            'while the minimum supported by '
     .   //            'this routine is #. It is possible '
     .   //            'that this problem is due to your '
     .   //            'SPICE Toolkit being out of date.'      )
         CALL ERRINT ( '#',  DLSIZE                            )
         CALL ERRINT ( '#',  MINDSZ                            )
         CALL SIGERR ( 'SPICE(DIFFLINETOOSMALL)'               )
         CALL CHKOUT ( 'SPKW21'                                )
         RETURN

      END IF

C
C     Get the NAIF integer code for the reference frame.
C
      CALL NAMFRM ( FRAME, REFCOD )
 
      IF ( REFCOD .EQ. 0 ) THEN
 
         CALL SETMSG ( 'The reference frame # is not supported.'   )
         CALL ERRCH  ( '#', FRAME                                  )
         CALL SIGERR ( 'SPICE(INVALIDREFFRAME)'                    )
         CALL CHKOUT ( 'SPKW21'                                    )
         RETURN
 
      END IF
 
C
C     Check to see if the segment identifier is too long.
C
      IF ( LASTNB(SEGID) .GT. SIDLEN ) THEN
 
         CALL SETMSG ( 'Segment identifier contains more than ' //
     .                 '40 characters.'                          )
         CALL SIGERR ( 'SPICE(SEGIDTOOLONG)'                     )
         CALL CHKOUT ( 'SPKW21'                                  )
         RETURN
 
      END IF
 
C
C     Now check that all the characters in the segment identifier
C     can be printed.
C
      DO I = 1, LASTNB(SEGID)
 
         CHRCOD = ICHAR( SEGID(I:I) )
 
         IF ( ( CHRCOD .LT. FPRINT ) .OR. ( CHRCOD .GT. LPRINT ) ) THEN
 
            CALL SETMSG ( 'The segment identifier contains '  //
     .                    'nonprintable characters'               )
            CALL SIGERR ( 'SPICE(NONPRINTABLECHARS)'              )
            CALL CHKOUT ( 'SPKW21'                                )
            RETURN
 
         END IF
 
      END DO

C
C     The difference line count must be at least one.
C
      IF ( N .LT. 1 ) THEN

         CALL SETMSG ( 'The difference line count was #; the count ' //
     .                 'must be at least one.'                       )
         CALL ERRINT ( '#', N                                        )
         CALL SIGERR ( 'SPICE(INVALIDCOUNT)'                         )
         CALL CHKOUT ( 'SPKW21'                                      )
         RETURN

      END IF

C
C     The segment stop time should be greater than or equal to
C     the begin time.
C
      IF ( FIRST .GT. LAST ) THEN
 
         CALL SETMSG ( 'The segment start time: # is greater than ' //
     .                 'the segment end time: #'                   )
         CALL ERRDP  ( '#', FIRST                                  )
         CALL ERRDP  ( '#', LAST                                   )
         CALL SIGERR ( 'SPICE(BADDESCRTIMES)'                      )
         CALL CHKOUT ( 'SPKW21'                                    )
         RETURN
 
      END IF
 
C
C     Make sure the epochs form a strictly increasing sequence.
C
      PRVEPC = EPOCHS(1)
 
      DO I = 2, N
 
         IF ( EPOCHS(I) .LE. PRVEPC ) THEN
 
            CALL SETMSG ( 'EPOCH # having index # is not greater '    //
     .                    'than its predecessor #.'                   )
            CALL ERRDP  ( '#',  EPOCHS(I)                             )
            CALL ERRINT ( '#',  I                                     )
            CALL ERRDP  ( '#',  EPOCHS(I-1)                           )
            CALL SIGERR ( 'SPICE(TIMESOUTOFORDER)'                    )
            CALL CHKOUT ( 'SPKW21'                                    )
            RETURN

         END IF

         PRVEPC = EPOCHS(I)
 
      END DO
 
C
C     Make sure there's no gap between the last difference line 
C     epoch and the end of the time interval defined by the segment 
C     descriptor.
C
      IF (  EPOCHS(N) .LT. LAST ) THEN
 
         CALL SETMSG ( 'Segment has coverage gap: segment end time # '
     .   //            'follows last epoch #.'                        )
         CALL ERRDP  ( '#',  LAST                                     )
         CALL ERRDP  ( '#',  EPOCHS(N)                                )
         CALL SIGERR ( 'SPICE(COVERAGEGAP)'                           )
         CALL CHKOUT ( 'SPKW21'                                       )
         RETURN
 
      END IF

C
C     Check the step size vectors in the difference lines.
C
      MAXDIM = ( DLSIZE - 11 ) / 4
      KQMLOC = ( 4 * MAXDIM  ) + 8


      DO I = 1, N
C
C        Check only the first KQMAX1-2 elements of the step size
C        vector. The higher-indexed elements are allowed to be zero.
C
         KQMAX1 = NINT( DLINES(KQMLOC,I) )

         DO J = 2, KQMAX1-1

            IF ( DLINES(J,I) .EQ. 0.D0 ) THEN

               CALL SETMSG ( 'Step size was zero at step size vector '
     .         //            'index # within difference line #.'      )
               CALL ERRINT ( '#',  J-1                                )
               CALL ERRINT ( '#',  I                                  )
               CALL SIGERR ( 'SPICE(ZEROSTEP)'                        )
               CALL CHKOUT ( 'SPKW21'                                 )
               RETURN

            END IF

         END DO

      END DO

C
C     If we made it this far, we're ready to start writing the segment.
C
C     Create the segment descriptor.
C
      CALL SPKPDS ( BODY, CENTER, FRAME, DTYPE, FIRST, LAST, DESCR )
 
C
C     Begin a new segment.
C
      CALL DAFBNA ( HANDLE, DESCR, SEGID )
 
      IF ( FAILED() ) THEN
         CALL CHKOUT ( 'SPKW21' )
         RETURN
      END IF
           
C
C     The type 21 segment structure is shown below:
C
C        +-----------------------+
C        | Difference line 1     |
C        +-----------------------+
C        | Difference line 2     |
C        +-----------------------+
C                   ...
C        +-----------------------+
C        | Difference line N     |
C        +-----------------------+
C        | Epoch 1               |
C        +-----------------------+
C        | Epoch 2               |
C        +-----------------------+
C                   ...
C        +-----------------------+
C        | Epoch N               |
C        +-----------------------+
C        | Epoch 100             | (First directory)
C        +-----------------------+
C                   ...
C        +-----------------------+
C        | Epoch (N/100)*100     | (Last directory)
C        +-----------------------+
C        | Max diff table size   |
C        +-----------------------+
C        | Number of diff lines  |
C        +-----------------------+
C
 
      CALL DAFADA ( DLINES,  N*DLSIZE )
      CALL DAFADA ( EPOCHS,  N        )
 
      DO I = 1,   N / DIRSIZ
         CALL DAFADA (  EPOCHS( DIRSIZ*I ),  1  )
      END DO
 
      CALL DAFADA ( DBLE( MAXDIM ),  1 )
      CALL DAFADA ( DBLE( N      ),  1 )
 
C
C     As long as nothing went wrong, end the segment.
C
      IF ( .NOT. FAILED() ) THEN
         CALL DAFENA
      END IF
 
      CALL CHKOUT ( 'SPKW21' )
      RETURN
      END
