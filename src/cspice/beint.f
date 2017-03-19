C$Procedure            BEINT  ( Be an Integer? )
 
      LOGICAL FUNCTION BEINT  ( STRING )
 
C$ Abstract
C
C     Determine whether a string represents an integer.
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
C     WORDS
C
C$ Keywords
C
C     ALPHANUMERIC
C     NUMBERS
C     SCANNING
C     UTILITY
C
C$ Declarations
 
      CHARACTER*(*)         STRING
 
C$ Brief_I/O
C
C     Variable  I/O  Description
C     --------  ---  --------------------------------------------------
C     STRING     I   Character string.
C
C     The function returns TRUE if the string represents an integer.
C     Otherwise, it returns FALSE.
C
C$ Detailed_Input
C
C     STRING      is any string.
C
C$ Detailed_Output
C
C     If the input string contains an integer (as defined in
C     $Particulars below), the function returns TRUE. Otherwise,
C     the function returns FALSE.
C
C$ Parameters
C
C     None.
C
C$ Exceptions
C
C     Error free.
C
C$ Files
C
C     None.
C
C$ Particulars
C
C      An integer may be either of the following:
C
C         1) An unsigned integer (as defined by function BEUNS).
C
C         2) A sign ('+' or '-') followed by an unsigned
C            integer.
C
C$ Examples
C
C     Four classes of numbers recognized by the various BE functions.
C
C        UNS      unsigned integer
C        INT      integer                (includes INT)
C        DEC      decimal number         (includes UNS, INT)
C        NUM      number                 (includes UNS, INT, NUM)
C
C     The following table illustrates the differences between
C     the classes. (Any number of leading and trailing blanks
C     are acceptable.)
C
C        String                  Accepted by
C        ------------------      ------------------
C        0                       UNS, INT, DEC, NUM
C        21
C        21994217453648
C
C        +0                      INT, DEC, NUM
C        -13
C        +21946
C
C        1.23                    DEC, NUM
C        12.
C        .17
C        +4.1
C        -.25
C
C        2.3e17                  NUM
C        17.D-13275849
C        -.194265E+0004
C
C     Note that the functions don't take the magnitudes of the numbers
C     into account. They may accept numbers that cannot be represented
C     in Fortran variables. (For example, '2.19E999999999999' probably
C     exceeds the maximum floating point number on any machine, but
C     is perfectly acceptable to BENUM.)
C
C     The following strings are not accepted by any of the functions.
C
C        String             Reason
C        ---------------    ----------------------------------------
C        3/4                No implied operations (rational numbers)
C        37+14              No explicit operations
C        E12                Must have mantissa
C        217,346.91         No commas
C        3.14 159 264       No embedded spaces
C        PI                 No special numbers
C        FIVE               No textual numbers
C        CXIV               No roman numerals
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
C     W.L. Taber     (JPL)
C
C$ Version
C
C-    SPICELIB Version 1.0.0, 01-DEC-1995 (WLT)
C
C-&
 
C$ Index_Entries
C
C     determine if a string is an integer
C
C-&
 
      INTEGER               FRSTNB
      LOGICAL               BEUNS
 
      INTEGER               I
      INTEGER               L
 
 
      CHARACTER*(1)         LETTER
 
 
C
C     Find the first non-blank character and the length of the
C     string.
C
      L  =  LEN    ( STRING )
      I  =  FRSTNB ( STRING )
 
C
C     If there isn't a non-blank character, this isn't an
C     integer.
C
      IF ( I .EQ. 0 ) THEN
         BEINT  = .FALSE.
         RETURN
      END IF
 
 
C
C     Copy the first non-blank letter in the string.
C
      LETTER = STRING(I:I)
 
      IF      ( I .LT. L ) THEN
 
C
C        The first character is not the last, so we might start with
C        a plus or minus.  If so the rest must be an unsigned integer.
C
         IF (      ( LETTER .EQ. '+' )
     .        .OR. ( LETTER .EQ. '-' ) ) THEN
 
            I    = I + 1
 
            IF ( STRING(I:I) .NE. ' ' ) THEN
               BEINT = BEUNS ( STRING(I:) )
            ELSE
               BEINT = .FALSE.
            END IF
 
         ELSE
 
C
C           If the first character isn't plus (+) or minus (-)
C           the string must be an unsigned integer if its going
C           to be an integer.
C
            BEINT = BEUNS ( STRING(I:) )
 
         END IF
 
      ELSE
 
C
C        If the first (non-blank) character is the last one, then
C        it must be an unsigned integer, for the string to
C        represent an integer.
C
         BEINT = BEUNS ( LETTER )
 
      END IF
 
      RETURN
      END
