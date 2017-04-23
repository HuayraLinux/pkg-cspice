cspice-spkmerge(1) -- subset or merge one or more SPICE SPK files
=================================================================

SYNOPSIS
--------
`cspice spkmerge` [_command_file_]


DESCRIPTION
-----------
**SPKMERGE** builds new SPK files by merging entire or subsets of one or
more existing SPK files. **SPKMERGE** creates SPK kernels that have no
overlapping ephemeris; the order in which source files are specified
determines the precedence when source files contain overlapping data.

**SPKMERGE** reads all its instructions from a command file. A command file
is an ASCII formatted file containing `KEYWORD = value' assignments. The
format of this file is thoroughly described in the documentation file
spkmerge.ug.

**SPKMERGE** will prompt for the name of the command file when you start the
program. Alternately, you can name the command file as the only argument on
the command line.

**SPKMERGE** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
