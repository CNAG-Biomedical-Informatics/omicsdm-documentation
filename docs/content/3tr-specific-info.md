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

??? Example "Exporting data from REDCap"

    We recommend that you export your REDCap project in two formats:

    1. **CSV / Microsoft Excel (raw data)**

       Please select the corresponding box when exporting:

       ![REDCap export](https://github.com/CNAG-Biomedical-Informatics/convert-pheno/blob/main/docs/img/redcap-export.png?raw=true){ width="300" }

       *Figure: Example of REDCap export settings. Source: [CDC](https://www.cdc.gov/nhsn/pdfs/validation/2022/export-data-from-redcap.pdf)*

       Additionally, when configuring your export settings, ensure that in the **Additional report options**, the option "Combine checkbox options into single column of only the checked-off options" is **not** selected.

       ![Checkbox export](https://github.com/CNAG-Biomedical-Informatics/convert-pheno/blob/main/docs/img/redcap-checkbox.png?raw=true){ width="500" }

       *Figure: Example of REDCap export settings. Source: [CDC](https://www.cdc.gov/nhsn/pdfs/validation/2022/export-data-from-redcap.pdf)*

       After exporting the data, you must also download the REDCap dictionary in CSV format. This can be done within REDCap by navigating to `Project Setup/Data Dictionary/Download the current`.

    2. **CSV / Microsoft Excel (labels)**

       The procedure for exporting as **CSV / Microsoft Excel (labels)** is the same as above. Just ensure you select the correct export format.

       If you need more information on REDCap, we recommend consulting the comprehensive [documentation](https://confluence.research.cchmc.org/display/CCTSTRED/Cincinnati+REDCap+Resource+Center) provided by the Cincinnati Children's Hospital Medical Center.

#### Flowchart of clinical data in the warehouse

<div class="mermaid">
%%{init: {"theme": "default", "themeVariables": { 
    "fontSize": "14px", 
    "fontFamily": "Arial, sans-serif", 
    "nodePadding": 10, 
    "nodeMargin": 10, 
    "lineHeight": 1.2 
}}}%%
flowchart TB
    %% Define styles for different subgraphs using MkDocs Material-friendly colors
    style DataProducer fill:#E3F2FD,stroke:#1E88E5,stroke-width:2px, color:#000, font-size:14px
    style DiseaseExperts fill:#E8F5E9,stroke:#43A047,stroke-width:2px, color:#000, font-size:14px
    style CNAG fill:#FFF3E0,stroke:#FB8C00,stroke-width:2px, color:#000, font-size:14px
    style Analytics fill:#F3E5F5,stroke:#8E24AA,stroke-width:2px, color:#000, font-size:14px

    %% Start and End node styles
    A((Start: REDCap <br/>Data Files))
    style A fill:#BBDEFB,stroke:#1E88E5,stroke-width:2px, color:#000, font-size:16px
    H((End: Clinical Data Cycle))
    style H fill:#FFCDD2,stroke:#E53935,stroke-width:2px, color:#000, font-size:16px

    %% Data Producer Subgraph
    subgraph DataProducer [Data Producer]
      B["Uploads <br/>i) REDCap raw data (CSV) + dictionaries (CSV) <br/>ii) CSV with labels"]
      %% Reduce font size and padding within subgraphs
      style B font-size:14px, padding:10px
    end

    %% Disease Experts Subgraph
    subgraph DiseaseExperts [Disease Experts]
      C["Perform QC locally"]
      style C font-size:14px, padding:10px
    end

    %% CNAG Subgraph
    subgraph CNAG [CNAG]
      E["REDCap data + dictionaries<br/>are harmonized to GA4GH (BFF/PXF)<br/>with Convert-Pheno"]
      style E font-size:14px, padding:10px
    end

    %% Analytics Subgraph
    subgraph Analytics [Analytics]
      F["Users download data for analysis or research"]
      style F font-size:14px, padding:10px
    end

    %% Define connections with arrows and labels
    A -->|Upload Data| B
    B -->|Download Labeled CSV| C
    C -->|Upload QC CSV to Warehouse| F
    B -->|Download to CNAG| E
    E -->|Upload Harmonized GA4GH Data| F
    F -->|Store Data| H

    %% Define link styles using MkDocs Material-friendly colors
    linkStyle 0 stroke:#1E88E5, stroke-width:2px, stroke-dasharray: 5 5
    linkStyle 1 stroke:#43A047, stroke-width:2px
    linkStyle 2 stroke:#43A047, stroke-width:2px
    linkStyle 3 stroke:#66BB6A, stroke-width:2px
    linkStyle 4 stroke:#FB8C00, stroke-width:2px
    linkStyle 5 stroke:#8E24AA, stroke-width:2px
</div>
