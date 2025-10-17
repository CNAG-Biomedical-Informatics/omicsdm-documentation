These guidelines define a minimal, strict, and parseable file naming convention for clinical data files (e.g., REDCap exports, QC’d datasets, converted FAIR formats).

## Canonical Pattern

```
[Project]_[Disease]_[StudyID]_[Source]_[Date|Version]_[QCStatus]-[QCBy][_CONV-Target[-SchemaVer]].ext
```

??? Example "Field Rules"
    - Allowed characters: `A–Z`, `0–9`, and `-` inside tokens. Use `_` only as the token separator.
    - No spaces or diacritics.
    - Extensions are lowercase.
    - `Disease` is required and is always the **second** token.
    - `QCStatus-QCBy` is **required** (e.g., `PASS-CNAG`).

## Components

1. **[Project]** — Consortium or project code (e.g., `3TR`, `PRECISESADS`, `BRAMS`).
2. **[Disease]** — Disease acronym (e.g., `MS`, `IBD`, `UC`).
3. **[StudyID]** — Unique study identifier (e.g., `Study123`, `CohortA`).
4. **[Source]** — Data origin/type (see controlled list below).
5. **[Date|Version]** — Either:
    - Date: `YYYYMMDD`, or
    - Version: `vN` or `vN.N.N`.
6. **[QCStatus]-[QCBy]** — Required pair:
    - `QCStatus` in `{PASS, FAIL, PARTIAL, NA}`.
    - `QCBy` is the center code performing QC (e.g., `CNAG`, `KI`, `FPS`).
7. **_CONV-Target[-SchemaVer]** — Optional conversion info:
    - `Target` in `{OMOP, PXF, BFF}`.
    - Optional `SchemaVer` (e.g., `5_4`, `2.0`).
8. **.ext** — File extension: `.csv`, `.json` (extend cautiously as needed).

??? Example "Controlled Vocabularies"

    - **Source**:  
      `REDCAP-RAW` (raw export), `REDCAP-LABEL` (labeled export), `REDCAP-DICT` (data dictionary), `CSV-RAW` (free-form CSV)

    - **QCStatus**:  
      `PASS`, `FAIL`, `PARTIAL`, `NA`

    - **CONV-Target** (optional):  
      `OMOP`, `PXF`, `BFF`

### Examples

**3TR raw REDCap export (no QC yet, recorded by CNAG as NA)**  
```
3TR_MS_Study123_REDCAP-RAW_20231204_NA-CNAG.csv
```

**3TR labeled CSV, QC passed by FPS**  
```
3TR_MS_Study123_REDCAP-LABEL_20231204_PASS-FPS.csv
```

**3TR REDCap dictionary, QC failed at KI**  
```
3TR_MS_Study123_REDCAP-DICT_20240115_FAIL-KI.csv
```

**3TR raw export converted to Beacon v2 (BFF), QC by CNAG**  
```
3TR_MS_Study123_REDCAP-RAW_20231204_PASS-CNAG_CONV-BFF-2.0.json
```

**PRECISESADS free CSV, partial QC by FPS**  
```
PRECISESADS_IBD_Study123_CSV-RAW_v1.1.0_PARTIAL-FPS.csv
```

## Validation Regex (starter)

Use this to lint filenames. Adjust only if you extend vocabularies.

```
^[A-Z0-9]+_[A-Z0-9]+_[A-Za-z0-9-]+_(?:REDCAP-(?:RAW|LABEL|DICT)|CSV-RAW)_\d{8}_(?:PASS|FAIL|PARTIAL|NA)-[A-Z0-9]+(?:_CONV-(?:OMOP|PXF|BFF)(?:-[0-9]+(?:[._][0-9]+)*)?)?\.(?:csv|json)$
```

## CLI Linter Scripts

Use the accompanying [Python](https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/docs/content/3tr-specific/3tr_validate_filename.py), [Perl](https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/docs/content/3tr-specific/3tr_validate_filename.pl) or [R](https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/docs/content/3tr-specific/3tr_validate_filename.R) scripts to validate names locally.

**Example**

```bash
# Python 3
python3 3tr_validate_filename.py 3TR_MS_Study123_REDCAP-RAW_20231204_NA-CNAG.csv

# Perl 5
perl 3tr_validate_filename.pl 3TR_MS_Study123_REDCAP-RAW_20231204_NA-CNAG.csv

# R
Rscript 3tr_validate_filename.R 3TR_MS_Study123_REDCAP-RAW_20231204_NA-CNAG.csv
```
