cspice-dskbrief(1) -- displays a summary for binary DSK files
=============================================================

SYNOPSIS
--------
**cspice dskbrief** [_options_] _file_ [_file_ ...]

DESCRIPTION
-----------
**DSKBRIEF** displays a summary of the spatial coverage and additional
attributes of one or more binary Digital Shape Kernel (DSK) files.

A DSK summary includes at a minimum:

 * The names or ID codes of the body or bodies for which the DSK provides data

 * The surface names or surface ID codes associated with the bodies (see the
   DSK Required Reading, dsk.req, for a discussion of surfaces.)

 * The names or ID codes of the reference frames relative to which DSK data are
   expressed

 * The coordinate systems used to describe spatial coverage

 * The bounds of the spatial regions for which the DSK provides data

Coverage for multiple DSK segments and files can be aggregated and displayed as
though the DSK data were contained in a single file.

The user can command **DSKBRIEF** to produce detailed summaries,
including summaries of individual DSK segments. See the Usage section and the
command examples below.

An LSK file must be provided on the command line to display times in UTC
formats. FK file(s) must be provided on the command line to display names of
any frames that are not built into the Toolkit.

**DSKBRIEF** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
The options can be provided in any order and can appear before, after, or
intermixed with file names. The case of option keys is significant: they must
be lowercase as shown below.

  * `-a`:
    Treat all DSK files as a single file. This option has no effect when either
    **-full** or **-seg** is used.

 * `-gaps`:
    Display coverage gaps. This option applies to sets of DSK files only when
    **-a** is used. It applies to sets of matching segments within a given DSK
    file unless **-full** or **-seg** are used.

 * `-ext`:
    Display extended summaries: in addition to the default set of attributes,
    these include data type, data class, and time bounds. This option applies
    to summaries of groups of DSK segments. This option has no effect when
    either **-full** or **-seg** is used.

 * `-seg`:
    Display a segment-by-segment summary. This option overrides **-a**.

 * `-full`:
    Display a detailed summary for each segment, including data-type-specific
    parameters. This option implies a segment-by-segment summary. This option
    overrides **-a**.

 * `-d` _n_:
    Display _n_ significant digits of floating point values. The range of n is
    3:17.

 * `-v`:
    Display the version of this program.

 * `-h`:
    Display help text.

 * `-u`:
    Display usage text.

SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on http://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
