C$Procedure      PL2NVC ( Plane to normal vector and constant )
 
      SUBROUTINE PL2NVC ( PLANE, NORMAL, CONST )
 
C$ Abstract
C
C     Return a unit normal vector and constant that define a specified
C     plane.
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
C     PLANES
C
C$ Keywords
C
C     GEOMETRY
C     MATH
C     PLANE
C
C$ Declarations
 
      INTEGER               UBPL
      PARAMETER           ( UBPL    =   4 )
 
      DOUBLE PRECISION      PLANE  ( UBPL )
      DOUBLE PRECISION      NORMAL (    3 )
      DOUBLE PRECISION      CONST
 
C$ Brief_I/O
C
C     Variable  I/O  Description
C     --------  ---  --------------------------------------------------
C     PLANE      I   A SPICELIB plane.
C     NORMAL,
C     CONST      O   A normal vector and constant defining the
C                    geometric plane represented by PLANE.
C
C$ Detailed_Input
C
C     PLANE          is a SPICELIB plane.
C
C$ Detailed_Output
C
C     NORMAL,
C     CONST          are, respectively, a unit normal vector and
C                    constant that define the geometric plane
C                    represented by PLANE.  Let the symbol < a, b >
C                    indicate the inner product of vectors a and b;
C                    then the geometric plane is the set of vectors X
C                    in three-dimensional space that satisfy
C
C                       < X,  NORMAL >  =  CONST.
C
C                    NORMAL is a unit vector.  CONST is the distance of
C                    the plane from the origin;
C
C                       CONST * NORMAL
C
C                    is the closest point in the plane to the origin.
C
C$ Parameters
C
C     None.
C
C$ Exceptions
C
C     Error free.
C
C     1)  The input plane MUST have been created by one of the SPICELIB
C         routines
C
C            NVC2PL ( Normal vector and constant to plane )
C            NVP2PL ( Normal vector and point to plane    )
C            PSV2PL ( Point and spanning vectors to plane )
C
C         Otherwise, the results of this routine are unpredictable.
C
C$ Files
C
C     None.
C
C$ Particulars
C
C     SPICELIB geometry routines that deal with planes use the `plane'
C     data type to represent input and output planes.  This data type
C     makes the subroutine interfaces simpler and more uniform.
C
C     The SPICELIB routines that produce SPICELIB planes from data that
C     define a plane are:
C
C        NVC2PL ( Normal vector and constant to plane )
C        NVP2PL ( Normal vector and point to plane    )
C        PSV2PL ( Point and spanning vectors to plane )
C
C     The SPICELIB routines that convert SPICELIB planes to data that
C     define a plane are:
C
C        PL2NVC ( Plane to normal vector and constant )
C        PL2NVP ( Plane to normal vector and point    )
C        PL2PSV ( Plane to point and spanning vectors )
C
C$ Examples
C
C     1)  Given a point in a plane and a normal vector, find the
C         distance of the plane from the origin.  We make a
C         `plane' from the point and normal, then convert the
C         plane to a unit normal and constant.  CONST is the distance
C         of the plane from the origin.
C
C            CALL NVP2PL ( NORMAL, POINT,  PLANE )
C            CALL PL2NVC ( PLANE,  NORMAL, CONST )
C
C
C     2)  Apply a linear transformation represented by the matrix M to
C         a plane represented by the normal vector N and the constant C.
C         Find a normal vector and constant for the transformed plane.
C
C            C
C            C     Make a SPICELIB plane from N and C, and then find a
C            C     point in the plane and spanning vectors for the
C            C     plane.  N need not be a unit vector.
C            C
C                  CALL NVC2PL ( N,      C,      PLANE         )
C                  CALL PL2PSV ( PLANE,  POINT,  SPAN1,  SPAN2 )
C
C            C
C            C     Apply the linear transformation to the point and
C            C     spanning vectors.  All we need to do is multiply
C            C     these vectors by M, since for any linear
C            C     transformation T,
C            C
C            C           T ( POINT  +  t1 * SPAN1     +  t2 * SPAN2 )
C            C
C            C        =  T (POINT)  +  t1 * T(SPAN1)  +  t2 * T(SPAN2),
C            C
C            C     which means that T(POINT), T(SPAN1), and T(SPAN2)
C            C     are a point and spanning vectors for the transformed
C            C     plane.
C            C
C                  CALL MXV ( M, POINT, TPOINT )
C                  CALL MXV ( M, SPAN1, TSPAN1 )
C                  CALL MXV ( M, SPAN2, TSPAN2 )
C
C            C
C            C     Make a new SPICELIB plane TPLANE from the
C            C     transformed point and spanning vectors, and find a
C            C     unit normal and constant for this new plane.
C            C
C                  CALL PSV2PL ( TPOINT,  TSPAN1,  TSPAN2,  TPLANE )
C                  CALL PL2NVC ( TPLANE,  TN,      TC              )
C
C$ Restrictions
C
C     None.
C
C$ Literature_References
C
C     [1] `Calculus and Analytic Geometry', Thomas and Finney.
C
C$ Author_and_Institution
C
C     N.J. Bachman   (JPL)
C
C$ Version
C
C-    SPICELIB Version 1.0.1, 10-MAR-1992 (WLT)
C
C        Comment section for permuted index source lines was added
C        following the header.
C
C-    SPICELIB Version 1.0.0, 01-NOV-1990 (NJB)
C
C-&
 
C$ Index_Entries
C
C     plane to normal vector and constant
C
C-&
 
 
 
C
C     The contents of SPICELIB planes are as follows:
C
C        Elements NMLPOS through NMLPOS + 2 contain a unit normal
C        vector for the plane.
C
C        Element CONPOS contains a constant for the plane;  every point
C        X in the plane satisifies
C
C           < X, PLANE(NMLPOS) >  =  PLANE(CONPOS).
C
C        The plane constant is the distance of the plane from the
C        origin; the normal vector, scaled by the constant, is the
C        closest point in the plane to the origin.
C
C
      INTEGER               NMLPOS
      PARAMETER           ( NMLPOS = 1 )
 
      INTEGER               CONPOS
      PARAMETER           ( CONPOS = 4 )
 
 
C
C     Unpack the plane.
C
      CALL VEQU ( PLANE(NMLPOS), NORMAL )
      CONST   =   PLANE(CONPOS)
 
      RETURN
      END
