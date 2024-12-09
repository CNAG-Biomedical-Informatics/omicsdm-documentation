# 3TR OmicsDM modules

The functionalities of the OmicsDM data warehouse solution are conceptually organized in modules,
namely:

- [Core](#core)
- [Data Visualisation](#data-visualisation)
- [Data Analyses](#data-analyses)

!!! Info "3TR specific"
    The data visualisation and the analysis module is disabled in the 3TR instance of OmicsDM.

## Core

The Core module is the backbone of the OmicsDM data warehouse solution.
It provides the basic functionalities to store, share, and manage data.

## Data Visualisation

The data visualisation module is leveraging [ShinyProxy](https://www.shinyproxy.io) 
to provide private data visualisation environments per user.
As a proof of concept, the module is providing a 
[CELLxGENE annotate](https://github.com/chanzuckerberg/cellxgene) instance.

## Data Analyses

The Data Analyses module provides the functionalities to run analyses directly in the OmicsDM data warehouse.
It is employing Celery to manage the job execution and the actual analyses pipelines can be implemented
either in Snakemake or Nextflow.