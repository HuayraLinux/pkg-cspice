cspice-msopck(1) -- converts attitude data into a SPICE C-kernel
================================================================

SYNOPSIS
--------
`cspice msopck` _setup_file_ _input_data_file_ _output_ck_file_  
`cspice msopck` [_options_]


DESCRIPTION
-----------
**MSOPCK** is a command-line utility program that generates a new, or appends
data to an existing, attitude data file in SPICE CK format using one of the
following CK types: 1, 2, 3. This CK file is a binary file constructed
according to the SPICE DAF (Double Precision Array File) architecture,
containing one or more CK data segments.

The **MSOPCK** program accepts one ASCII text file containing descriptions of
input data (setup file) and a second ASCII text file (input file) containing
the source attitude data to be processed.

Source attitude data can be time ordered lists of quaternions, Euler angles, or
matrices tagged with UTC, spacecraft on-board clock (SCLK), or Ephemeris Time
(ET) times. All input data must provide attitude for a structure relative to a
reference frame, both of which are specified in the setup file.

The program buffers the input data by chunks of 100,000 records and writes each
chunk into a separate CK segment. It uses the same point as the end of the
previous and the start of the next chunk to provide continuity at the segment
boundary.

The program allows the user to optionally provide some descriptive text
(metadata) in a separate file (comment file) to be placed into the "comment
area" of the CK attitude file. Doing this is highly recommended.

For archival documentation purposes the content of the MSOPCK setup file is
automatically placed into the "comment area" of the CK file.

**MSOPCK** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------

 * `-u`, `-usage`:
    Display a brief usage message. This is the default behaviour if the
    command line has too few or too many arguments.

 * `-h`, `-help`:
    Display a brief help message.

 * `-t`, `-template`:
    Display the complete setup file template.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
