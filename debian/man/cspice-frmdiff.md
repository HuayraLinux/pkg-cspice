cspice-frmdiff(1) -- compute differences between two reference frames
=====================================================================

SYNOPSIS
--------
`cspice frmdiff` [_options_] _first_kernel_ _second_kernel_  
`cspice frmdiff` [_options_] _kernel_  
`cspice frmdiff` [_options_]


DESCRIPTION
-----------
**FRMDIFF** provides means for sampling orientation of a single reference
frame, or for comparing orientations of two reference frames known to SPICE
and supported by data from SPICE kernels.

To sample orientation of a single frame the program computes a set of
transformations from one frame (the "from" frame) to another frame (the
"to" frame) over an interval of time with fixed or variable time step,
using a given set of kernel files. Then, depending on the requested type of
output report, it prints to the screen a table containing these
transformations expressed as total rotation angles and axes, quaternions,
matrices or Euler angles and angular velocities, or only magnitude of the
maximum rotation and angular velocity, or results of a simple statistical
analysis of rotations.

To compare orientations of two frames the program computes a set of
transformations from one frame (the "from" frame) to another frame (the "to"
frame) over an interval of time with a fixed or variable time step using one
set of kernels, computes a set of transformations for the same or a
different "from"-"to" frame combination at the same times using the same or
a different set of kernels, and then computes the difference in rotation and
angular velocity between the corresponding transformations. Depending on the
requested type of output report the program prints to the screen only
maximum differences in rotation and angular velocity, or a complete table of
rotation and angular velocity differences expressed as total rotation angles
and axes, matrices, quaternions, or Euler angles, or results of a simple
statistical analysis of the rotation differences.

**FRMDIFF** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
 * `-k` _kernel_ ...:
    Specify the list of additional kernels that should be used for both
    frame transformations to be computed. Kernel names must be separated by
    spaces.

 * `-f1` _frame_:
    Specify the "from" frame for the first (or only) frame transformation to
    be computed. This frame must be known to SPICE and can be specified
    using the frame name, ID, or class ID.

 * `-t1` _frame_:
    Specify the "to" frame for the first (or only) frame transformation to
    be computed. This frame must be known to SPICE and can be specified
    using the frame name, ID, or class ID.

 * `-c1` _frame_:
    Specify the "coverage" frame to be used to look up the first coverage
    window. This frame must be known to SPICE and must be either a PCK-based
    (Class 2) or CK-based (Class 3) frame. It can be specified using the
    frame name, frame ID, or, if the first (or only) primary kernel is a CK
    or a binary PCK, class ID. If the first (or only) primary kernel file is
    a CK or a binary PCK, it must contain data for this frame.

 * `-k1` _kernel_ ...:
    Specify the list of additional kernels that should be used only for the
    first frame transformation to be computed. Kernel names must be
    separated by spaces.

 * `-f2` _frame_:
    Specify the "from" frame for the second (or only) frame transformation
    to be  computed. This frame must be known to SPICE and can be specified
    using the frame name, ID, or class ID.

 * `-t2` _frame_:
    Specify the "to" frame for the second (or only) frame transformation to
    be computed. This frame must be known to SPICE and can be specified
    using the name, ID, or class ID.

 * `-c2` _frame_:
    Specify the "coverage" frame to be used to look up the second coverage
    window. This frame must be known to SPICE and must be either a PCK-based
    (Class 2) or CK-based (Class 3) frame. It can be specified using the
    frame name, frame ID, or, if the second (or only) primary kernel is a CK
    or a binary PCK, class ID. If the second (or only) primary kernel file
    is a CK or a binary PCK, it must contain data for this frame.

 * `-k2` _kernel_ ...:
    Specify the list of additional kernels that should be used only for the
    second frame transformation to be computed. Kernel names must be
    separated by spaces.

 * `-b` _time_:
    Specify the coverage window begin time. This option must be provided
    when no primary kernels and "coverage" frames are specified. The time
    string provided using this option can be in any form accepted by SPICE.

 * `-e` _time_:
    Specify the coverage window end time. This option must be provided when
    no primary kernels and "coverage" frames are specified. The time string
    provided using this option can be in any form accepted by SPICE.

 * `-n` _number_:
    Specify the number of points within the coverage window, for which the
    frame transformation(s) must be computed. The number must be an integer
    between 1 and 1,000,000. The default value is 1000.

 * `-s` _step_:
    Specify the step, in seconds, for determining points within the coverage
    window, for which the frame transformation(s) must be computed. The step
    must be greater than 1E-8. This option supersedes **-n**.

 * `-t` _report_type_:
    Specify the type of report that the program should display. By default,
    _report_type_ is **basic**, which means it will display only the maximum
    rotation angle and angular velocity (AV) magnitude.  
    If _report_type_ is **stats**, it will display statistics on rotation
    angles and AVs.  
    If _report_type_ is **dumpaa**, it will display a table of rotation
    angles and axes.  
    If _report_type_ is **dumpm**, it will display a table of matrices.  
    If _report_type_ is **dumpqs**, it will display a table of SPICE-style
    quaternions.  
    If _report_type_ is **dumpqo**, it will display a table of "other"-style
    quaternions.  
    If _report_type_ is **dumpea**, it will display a table of Euler angles.  
    If _report_type_ is **dumpc**, it will display a table of coverage
    intervals.  
    If _report_type_ is **dumpg**, it will display a table of coverage gaps.

 * `-a` _av_flag_:
    Tell the program whether angular velocities should be computed along
    with rotations. By default, _av_flag_ is **no**, which means that only
    rotations are computed. If _av_flag_ is **yes**, rotations and angular
    velocities are computed.

 * `-m` _av_frame_:
    Tell the program in which frame angular velocities should be reported.
    By default, _av_frame_ is **from**, which means it will output angular
    velocities in "from" frame. If _av_frame_ is **to**, it will output
    angular velocities in "to" frame.

 * `-f` _time_type_:
    Specify the type of time tag to be used in tabular reports. By default,
    _time_type_ is **et**, which means it will display times as TDB seconds
    past J2000.  
    If _time_type_ is **sclk**, it will display times as string SCLKs.  
    If _time_type_ is **sclkd**, it will display times as decimal SCLKs.  
    If _time_type_ is **ticks**, it will display times as encoded SCLK ticks.  
    _time_type_ can also be any time format picture accepted by the TIMOUT
    routine (for example "YYYY-MM-DDTHR:MN:SC.### ::RND" for time tags for
    be displayed as UTCs in ISO date format)

 * `-o` _axes_:
    Specify the list of axes determining the order of rotations used for
    converting rotation matrices to Euler angles. The value must be a
    space-delimited list of three axes from the set of "X", "Y", "Z"
    (case-insensitive). The second axis must differ from the first and third
    axes. The default order is "Z Y X".

 * `-x` _unit_:
    Specify the units for the angles in the rotation angle and axis dump
    (**-t dumpaa**) and Euler angle dump (**-t dumpea**) reports; ignored
    for all other report types. Supported units are: **radians** (by
    default), **degrees**, **arcminutes**, **arcseconds**, **hourangle**,
    **minuteangle** and **secondangle**.

 * `-d` _number_:
    Specify the number of significant digits in the output numeric times
    (TDB seconds past J2000, decimal SCLKs and encoded SCLK ticks) and
    rotation component values or rotation difference component values
    included in the dump, coverage and coverage gap reports. The number must
    be an integer between 6 and 17. The default value is 14.

 * `-v`:
    Display only the version line. This option overrides all other options.

 * `-u`:
    Display the usage message. This option overrides all other options
    except **-v**.

 * `-h`:
    Display a brief help message. This option overrides all other options
    except **-v** and **-u**.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
