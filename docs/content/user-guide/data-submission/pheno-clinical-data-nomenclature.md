These guidelines help maintain a consistent, clear, and scalable file naming convention for clinical data files, including REDCap exports, QC’d data, and converted data formats.

## General Format

```
[Project/StudyID]_[Source]_[FileType]_[Version/Date]_QC[QCStatus]_[QCBy]_CONV[ConversionType].ext
```

### Components

1. **[Project/StudyID]**: Unique identifier for the project or study (e.g., `Study123`, `ProjectX`).
2. **[Source]**: Origin of the file:
   - `REDCapRaw`: Raw export from REDCap.
   - `REDCapLabel`: Labeled CSV export from REDCap (dictionary embedded).
   - `REDCapDict`: The dictionary CSV export from REDCap.
3. **[FileType]**: Type of file:
   - `CSV`: For CSV files.
   - `JSON`: For JSON files (BFF or PXF).
   - `DICT`: For dictionary files from REDCap.
4. **[Version/Date]**: Version number or a date string in `YYYYMMDD` format (e.g., `v1`, `20231204`).
5. **[QCStatus]**: Quality control status:
   - `Yes`: If QC has been performed.
   - `No`: If QC has not been performed.
6. **[QCBy]**: Identifier for the center performing QC (e.g., `CNAG`, `KI`, `FPS`).  
   *If no QC has been performed (`QCNo`), omit this field.*
7. **[ConversionType]**: Converted format (if applicable):
   - `BFF`: Converted to Beacon v2 JSON format.
   - `PXF`: Converted to Phenopackets JSON format.  
   *Omit this if the file is not converted.*
8. **.ext**: File extension:
   - `.csv` for CSV files
   - `.json` for JSON files

---

## Examples

**Raw CSV Export (No QC)**  
`Study123_REDCapRaw_CSV_20231204_QCNo.csv`

**Labeled CSV QC’d by CNAG**  
`Study123_REDCapLabel_CSV_20231204_QCYes_CNAG.csv`

**REDCap Dictionary QC’d by KI**  
`Study123_REDCapDict_DICT_20231204_QCYes_KI.csv`

**Converted BFF JSON (QC by CNAG)**  
`Study123_REDCapRaw_JSON_20231204_QCYes_CNAG_CONVBFF.json`

**Converted PXF JSON (QC by FPS)**  
`Study123_REDCapLabel_JSON_20231204_QCYes_FPS_CONVPXF.json`

**No QC for a Converted BFF JSON**  
`Study123_REDCapLabel_JSON_20231204_QCNo_CONVBFF.json`
