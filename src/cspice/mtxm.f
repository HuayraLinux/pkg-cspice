C$Procedure      MTXM  ( Matrix transpose times matrix, 3x3 )
 
      SUBROUTINE MTXM ( M1, M2, MOUT )
 
C$ Abstract
C
C     Multiply the transpose of a 3x3 matrix and a 3x3 matrix.
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
C     None.
C
C$ Keywords
C
C     MATRIX
C
C$ Declarations
 
      DOUBLE PRECISION   M1   ( 3,3 )
      DOUBLE PRECISION   M2   ( 3,3 )
      DOUBLE PRECISION   MOUT ( 3,3 )
 
C$ Brief_I/O
C
C     VARIABLE  I/O  DESCRIPTION
C     --------  ---  --------------------------------------------------
C     M1         I   3x3 double precision matrix.
C     M2         I   3x3 double precision matrix.
C     MOUT       O   3x3 double precision matrix which is the product
C                    (M1**T) * M2.
C
C$ Detailed_Input
C
C     M1         is any 3x3 double precision matrix. Typically,
C                M1 will be a rotation matrix since then its
C                transpose is its inverse (but this is NOT a
C                requirement).
C
C     M2         is any 3x3 double precision matrix.
C
C$ Detailed_Output
C
C     MOUT       is s 3x3 double precision matrix. MOUT is the
C                product MOUT = (M1**T) x M2.
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
C     The code reflects precisely the following mathematical expression
C
C        For each value of the subscripts I and J from 1 to 3:
C
C        MOUT(I,J) = Summation from K=1 to 3 of  ( M1(K,I) * M2(K,J) )
C
C     Note that the reversal of the K and I subscripts in the left-hand
C     matrix M1 is what makes MOUT the product of the TRANSPOSE of M1
C     and not simply of M1 itself.
C
C$ Examples
C
C     Let M1  = | 1.0D0  2.0D0  3.0D0 |
C               |                     |
C               | 4.0D0  5.0D0  6.0D0 |
C               |                     |
C               | 7.0D0  8.0D0  9.0D0 |
C
C
C         M2  = |  1.0D0   1.0D0  0.0D0 |
C               |                       |
C               | -1.0D0   1.0D0  0.0D0 |
C               |                       |
C               |  0.0D0   0.0D0  1.0D0 |
C
C     then the call
C
C        CALL MTXM ( M1, M2, MOUT )
C
C     produces the matrix
C
C
C        MOUT = | -3.0D0   5.0D0  7.0D0 |
C               |                       |
C               | -3.0D0   7.0D0  8.0D0 |
C               |                       |
C               | -3.0D0   9.0D0  9.0D0 |
C
C
C$ Restrictions
C
C     The user is responsible for checking the magnitudes of the
C     elements of M1 and M2 so that a floating point overflow does
C     not occur.  (In the typical use where M1 and M2 are rotation
C     matrices, this not a risk at all.)
C
C$ Literature_References
C
C     None.
C
C$ Author_and_Institution
C
C     W.M. Owen       (JPL)
C
C$ Version
C
C-    SPICELIB Version 1.0.2, 23-APR-2010 (NJB)
C
C        Header correction: assertions that the output
C        can overwrite the input have been removed.
C
C-    SPICELIB Version 1.0.1, 10-MAR-1992 (WLT)
C
C        Comment section for permuted index source lines was added
C        following the header.
C
C-    SPICELIB Version 1.0.0, 31-JAN-1990 (WMO)
C
C-&
 
C$ Index_Entries
C
C     matrix_transpose times matrix 3x3_case
C
C-&
 
 
C
C     Local variables
C
      DOUBLE PRECISION      PRODM(3,3)

      INTEGER               I
      INTEGER               J

C
C  Perform the matrix multiplication
C
      DO   I=1,3
         DO   J=1,3
            PRODM(I,J) = M1(1,I)*M2(1,J)
     .                 + M1(2,I)*M2(2,J)
     .                 + M1(3,I)*M2(3,J)
         END DO
      END DO

C
C  Move the result into MOUT
C
      CALL MOVED ( PRODM, 9, MOUT )

      RETURN
      END
