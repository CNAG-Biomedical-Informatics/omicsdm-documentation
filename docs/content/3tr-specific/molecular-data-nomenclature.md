These guidelines define a minimal naming convention for molecular data files.

## Required pattern (minimal)

```bash
[Disease]_[Project]_[StudyID]_[Source]_[Date|Version].ext
```

## Components

1. **[Disease]** - Disease acronym (e.g., `MS`, `IBD`, `UC`).
2. **[Project]** - Consortium or project code (e.g., `3TR`, `PRECISESADS`).
3. **[StudyID]** - Unique study identifier (e.g., `Study123`, `CohortA`).
4. **[Source]** - Data origin/type.
5. **[Date|Version]** - Either:
    - Date: `YYYYMMDD`, or
    - Version: `vN` or `vN.N.N`.
6. **.ext** - File extension: (any)

??? Example "Example Sources"

    - **Source**:  
      `RNAseq`, `NfLGFAP`, `METABOLOMIC`, etc.

### Examples

**Rheumatoid arthritis (RA), RAMS, RNA-seq**  
```
RA_RAMS_Study123_RNASeq_20251022 (+ extension)
```

**Multiple sclerosis (MS), 3TR, NFL and GFAP biomarkers** 
```
MS_3TR_Study123_NfLGFAP_20241212 (+ extension)
```
