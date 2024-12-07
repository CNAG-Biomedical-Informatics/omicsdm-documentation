# 3TR specific

!!! Info "Information for 3TR consortium members"
    This section contains information that is specific to the 3TR consortium.

## 3TR project data

!!! Info "Important terminology and its implications"
    | Data source | Description | Dataset Visibility Defaults | Extra Data Policy File |
    | --- | --- | -- | -- |
    | Legacy | Data collected in clinical trials before the start of the 3TR project | Private; Visibility not changeable | Optional |
    | Collected during 3TR | Data generated during the 3TR project | Visible to all; Visibility changeable | Not allowed |

### Molecular data

Under molecular data falls all kinds of omics data, such as RNA-seq count matrices.

### Pheno-clinical data

Since the molecular data cannot be interpreted without the context of the patient,
it is crucial to also store the pheno-clinical (phenotypic + clinical) 
information about the patients.

!!! Trivia "Format of the already uploaded data"
    - Legacy: Raw CSV
    - Collected during 3TR: REDCap exports (CSV)