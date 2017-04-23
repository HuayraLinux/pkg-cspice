cspice-spkdiff(1) -- compare or sample trajectories of two bodies
=================================================================

SYNOPSIS
--------
`cspice spkdiff` [_options_] _first_spk_ _second_spk_  
`cspice spkdiff` [_options_] _first_spk_  
`cspice spkdiff` **-v** | **-u** | **-h**


DESCRIPTION
-----------
**SPKDIFF** provides means for comparing the trajectories of two bodies or
sampling the trajectory of a single body known to SPICE and supported by
data from SPICE kernels.

To compare trajectories the program computes a set of geometric states of a
body as seen from a center in a reference frame over an interval of time
with a fixed or variable time step using one SPK file, computes a set of
geometric states for the same or different body-center-frame combination at
the same times using the other SPK file, and then subtracts the
corresponding states from each other. Depending on the type of output report
requested the program prints to the screen only the maximum differences in
position and velocity, or a complete table of position and velocity
differences, or a complete table of differences expressed in "view frame"
coordinates, or results of a simple statistical analysis of the differences
expressed in "view frame" coordinates.

To sample trajectory of a body the program computes a set of geometric
states of a body as seen from a center in a reference frame over an interval
of time with fixed or variable time step, using a given set of kernel files,
and prints to the screen a table containing these states.

**SPKDIFF** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
The order of options and case of the option keys are not significant. The
values provided after the option keys must be separated from the keys by one
or more spaces. Unrecognized options are not specifically checked for;
instead they are treated as continuation of the value provided using the
preceding recognized option.

 * `-k` _kernel_ ...:
    Specify the list of additional kernels or meta-kernels that are needed
    for both trajectories to be computed. File names following **-k** must
    be separated by spaces.

 * `-b1` _body_:
    Specify the body for the first trajectory to be computed. This body can
    be specified using its NAIF ID or name. If the name is used, it must be
    either built into SPICE or defined by kernels provided using the **-k**
    and **-k1** options.

 * `-c1` _body_:
    Specify the center for the first trajectory to be computed. This center
    can be specified using its NAIF ID or name. If the name is used, it must
    be either built into SPICE or defined by kernels provided using the
    **-k** and **-k1** options.

 * `-r1` _frame_:
    Specify the name of the reference frame for the first trajectory to be
    computed. The frame can be any of the frames built into SPICE or frames
    defined by kernels provided using the **-k** and **-k1** options.

 * `-k1` _kernel_ ...:
    Specify the list of additional kernels or meta-kernels that are needed
    only for the first trajectory to be computed.

 * `-b2` _body_:
    Specify the body for the second trajectory to be computed. This body can
    be specified using its NAIF ID or name. If the name is used, it must be
    either built into SPICE or defined by kernels provided using the **-k**
    and **-k2** options.

 * `-c2` _body_:
    Specify the center for the second trajectory to be computed. This center
    can be specified using its NAIF ID or name. If the name is used, it must
    be either built into SPICE or defined by kernels provided using the
    **-k** and **-k2** options.

 * `-r2` _frame_:
    Specify the name of the reference frame for the second trajectory to be
    computed. The frame can be any of the frames built into SPICE or frames
    defined by kernels provided using the **-k** and **-k2** options.

 * `-k2` _kernel_ ...:
    Specify the list of additional kernels or meta-kernels that are needed
    only for the second trajectory to be computed.

 * `-b` _time_:
    Specify the coverage window begin time. The time string provided using
    this option can be in any form accepted by SPICE. If this option is
    provided, the name of an LSK file must be provided with the **-k**,
    **-k1**, or **-k2** option.

 * `-e` _time_:
    Specify the coverage window end time. The time string provided using
    this option can be in any form accepted by SPICE. If this option is
    provided, the name of an LSK file must be provided with the **-k**,
    **-k1**, or **-k2** option.

 * `-s` _step_:
    Specify the step, in TDB seconds, for determining points within the
    coverage window, for which the trajectory(ies) are to be computed. The
    step must be greater than 1E-8. This option supersedes **-n**.

 * `-n` _number_:
    Specify the number of points within the coverage window, for which the
    trajectory(ies) are to be computed. The number must be an integer
    between 2 and 1,000,000. The default value is 1000.

 * `-f` _time_type_ ...:
    Specify the output time format other than the default TDB seconds past
    J2000. The value can be any time format picture accepted by SPICE. For
    example to display time tags as UTCs in ISO date format use
    'YYYY-MM-DDTHR:MN:SC.### ::RND', to display time tags as TDB Julian days
    use 'JULIAND.######### ::TDB'.

 * `-d` _number_:
    Specify the number of significant digits in the output numeric times
    (TDB seconds past J2000) and state component values or state component
    difference values included in the dump, coverage and coverage gap
    reports. The number must be an integer between 6 and 17. The default
    value is 14.

 * `-t` _report_type_:
    Specify the type of report that the program should display. If
    _report_type_ is **basic**, it will display only the absolute and
    relative maximum and average differences in magnitude of position and
    velocity vectors. This is the default type for comparison runs.  
    If _report_type_ is **stats**, it will display statistics on position
    differences rotated into the view frame.  
    If _report_type_ is **dump**, it will display a table of positions and
    velocities or their differences.  This is the default type for sampling
    runs.  
    If _report_type_ is **dumpvf**, it will display a table of position and
    velocity differences rotated into the view frame.  
    If _report_type_ is **dumpc**, it will display a table of coverage
    intervals.  
    If _report_type_ is **dumpg**, it will display a table of gaps in
    coverage.

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
