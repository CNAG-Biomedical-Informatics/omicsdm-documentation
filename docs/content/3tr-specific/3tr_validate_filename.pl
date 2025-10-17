#!/usr/bin/env perl
# Author: Manuel Rueda (manuel.rueda@cnag.eu)
# Date: Oct-17-2025
#
# Minimal filename validator for the 3TR clinical naming convention.
# Usage: perl validate_filename_simple.pl <filename>
# Exits 0 if valid, 1 if invalid.

use strict;
use warnings;

my $PATTERN = qr/
\A
[A-Z0-9]+_[A-Z0-9]+_[A-Za-z0-9-]+_
(?:REDCAP-(?:RAW|LABEL|DICT)|CSV-RAW)_
\d{8}_
(?:PASS|FAIL|PARTIAL|NA)-[A-Z0-9]+
(?:_CONV-(?:OMOP|PXF|BFF)(?:-[0-9]+(?:[._][0-9]+)*)?)?
\.(?:csv|json)
\z
/x;

if (@ARGV != 1) {
    print "Usage: perl validate_filename_simple.pl <filename>\n";
    exit 1;
}

my $name = $ARGV[0];

if ($name =~ $PATTERN) {
    print "OK $name\n";
    exit 0;
} else {
    print "INVALID $name\n";
    exit 1;
}
