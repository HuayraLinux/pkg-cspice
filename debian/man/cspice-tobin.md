cspice-tobin(1) -- converts transfer format SPICE files to binary format
========================================================================

SYNOPSIS
--------
`cspice tobin` _transfer_format_file_ [_binary_format_file_]


DESCRIPTION
-----------
**TOBIN** converts a SPICE transfer format SPK, CK, PCK, DSK and EK file
into it's binary format for use in a particular computing environment.
**TOBIN** requires at least the name of the input transfer file, which is
the first argument on the command line. Optionally, a name for the output
binary file may be specified as the second argument on the command line. If
a name for the output file is provided it overrides the automatic naming
conventions used by the program.

If only the name of the input transfer file is provided on the command line,
TOBIN will generate a name for the output binary kernel file that has the
same base name as the input transfer file and an appropriate filename
extension, based on the filename extension of the transfer file. If
**TOBIN** does not recognize the filename extension of the input transfer
file, or there is no filename extension on the input transfer file, a
filename extension of '.bin' will be used as the filename extension of the
output binary file. If a file having the same name as the output file
already exists, **TOBIN** signals an error and stops. We assume that it is
bad form to overwrite or replace an existing file.

**TOBIN** recognizes the transfer filename extensions ".xc", ".xee", ".xpc",
and ".xsp" associated with transfer files for SPICE data products. These are
converted to the SPICE binary kernel filename extensions ".bc", ".bee",
".bpc", and ".bsp," respectively. Also recognized are the old transfer file
extensions ".tc", ".tee", ".tpc", and ".tsp," which are converted into the
appropriate filename extensions for a binary kernel file.

**TOBIN** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
