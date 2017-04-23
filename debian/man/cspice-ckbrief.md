cspice-ckbrief(1) -- displays a summary for binary CK files
===========================================================

SYNOPSIS
--------
**cspice ckbrief** [_options_] _file_ [_file_ ...]

DESCRIPTION
-----------
**CKBRIEF** is a command line program that displays a summary of the
contents and time coverage for one or more binary CK files. The program
displays a summary for each CK file listed on the command line, in a list
file, and/or a meta-kernel. It can display coverage boundaries as ephemeris
time (ET) in calendar format, as UTC time in "year-month-day" or
"day-of-year" format, or as on-board clock (SCLK) time in string or encoded
format. It can display the summary in a variety of formats, with or without
showing the names of the frames associated with spacecraft or structure IDs
or the names/IDs of the frames with respect to which orientation is provided.

In order for the program to display times in the default format or any other
format (except encoded SCLK), both an LSK file and an SCLK file containing
required time correlation data must be provided on the command line, in a
list file (specified with the option **-f** described later in this
document), or in a meta-kernel file given on the command line or in the list
file.

**CKBRIEF** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
### Options Controlling Output Summary Format

 * `-dump`:
    Display a summary of interpolation interval boundaries, the actual time
    periods for which the file provides data, for each of the segments in
    the file.

 * `-nm`:
    Display a summary of segment boundaries for each of the structures in
    the file. This option is ignored when **-dump** is specified.

 * `-rel`:
    Display, in the additional right-hand column, frames with respect to
    which the orientation is given in the CK segments. For frames known to
    SPICE, built-in or defined in the FK files provided to the program along
    with CK, LSK, and SCLK files, the program displays names; for
    unrecognized frames, the program displays IDs. This option is ignored
    when **-g** is specified.

 * `-n`:
    Display frame names associated with the structure IDs instead of the
    numeric structure IDs. For frames known to SPICE, defined in the FK
    files provided to the program, the program displays names; for
    unrecognized frames, the program displays IDs with the prefix "NO FRAME
    FOR <id>".

 * `-t`:
    Use the tabular display format in which coverage information for all
    structures from each file is presented in a single table with the
    structure IDs provided in the left column rather than in the table
    headers.

 * `-g`:
    Use the grouping display format, in which information for structures
    with the same coverage is grouped together into blocks with the coverage
    begin and end time shown first, and the list of structure IDs shown
    below them. This option is ignored when **-dump** or **-t** are specified.

### Options Controlling Output Time Format

In order for the program to display times in the default format or any other
format (except encoded SCLK), both an LSK file and an SCLK file containing
required time correlation data must be provided.

When multiple options controlling the output time format are given at the
same time, the option specified last on the command line takes precedence.

 * `-utc`:
    Display time tags as UTC in the "YYYY-MON-DD HR:MN:SC.DDD" format (needs
    LSK and SCLK).

 * `-utcdoy`:
    Display time tags as UTC times in the "YYYY-DOY // HR:MN:SC.DDD" format
    (needs LSK and SCLK).

 * `-sclk`:
    Display time tags as SCLK strings (needs LSK and SCLK).

 * `-dpsclk`:
    Display time tags as encoded SCLKs (ticks).

### Miscellaneous Options

 * `-a`:
    Display a summary for multiple CKs listed on the command line and/or
    provided in meta-kernels and/or a list file as if all data from these
    CKs were provided in a single CK file.

 * _id_:
    One or more (up to 100) structure IDs may be listed on the command line
    to tell BRIEF to display summary information only for the specified
    structure(s).

 * `-f` _list_file_:
    Display a summary for the files whose names are listed in the text file
    _list_file_. The file names can be provided one-per-line or a
    few-per-line separated by one or more spaces.

 * `-h`:
    Display a complete usage message listing all options and exit.

 * `-v`:
    Display just the version line and exit.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
