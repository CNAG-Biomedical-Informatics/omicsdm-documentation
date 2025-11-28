# Repository to build the OmicsDM documentation

[![Documentation Status](https://github.com/cnag-biomedical-informatics/omicsdm-documentation/actions/workflows/deploy.yml/badge.svg)](https://github.com/cnag-biomedical-informatics/omicsdm-documentation/actions/workflows/deploy.yml)

**Live at**: <a href="https://cnag-biomedical-informatics.github.io/omicsdm-documentation" target="_blank">https://cnag-biomedical-informatics.github.io/omicsdm-documentation</a>

This repository contains the source files to build the documentation
for the OmicsDM data warehouse solution
developed for the 3TR project (https://www.3tr-imi.eu).

The source code for the server and client can be found in the following repositories:

- https://github.com/CNAG-Biomedical-Informatics/OmicsDM

## Context

OmicsDM started as the PhD thesis project of Ivo Christopher Leist (https://github.com/IvoLeist)
and is since Q1 2022 in use by the 3TR consortium. Acting there as the data backbone
for the storage and sharing of processed omics data and its patient's pheno-clinical information.

## How to build the documentation

```shell
make venv
source venv/bin/activate
make build
```

## Documentation deployment

The documentation is deployed to the GitHub pages. The deployment is done by the GitHub Actions
workflow defined in the `.github/workflows/deploy.yml` file.

## License

The documentation is licensed under the MIT license. See the LICENSE file for more details.

