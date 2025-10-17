# Data Submission

Data submission in OmicsDM is a three-step process:

- [Request project(s) creation](#prerequisite-request-projects): Project creation is done by the OmicsDM admin
- [Create dataset(s)](#step-2-create-datasets): Here you create the "folder" for your files + attach the pheno-clinical data
- [Upload file(s)](#step-3-upload-files): Here you can upload your molecular data files such as RNA-seq count matrices

## Prerequisite: Request project(s) 

Write an email to CNAG's 3TR helpdesk asking for the creation of a new project.

Either provide the following information in the email:

| Information | Explanation |
| --- | --- |
| Project ID | A unique identifier for the project |
| Name | The name of the project |
| Owners | The users groups that should be able to create datasets in the project |
| Description | A short description of the project |
| Diseases | The diseases that should be selectable in the dropdown during dataset creation |
| Logo Url | The URL to the logo of the project |
| Dataset Visibility default | The default visibility of the datasets in the project |
| Dataset Visibility Changeable | Whether the visibility of the datasets can be changed |
| File Download Allowed | Whether the uploaded files can be downloaded by users not in the owners group(s)|

or download the [project_template](https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/omicsdm_templates/project_template.tsv){target="_blank"} 
fill it out and attach it to the email.

!!! Info "Why use the project creation template?" 
    - Handy when you want to ask for the creation of multiple projects
    - Makes the life more easy for the admin creating the project(s).

## Create Datasets and Attach Pheno-Clinical Data

??? Info "Recommended nomenclature for the Pheno-Clinical data file"
    Please see the following [link](../../3tr-specific/pheno-clinical-data-nomenclature.md)
    
When the project is created, you can start creating datasets (the "folder" for your files)

<div class="grid" markdown>
1. Navigate to the dataset creation page:

    === "By clicking through the UI"
        1. Click on "DATA SUBMISSION" in the navigation bar on the left
        2. Click on "Create new Dataset"
        3. Select the project you want to create the dataset in

    === "3TR specific: Link to the dataset creation page"
        [3tr.gpap.cnag.eu/portal/#/submitdatasets](https://3tr.gpap.cnag.eu/portal/#/submitdatasets)
        
2. Create the dataset(s):
    1. Fill out the table on the page manually 
    or by uploading a filled out 
    [dataset_template](
        https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/omicsdm_templates/project_template.tsv
     "Tip: Handy when you want to create multiple datasets").
    2. Click on "Browse" in the "Clinical File" column to select the corresponding pheno-clinical information file to be uploaded
    3. Optional: Click on "Browse" in the "Data Usage Policy File" column to upload a file containing specific data usage policy
    4. Click on "VALIDATE" to check if all mandatory fields are filled out
    5. Click on "SUBMIT" to create the dataset(s)

    !!! Info "FAQ"
        {% include-markdown "content/user-guide/faq.md" start="## Dataset creation" end="## File upload" %}
</div>

## Upload Molecular Data File(s)
!!! Info "Tip: You can upload multiple files at once!"

!!! Info "3TR specific"
    Here is the link to directly navigate to the file upload page:  
    [3tr.gpap.cnag.eu/portal/#/submitfiles](https://3tr.gpap.cnag.eu/portal/#/submitfiles)

<div class="grid" markdown>
1. Navigate to the file upload page:

    === "By clicking through the UI"
        1. Click on "DATA SUBMISSION" in the navigation bar on the left
        2. Click on "Submit files"

    === "3TR specific: Link to the file upload page"
        [3tr.gpap.cnag.eu/portal/#/submitfiles](https://3tr.gpap.cnag.eu/portal/#/submitfiles)
    
2. Upload the file(s):
    1. Select the project you want to upload the file(s) to
    2. Select in the Dataset ID dropdown the dataset 
    you want to upload the file(s) to or upload a filled out 
    [file_template](
        https://github.com/CNAG-Biomedical-Informatics/omicsdm-documentation/blob/main/omicsdm_templates/file_template.tsv
     "Tip: Handy when you want to upload multiple files to different datasets").
    3. Click on "Browse" to select the file(s) you want to upload
    4. Click on "VALIDATE" to check if all mandatory fields are filled out
    5. Click on "SUBMIT" to upload the file(s)

    !!! Info "FAQ"
        {% include-markdown "content/user-guide/faq.md" start="## File upload" end="## File download" %}

    !!! Warning "3TR specific"
        Please do not see our data warehouse as a storage for your raw data.
        Only upload processed data that is ready for analyses.
</div>
