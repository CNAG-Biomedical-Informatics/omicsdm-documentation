# 3TR specific

!!! Info "Information for 3TR consortium members"
    This section contains information that is specific to the 3TR consortium.

## 3TR project data

!!! Info "Important terminology and its implications"
    | Data source | Description | Dataset Visibility Defaults | Extra Data Policy File |
    | --- | --- | -- | -- |
    | Legacy | Data collected in clinical trials before the start of the 3TR project | Private; Visibility not changeable | Optional |
    | Collected during 3TR | Data generated during the 3TR project | Visible to all; Visibility changeable | Not allowed |

The in the data warehouse to be uploaded data can be divided conceptually into:

<div class="grid cards" markdown>

-   :dna:{ .lg .middle } __Molecular Data__

    ---

    Under molecular data falls all kinds of omics data, such as RNA-seq count matrices.

    [:octicons-arrow-right-24: Learn more](../molecular-data)

-   :fontawesome-solid-clipboard-user:{ .lg .middle } __Pheno-Clinical Data__

    ---

    Pheno-clinical = Phenotypic + clinical data

    [:octicons-arrow-right-24: Reference](../pheno-clinical-data)