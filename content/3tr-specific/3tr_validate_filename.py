#!/usr/bin/env python3
# Author: Manuel Rueda (manuel.rueda@cnag.eu)
# Date: Oct-17-2025
#
# Minimal filename validator for the 3TR clinical naming convention.
# Usage: python3 validate_filename_simple.py <filename>
# Exits 0 if valid, 1 if invalid.

import re
import sys

PATTERN = re.compile(
    r'^[A-Z0-9]+_[A-Z0-9]+_[A-Za-z0-9-]+_'
    r'(?:REDCAP-(?:RAW|LABEL|DICT)|CSV-RAW|CDISC)_'
    r'\d{8}_'
    r'(?:PASS|FAIL|PARTIAL|NA)-[A-Z0-9]+'
    r'(?:_CONV-(?:OMOP|PXF|BFF)(?:-[0-9]+(?:[._][0-9]+)*)?)?'
    r'\.(?:csv|json|txt|yaml)$'
)

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 validate_filename_simple.py <filename>")
        sys.exit(1)
    name = sys.argv[1]
    if PATTERN.fullmatch(name):
        print("OK", name)
        sys.exit(0)
    else:
        print("INVALID", name)
        sys.exit(1)

if __name__ == "__main__":
    main()
