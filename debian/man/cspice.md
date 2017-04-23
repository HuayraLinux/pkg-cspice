cspice(7) -- contents summary of the CSPICE Toolkit utilities
=============================================================


DESCRIPTION
-----------
This documentation summarizes the different utilities comprising the CSPICE
Toolkit and a brief description of the various files where SPICE stores its
data, often called "kernels" or "kernel files".


TOOLKIT UTILITIES
-----------------

 * `BRIEF`:
    A command-line utility program that displays a contents and time coverage
    summary for one or more binary SPK or binary PCK files. See
    **cspice-brief**(1).

 * `CHRONOS`:
    A command-line program that converts between several time systems and time
    formats, e.g. UTC to ET, ET to SCLK, etc. See **cspice-chronos**(1).

 * `CKBRIEF`:
    A command-line utility program that displays a contents and time coverage
    summary for one or more binary CK files. See **cspice-ckbrief**(1).

 * `COMMNT`:
    A command-line program that reads, adds, extracts, or deletes comments from
    SPICE binary kernel files. See **cspice-commnt**(1).

 * `DSKBRIEF`:
    A command-line utility program that displays a summary of the spatial
    coverage and additional attributes of one or more binary Digital Shape
    Kernel (DSK) files. See **cspice-dskbrief**(1).

 * `DSKEXP`:
    A command-line program that exports data from DSK files to text files. See
    **cspice-dskexp**(1).

 * `FRMDIFF`:
    A program that samples orientation of a reference frame known to SPICE or
    computes differences between orientations of two reference frames known to
    SPICE, and either displays this orientation or these differences, or shows
    statistics about it or them. See **cspice-frmdiff**(1).

 * `INSPEKT`:
    An interactive program that examines the contents of an events component
    (ESQ) of an E-kernel. See **cspice-inspekt**(1).

 * `MKDSK`:
    A utility program that creates a SPICE Digital Shape Kernel (DSK) file from
    a text file containing shape data for an extended object. See
    **cspice-mkdsk**(1).

 * `MKSPK`:
    A program that creates an SPK file from a text file containing trajectory
    information. See **cspice-mkspk**(1).

 * `MSOPCK`:
    A command-line program that converts attitude data provided in a text file
    as UTC, SCLK, or ET-tagged quaternions, Euler angles, or matrices,
    optionally accompanied by angular velocities, into a type 1, 2, or 3 SPICE
    C-kernel. See **cspice-msopck**(1).

 * `SPACIT`:
    An interactive program that converts kernels in transfer format to binary
    format, converts binary kernels to transfer format, and summarizes the
    contents of binary kernels. See **cspice-spacit**(1).

 * `SPKDIFF`:
    Provides means for comparing the trajectories of two bodies or sampling the
    trajectory of a single body using data from SPICE kernels. See
    **cspice-spkdiff**(1).

 * `SPKMERGE`:
    A program that subsets or merges one or more SPK files into a single SPK
    file. See **cspice-spkmerge**(1).

 * `TOBIN`:
    A command-line program that converts transfer format SPK, CK, PCK, DSK and
    EK files to binary format. See **cspice-tobin**(1).

 * `TOXFR`:
    A command-line program that converts binary format SPK, CK, PCK, DSK and EK
    files to transfer format. See **cspice-toxfr**(1).

 * `VERSION`:
    A command line utility used to display the current version number of the
    SPICE Toolkit. See **cspice-version**(1).


SPICE KERNELS
-------------
SPICE kernels are composed of navigation and other ancillary information that has been structured and formatted for easy access and correct use by the planetary science and engineering communities. A kernel may store data in either text (ASCII) or binary format. SPICE kernel file contents are summarized below:

 * _Spacecraft and Planet Kernel_ (**SPK**):
    Spacecraft, planet, satellite, comet, or asteroid ephemerides, or more
    generally, location of any target body, given as a function of time.

 * _Planetary Constants Kernel_ (**PCK**):
    Physical, dynamical and cartographic constants for target bodies, such as
    size and shape specifications, and orientation of the spin axis and prime
    meridian.

 * _Instrument Kernel_ (**IK**): 
    Description kernel, containing descriptive data peculiar to a particular
    scientific instrument, such as field-of-view size, shape and orientation
    parameters.

 * _C-matrix Kernel_ (**CK**):
    Pointing kernel, containing a transformation, traditionally called the
    "C-matrix," which provides time-tagged pointing (orientation) angles for a
    spacecraft bus or a spacecraft structure upon which science instruments are
    mounted. A C-kernel may also include angular rate data for that structure.

 * _Events Kernel_ (**EK**):
    Kernel summarizing mission activities - both planned and unanticipated.
    Events data consists of three components: science plans, sequences, and
    notes.

 * _Frames Kernel_ (**FK**):
    Contains specifications for the assortment of reference frames that are
    typically used by flight projects. This file also includes mounting
    alignment information for instruments, antennas and perhaps other
    structures of interest.

 * _Spacecraft CLock Kernel_ (**SCLK**):
    Spacecraft's clock correlation data.

 * _Leap Seconds Kernel_ (**LSK**)

 * _Digital Shape Kernel_ (**DSK**):
    Digital shape model for both small, irregularly shaped bodies such as
    asteroids and comet nuclei, and for large, more uniformly shaped bodies
    such as the moon, earth and Mars.


SEE ALSO
--------
Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
