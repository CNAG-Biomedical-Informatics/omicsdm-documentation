These guidelines define a minimal, strict, and parseable file naming convention for clinical data files (e.g., REDCap exports, QC’d datasets, converted FAIR formats).

## Required pattern (minimal)

```bash
[Disease]_[Project]_[StudyID]_[Source]_[Date|Version].ext
```

## Extended pattern (optional blocks)

```bash
[Disease]_[Project]_[StudyID]_[Source]_[Date|Version][_[QCStatus]-[QCBy]][_CONV-[Target][-SchemaVer]].ext
```
??? Example "Field Rules"
    - Allowed characters: `A-Z`, `0-9`, and `-` inside components. Use `_` only as the component separator.
    - No spaces or diacritics.
    - Extensions are lowercase.

## Components

1. **[Disease]** - Disease acronym (e.g., `MS`, `IBD`, `UC`).
2. **[Project]** - Consortium or project code (e.g., `3TR`, `PRECISESADS`).
3. **[StudyID]** - Unique study identifier (e.g., `Study123`, `CohortA`).
4. **[Source]** - Data origin/type (see controlled list below).
5. **[Date|Version]** - Either:
    - Date: `YYYYMMDD`, or
    - Version: `vN` or `vN.N.N`.
6. **[QCStatus]-[QCBy]** - Optional QC pair:
    - `QCStatus` in `{PASS, FAIL, PARTIAL, NA}`.
    - `QCBy` is the center code performing QC (e.g., `CNAG`, `KI`, `FPS`).
7. **CONV-Target[-SchemaVer]** - Optional conversion info:
    - `Target` in `{OMOP, PXF, BFF}`.
    - Optional `SchemaVer` (e.g., `5_4`, `2.0`).
8. **.ext** - File extension: `.csv`, `.json`, `.txt` and `yaml`.

??? Example "Controlled Vocabularies"

    - **Source**:  
      `REDCAP-RAW` (raw export), `REDCAP-LABEL` (labeled export), `REDCAP-DICT` (data dictionary), `CSV-RAW` (free-form CSV), `CDISC` (export)

    - **QCStatus**:  
      `PASS`, `FAIL`, `PARTIAL`, `NA`

    - **CONV-Target** (optional):  
      `OMOP`, `PXF`, `BFF`

### Examples (minimal)

**Multiple sclerosis (MS), 3TR, Minimal (no QC, no conversion)**  
```
MS_3TR_Study123_REDCAP-RAW_20231204.csv
```

**Rheumatoid arthritis (RA), PRECISESADS, Minimal (no QC, no conversion)** 
```
RA_PRECISESADS_Study123_CSV-RAW_20231204.csv
```

### Examples (extended)

**Multiple sclerosis (MS), 3TR, Labeled CSV, QC passed by FPS**  
```
MS_3TR_Study123_REDCAP-LABEL_20231204_PASS-FPS.csv
```

**Multiple sclerosis (MS), 3TR, REDCap dictionary, QC failed at KI**  
```
MS_3TR_Study123_REDCAP-DICT_20240115_FAIL-KI.csv
```

**Multiple sclerosis (MS), 3TR, raw export converted to Beacon v2 (BFF), QC by CNAG**  
```
MS_3TR_Study123_REDCAP-RAW_20231204_PASS-CNAG_CONV-BFF-2.0.json
```

**Rheumatoid arthritis (RA), PRECISESADS, free CSV, partial QC by FPS**  
```
RA_PRECISESADS_Study123_CSV-RAW_v1.1.0_PARTIAL-FPS.csv
```

## Validation Regex (starter)

Use this to lint filenames. Adjust only if you extend vocabularies.

```
^[A-Z0-9]+_[A-Z0-9]+_[A-Za-z0-9-]+_(?:REDCAP-(?:RAW|LABEL|DICT)|CSV-RAW|CDISC)_(?:\d{8}|v\d+(?:\.\d+){0,2})(?:_(?:PASS|FAIL|PARTIAL|NA)-[A-Z0-9]+)?(?:_CONV-(?:OMOP|PXF|BFF)(?:-[0-9]+(?:[._][0-9]+)*)?)?\.(?:csv|json|txt|yaml)$
```

## CLI Linter Scripts

Use the accompanying [Python](https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/docs/content/3tr-specific/3tr_validate_filename.py), [Perl](https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/docs/content/3tr-specific/3tr_validate_filename.pl) or [R](https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/docs/content/3tr-specific/3tr_validate_filename.R) scripts to validate names locally.

**Example**

```bash
# Python 3
python3 3tr_validate_filename.py MS_3TR_Study123_REDCAP-RAW_20231204.csv

# Perl 5
perl 3tr_validate_filename.pl MS_3TR_Study123_REDCAP-RAW_20231204.csv 

# R
Rscript 3tr_validate_filename.R MS_3TR_Study123_REDCAP-RAW_20231204.csv
```
