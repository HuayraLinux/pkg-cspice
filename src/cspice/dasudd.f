C$Procedure      DASUDD ( DAS, update data, double precision )
 
      SUBROUTINE DASUDD ( HANDLE, FIRST, LAST, DATA )
 
C$ Abstract
C
C     Update data in a specified range of double precision addresses
C     in a DAS file.
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
C     DAS
C
C$ Keywords
C
C     ARRAY
C     ASSIGNMENT
C     DAS
C     FILES
C
C$ Declarations
 
      INTEGER               HANDLE
      INTEGER               FIRST
      INTEGER               LAST
      DOUBLE PRECISION      DATA   ( * )
 
C$ Brief_I/O
C
C     Variable  I/O  Description
C     --------  ---  --------------------------------------------------
C     HANDLE     I   DAS file handle.
C     FIRST,
C     LAST       I   Range of d.p. addresses to write to.
C     DATA       I   An array of d.p. numbers.
C
C$ Detailed_Input
C
C     HANDLE         is a file handle of a DAS file opened for writing.
C
C     FIRST,
C     LAST           are the first and last of a range of DAS logical
C                    addresses of double precision numbers.  These
C                    addresses satisfy the inequality
C
C                       1  <   FIRST   <   LAST   <   LASTD
C                          _           -          -
C
C                    where LASTD is the last double precision logical
C                    address in use in the DAS file designated by
C                    HANDLE.
C
C     DATA           is an array of double precision numbers.  The
C                    array elements DATA(1) through DATA(N) will be
C                    written to the indicated DAS file, where N is
C                    LAST - FIRST + 1.
C
C$ Detailed_Output
C
C     See $Particulars for a description of the effect of this routine.
C
C$ Parameters
C
C     None.
C
C$ Exceptions
C
C     1)  If the input file handle is invalid, the error will be
C         diagnosed by routines called by this routine.
C
C     2)  Only logical addresses that already contain data may be
C         updated:  if either FIRST or LAST are outside the range
C
C           [ 1,  LASTD ]
C
C         where LASTD is the last double precision logical address
C         that currently contains data in the indicated DAS file, the
C         error SPICE(INVALIDADDRESS) is signalled.
C         The DAS file will not be modified.
C
C     3)  If FIRST > LAST but both addresses are valid, this routine
C         will not modify the indicated DAS file.  No error will be
C         signalled.
C
C     4)  If an I/O error occurs during the data update attempted
C         by this routine, the error will be diagnosed by routines
C         called by this routine.  FIRST and LAST will not be modified.
C
C$ Files
C
C     See the description of the argument HANDLE in $Detailed_Input.
C
C$ Particulars
C
C     This routine replaces the double precision data in the specified
C     range of logical addresses within a DAS file with the contents of
C     the input array DATA.
C
C     The actual physical write operations that update the indicated
C     DAS file with the contents of the input array DATA may not take
C     place before this routine returns, since the DAS system buffers
C     data that is written as well as data that is read.  In any case,
C     the data will be flushed to the file at the time the file is
C     closed, if not earlier.  A physical write of all buffered
C     records can be forced by calling the SPICELIB routine DASWBR
C     (DAS, write buffered records).
C
C     In order to append double precision data to a DAS file, filling
C     in a range of double precision logical addresses that starts
C     immediately after the last double precision logical address
C     currently in use, the SPICELIB routine DASADD ( DAS add data,
C     double precision ) should be used.
C
C$ Examples
C
C     1)  Write to addresses 1 through 500 in a DAS file in
C         random-access fashion by updating the file.  Recall
C         that data must be present in the file before it can
C         be updated.
C
C
C                  PROGRAM UP
C
C                  CHARACTER*(4)         TYPE
C
C                  DOUBLE PRECISION      DATA    ( 500 )
C
C                  INTEGER               HANDLE
C                  INTEGER               I
C
C            C
C            C     Open the new DAS file RAND.DAS.  Use the file name
C            C     as the internal file name.
C            C
C                  TYPE = 'TEST'
C                  CALL DASONW ( 'TEST.DAS', TYPE, 'TEST.DAS', HANDLE )
C
C            C
C            C     Append 500 double precision numbers to the file;
C            C     after the data is present, we're free to update it
C            C     in any order we please.  (CLEARD zeros out a double
C            C     precision array.)
C            C
C                  CALL CLEARD (          500,  DATA )
C                  CALL DASADD ( HANDLE,  500,  DATA )
C
C            C
C            C     Now the double precision logical addresses 1:500
C            C     can be written to in random-access fashion.  We'll
C            C     fill them in in reverse order.
C            C
C                  DO I = 500, 1, -1
C                     CALL DASUDD ( HANDLE, I, I, DBLE(I) )
C                  END DO
C
C            C
C            C     Close the file.
C            C
C                  CALL DASCLS ( HANDLE )
C
C            C
C            C     Now make sure that we updated the file properly.
C            C     Open the file for reading and dump the contents
C            C     of the double precision logical addresses 1:500.
C            C
C                  CALL DASOPR ( 'RAND.DAS',  HANDLE      )
C
C                  CALL CLEARD (              500,  DATA  )
C                  CALL DASRDD (  HANDLE,  1, 500,  DATA  )
C
C                  WRITE (*,*) 'Contents of RAND.DAS:'
C                  WRITE (*,*) ' '
C                  WRITE (*,*) DATA
C
C                  END
C
C$ Restrictions
C
C     None.
C
C$ Literature_References
C
C     None.
C
C$ Author_and_Institution
C
C     K.R. Gehringer (JPL)
C     N.J. Bachman   (JPL)
C     W.L. Taber     (JPL)
C
C$ Version
C
C-    SPICELIB Version 1.2.0 10-APR-2014 (NJB)
C
C        Deleted declarations of unused parameters.
C
C        Corrected header comments: routine that flushes
C        written, buffered records is DASWBR, not DASWUR.
C
C-    SPICELIB Version 1.1.1 19-DEC-1995 (NJB)
C
C        Corrected title of permuted index entry section.
C
C-    SPICELIB Version 1.1.0, 12-MAY-1994 (KRG) (NJB)
C
C        Test of FAILED() added to loop termination conditions.
C
C        Removed references to specific DAS file open routines in the
C        $ Detailed_Input section of the header. This was done in order
C        to minimize documentation changes if the DAS open routines ever
C        change.
C
C        Modified the $ Examples section to demonstrate the new ID word
C        format which includes a file type and to include a call to the
C        new routine DASONW, open new for write, which makes use of the
C        file type. Also,  a variable for the type of the file to be
C        created was added.
C
C-    SPICELIB Version 1.0.0, 11-NOV-1992 (NJB) (WLT)
C
C-&
 
C$ Index_Entries
C
C     update double precision data in a DAS file
C
C-&
 
C$ Revisions
C
C-    SPICELIB Version 1.1.0, 12-MAY-1994 (KRG) (NJB)
C
C        Test of FAILED() added to loop termination condition.  Without
C        this test, an infinite loop could result if DASA2L or DASURD
C        signaled an error inside the loop.
C
C        Removed references to specific DAS file open routines in the
C        $ Detailed_Input section of the header. This was done in order
C        to minimize documentation changes if the DAS open routines ever
C        change.
C
C        Modified the $ Examples section to demonstrate the new ID word
C        format which includes a file type and to include a call to the
C        new routine DASONW, open new for write, which makes use of the
C        file type. Also,  a variable for the type of the file to be
C        created was added.
C
C-    SPICELIB Version 1.0.0, 11-NOV-1992 (NJB) (WLT)
C
C-&
 
 
C
C     SPICELIB functions
C
      LOGICAL               FAILED
      LOGICAL               RETURN
 
C
C     Local parameters
C
      INTEGER               DP
      PARAMETER           ( DP     =  2  )
 
      INTEGER               NWD
      PARAMETER           ( NWD    = 128 )
 
C
C     Local variables
C
      INTEGER               CLBASE
      INTEGER               CLSIZE
      INTEGER               LASTC
      INTEGER               LASTD
      INTEGER               LASTI
      INTEGER               N
      INTEGER               NUMDP
      INTEGER               NWRITN
      INTEGER               RECNO
      INTEGER               WORDNO
 
C
C     Standard SPICE error handling.
C
      IF ( RETURN () ) THEN
         RETURN
      ELSE
         CALL CHKIN ( 'DASUDD' )
      END IF
 
C
C     Get the last logical addresses in use in this DAS file.
C
      CALL DASLLA ( HANDLE, LASTC, LASTD, LASTI )
 
C
C     Validate the input addresses.
C
      IF (      ( FIRST .LT. 1     )
     .     .OR. ( FIRST .GT. LASTD )
     .     .OR. ( LAST  .LT. 1     )
     .     .OR. ( LAST  .GT. LASTD )  ) THEN
 
         CALL SETMSG ( 'FIRST was #. LAST was #. Valid range is [1,#].')
         CALL ERRINT ( '#',   FIRST                                    )
         CALL ERRINT ( '#',   LAST                                     )
         CALL ERRINT ( '#',   LASTD                                    )
         CALL SIGERR ( 'SPICE(INVALIDADDRESS)'                         )
         CALL CHKOUT ( 'DASUDD'                                        )
         RETURN
 
      END IF
 
C
C     Let N be the number of addresses to update.
C
      N  =  LAST - FIRST + 1
 
C
C     We will use the variables RECNO and OFFSET to determine where to
C     write data in the DAS file.  RECNO will be the record containing
C     the physical location  to write to;  WORDNO will be the word
C     location that we will write to next.
C
C     Find the first location to write to.  CLBASE and CLSIZE are the
C     base record number and size of the cluster of d.p. records that
C     the address FIRST lies within.
C
      CALL DASA2L ( HANDLE, DP, FIRST, CLBASE, CLSIZE, RECNO, WORDNO )
 
C
C     Set the number of double precision words already written.  Keep
C     writing to the file until this number equals the number of
C     elements in DATA.
C
C     Note that if N is non-positive, the loop doesn't get exercised.
C
C
      NWRITN  =  0
 
      DO WHILE (  ( NWRITN .LT. N ) .AND. ( .NOT. FAILED() )  )
C
C        Write as much data as we can (or need to) into the current
C        record.  We assume that CLBASE, RECNO, WORDNO, and NWRITN have
C        been set correctly at this point.
C
C        Find out how many words to write into the current record.
C        There may be no space left in the current record.
C
         NUMDP  =  MIN (  N - NWRITN,   NWD - WORDNO + 1  )
 
         IF ( NUMDP .GT. 0 ) THEN
C
C           Write NUMDP words into the current record.
C
            CALL DASURD ( HANDLE,
     .                    RECNO,
     .                    WORDNO,
     .                    WORDNO + NUMDP - 1,
     .                    DATA( NWRITN + 1 )   )
 
            NWRITN  =  NWRITN + NUMDP
            WORDNO  =  WORDNO + NUMDP
 
         ELSE
C
C           It's time to start on a new record.  If the record we
C           just finished writing to (or just attempted writing to,
C           if it was full) was not the last of the cluster, the next
C           record to write to is the immediate successor of the last
C           one.  Otherwise, we'll have to look up the location of the
C           next d.p. logical address.
C
            IF (  RECNO  .LT.  ( CLBASE + CLSIZE - 1 )  ) THEN
 
               RECNO   =  RECNO + 1
               WORDNO  =  1
 
            ELSE
 
               CALL DASA2L ( HANDLE,
     .                       DP,
     .                       FIRST + NWRITN,
     .                       CLBASE,
     .                       CLSIZE,
     .                       RECNO,
     .                       WORDNO               )
            END IF
 
         END IF
 
      END DO
 
 
      CALL CHKOUT ( 'DASUDD' )
      RETURN
      END
