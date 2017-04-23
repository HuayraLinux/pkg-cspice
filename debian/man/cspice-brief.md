cspice-brief(1) -- displays a summary for binary SPK or binary PCK files
========================================================================

SYNOPSIS
--------
**cspice brief** [_options_] _file_ [_file_ ...]

DESCRIPTION
-----------
**BRIEF** is a command line program that displays summary of the contents
and time coverage for one or more binary SPK or binary PCK files.

The program can display a summary for each individual file listed on the
command line, in a list file, and/or a meta-kernel, or for all files as if they
were combined into a single file. It can display coverage boundaries as
Ephemeris Times (ET) in calendar format, if requested rounded to the nearest
second, minute, hour, or day, as ET seconds past J2000, as UTC times in
"year-month-day" format , or as UTC times in "day-of-year" format.

**BRIEF** can restrict summary display to only specified bodies or frames
and/or specified centers-of-motion or relative-to-frames and/or for a specified
time or time interval. It can display the summary in a variety of formats,
ordered by body or frame names or numeric IDs, with or without showing
centers-of-motion or relative-to-frames.

An LSK file must be provided on the command line to display times in UTC
formats. FK file(s) must be provided on the command line to display names of
any frames that are not built into the Toolkit.

**BRIEF** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
### Options Controlling Output Summary Format

 * `-c`:
    Display bodies/frames in the format that shows their centers-of-motion
    (for SPKs) or relative-to-frames (for binary PCKs).

 * `-a`:
    Treat all files as a single file. Display combined summary for all files
    as if all data from these files were merged into a single file.

 * `-t`:
    Display summary in a tabular format.

 * `-s`:
    Re-order records in the tables of the tabular output in such way that
    the records for a particular body or frame are grouped together and
    sorted by the start time within each group. This option supersedes
    **-g** and has no effect without **-t**. This option re-sorts tabular
    display tables already ordered by **-o**.

 * `-g`:
    Re-order records in the tables of the tabular output such that all
    records with the same coverage are grouped together. This option has no
    effect  without **-t** and it regroups tables already ordered by **-o**.

 * `-n`:
    Display bodies/frames using numeric IDs ("ID") rather than the default
    name/ID combinations ("NAME (ID)").

 * `-o`:
    Order bodies/frames in the table headers in the default display, or in
    the left columns in the tabular display, by name rather than by numeric
    ID. This option is ignored when **-n** is specified.

### Options Controlling Output Time Format

If more than one of the **-sec**, **-min**, **-hour**, and **-day** options
is specified, the one providing the "highest" time resolution takes
precedence, namely **-sec** > **-min** > **-hour** > **-day**.

 * `-etsec`:
    Display time tags as ET seconds past J2000 in the "SSSSSSSSSSSS.DDDDDD"
    format.

 * `-utc`:
    Display time tags as UTC in the "YYYY-MON-DD HR:MN:SC.DDD" format (needs
    LSK).

 * `-utcdoy`:
    Display time tags as UTC times in the "YYYY-DOY // HR:MN:SC.DDD" format
    (needs LSK).

 * `-sec`:
    Display default calendar ET time tags "rounded inward" to the nearest
    second. This option has no effect when either **-etsec**, **-utc** or
    **-utcdoy** is used.

 * `-min`:
    Display default calendar ET time tags "rounded inward" to the nearest
    minute. Effectiveness and precedence rules for the **-sec** apply to
    this option as well.

 * `-hour`:
    Display default calendar ET time tags "rounded inward" to the nearest
    hour. Effectiveness and precedence rules for the **-sec** apply to this
    option as well.

 * `-day`:
    Display default calendar ET time tags "rounded inward" to the nearest
    day. Effectiveness and precedence rules for the **-sec** apply to this
    option as well.

### Options Filtering Summary

 * `-sb`_bod_, `-sb`_[min,max]_, `-`_bod_:
    Display summary information only for the specified body/frame name or
    numeric ID _bod_. The use of just **-** followed by the body/frame name or
    numeric ID is deprecated. If the body/frame name contains spaces, these
    spaces must be replaced with underscores ("\_"). A range of numeric IDs in
    the form _[min,max]_ may be used instead of a single name or numeric ID.
    The range can be open on either end, producing a summary for all numeric
    IDs greater than the specified value (_[min,:]_) or less than the specified
    value (_[:,max]_). Up to 100 individual **-sb** and **-sc** constraints can
    be specified at the same time, they will be combined using logical "OR".

 * `-sc`_cen_, `-sc`_[min,max]_:
    Display summary information only for the specified
    center-of-motion/relative-to-frame name or numeric ID _cen_. Formatting
    rules for the **-sb** option apply to this option as well.

 * `-at` _time_:
    Display summary information only for the bodies/frames whose coverage
    intervals contains the specified _time_. The time can be provided in any
    format supported by SPICE's TPARSE routine as long as it doesn't contain
    spaces. This option overrides **-from**/**-to**.

 * `-from` _beg_ `-to` _end_:
    Display summary information only for the bodies/frames whose coverages
    contain the specified time interval. Formatting rules for the **-at**
    option apply to this option as well. If either **-from** or **-to** is
    specified by itself it has the same effect as the **-at** option. If the
    time provided with **-from** is later than the time provided with **-to**
    they will be re-ordered internally.

### Miscellaneous Options

 * `-f` _list_:
    Display a summary for the files whose names are listed in the text file
    _list_. The file names can be provided one-per-line or a few-per-line
    separated by one or more spaces.

 * `-h`:
    Display a complete usage message listing all options and exit.

 * `-v`:
    Display just the version line and exit.

SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on http://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
