#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

my $PATTERN = qr/
\A
[A-Z0-9]+_[A-Z0-9]+_[A-Za-z0-9-]+_
(?:REDCAP-(?:RAW|LABEL|DICT)|CSV-RAW|CDISC)_
(?:\d{8}|v\d+(?:\.\d+){0,2})
(?:_(?:PASS|FAIL|PARTIAL|NA)-[A-Z0-9]+)?
(?:_CONV-(?:OMOP|PXF|BFF)(?:-[0-9]+(?:[._][0-9]+)*)?)?
\.(?:csv|json|txt|yaml)
\z
/x;

my @valid = (
    'MS_3TR_Study123_REDCAP-RAW_20231204.csv',
    'MS_3TR_Study123_REDCAP-LABEL_20231204_PASS-FPS.csv',
    'MS_3TR_Study123_REDCAP-DICT_20240115_FAIL-KI.yaml',
    'IBD_PRECISESADS_Study123_CSV-RAW_v1.1.0_PARTIAL-FPS.json',
    'MS_3TR_Study123_REDCAP-RAW_20231204_PASS-CNAG_CONV-BFF-2.0.json',
    'UC_3TR_Study-Alpha_CDISC_20250101.txt',
);

my @invalid = (
    'MS_3TR_Study123_REDCAP_RAW_20231204.csv',            # wrong separator in Source
    'MS_3TR_Study123_REDCAP-RAW_20231204_OK-CNAG.csv',    # invalid QC status
    'MS_3TR_Study123_REDCAP-RAW_20231204.CSV',            # uppercase extension
    'MS_3TR_Study123_REDCAP-RAW__PASS-FPS.csv',           # missing Date|Version
    'MS_3TR_Study123_REDCAP-RAW_202312_PASS-FPS.csv',     # bad date format
    'ms_3TR_Study123_REDCAP-RAW_20231204.csv',            # lowercase disease not allowed
    'MS_3TR_Study123_REDCAP-RAW_20231204_PASS-.csv',      # missing QC center after hyphen
);

for my $f (@valid)   { like($f, $PATTERN, "valid: $f"); }
for my $f (@invalid) { unlike($f, $PATTERN, "invalid: $f"); }

done_testing();
