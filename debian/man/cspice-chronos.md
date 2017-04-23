cspice-chronos(1) -- convert time from one supported system/type to another
===========================================================================

SYNOPSIS
--------
 * **cspice chronos**:
                    **-setup** _file_  
                    **-from** _time_system_  
                    **-to** _time_system_  
                    **-time** _input_time_ | **-batch**  
                    [_options_]

DESCRIPTION
-----------
**CHRONOS** is a utility program that converts time between various time
systems. It supports the following time systems:

 * UTC:
    Universal Time Coordinated; UTC is a system of time keeping that gives a
    name to each instant of time of the International Atomic Time system;
    refer to the NAIF Toolkit TIME.REQ document for more discussion
    regarding UTC;

 * ET:
    Ephemeris Time; Ephemeris time is the uniform time scale represented by
    the independent variable in the differential equations that describe the
    motions of the planets, sun and moon. CHRONOS deals with one of the two
    forms of ET -- Barycentric Dynamical Time (TDB) which is used when
    describing the motion of bodies with respect to the solar system
    barycenter; refer to the NAIF Toolkit TIME.REQ document for more
    discussion regarding ET;

 * SCLK:
    Spacecraft On-Board Clock Time; SCLK is the on-board time-keeping
    mechanism that triggers most spacecraft events and is the fundamental
    time measurement for referencing most spacecraft activities and
    instrument data; refer to the NAIF Toolkit SCLK.REQ document for more
    discussion regarding SCLK;

 * LST:
    Local Solar Time; LST is simply a measure of angles between landing
    (sub-spacecraft) and sub-solar meridians on the surface of a body
    expressed as a "24 hour" local clock.

**CHRONOS** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
Command line keys '-XXXXXXX' are case insensitive. Any of the command line
options can be present in the command line multiple times (in such cases the
last appearance of a key takes precedence.) The order in which options are
specified is insignificant.

 * `-setup` _setup_file_:
    Specify a setup file name or directly list the names of the SPICE
    kernels to be used. If _setup_file_ is not present or is blank, it tries
    to obtain it from the environment variable CHRONOS_SETUP_FILE.

 * `-from` _time_system_:
    Specify the time system of the input time.

 * `-fromtype` _time_type_:
    Specify the time type of the input time. If it's not present or is
    blank, it is assumed the default time type for the input time system
    (SCET for UTC and ET, SCLK for SCLK, and LST for LST).

 * `-to` _time_system_:
    Specify the time system of the output time.

 * `-totype` _time_type_:
    Specify the time type of the output time. If it's not present or is
    blank, it is assumed the default time type for the output time system
    (SCET for UTC and ET, SCLK for SCLK and LST for LST).

 * `-format` _output_format_:
    Specify a custom format for the output time. If a format specification
    is not present or is blank, it looks for a specification in the setup
    file and, if such is also not available, it uses the default format.

 * `-time` _time_:
    Specify the input time. Most time types of UTC and ET systems require
    input time to be in a form of a time string recognized by TIME subsystem
    of SPICE.

 * `-batch`:
    Tell the program to take input time(s) from standard input instead of
    the command line. If it's present, the program ignores any input time
    provided after the **-time** option.

 * `-sc` _sc_id_:
    Specify the NAIF ID for the spacecraft. If _sc_id_ is not present, the
    program looks for it in the setup file.

 * `-center` _body_id_:
    Specify the NAIF ID for the center body. If _body_id_ is not present,
    the program looks for it in the setup file.

 * `-landingtime` _time_:
    Specify the UTC time of the landing. If _time_ is not present, the
    program looks for it in the setup file.

 * `-sol1index` _index_:
    Specify the SOL index for the first day on surface. If _index_ is not
    present, the program looks for it in the setup file.

 * `-nolabel`:
    Tell the program to not display [SYSTEM]/[TYPE] following the output
    time string.

 * `-trace`:
    Tell the program to display trace information including, complete
    command line, names of the loaded SPICE kernel files, all relevant setup
    information, etc. This option overrules the **-nolabel** option.

 * `-template`:
    Display setup file template.

 * `-h`, `-help`:
    Display help information.

 * `-u`, `-usage`:
    Display usage information.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
