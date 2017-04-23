cspice-version(1) -- prints version and details of the CSPICE Toolkit
=====================================================================

SYNOPSIS
--------
`cspice version` [_options_]


DESCRIPTION
-----------
**VERSION** is a command-line program that prints the current version number
of the SPICE Toolkit.

**VERSION** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
To display only the SPICE toolkit version, VERSION should be executed
without command arguments.

 * `-a`, `-all`:
    Display all parameters for the environment for which the toolkit package
    was prepared, including SPICE toolkit version, system ID, operating
    system, compiler, and binary file format, max and min values for double
    precision and integer numbers.

 * `-v`, `-version`:
    Display the version of the VERSION program.

 * `-h`, `-help`:
    Display usage information.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
