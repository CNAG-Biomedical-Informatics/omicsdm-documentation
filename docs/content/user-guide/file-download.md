# File Download

!!! Info "3TR specific"
    Here is the link to the page showing all accessible files:
    [3tr.gpap.cnag.eu/portal/#/files](https://3tr.gpap.cnag.eu/portal/#/files)


## Steps to download file(s):

1. Navigate to the datasets overview page by clicking on "DATA MANAGEMENT" in the navigation bar on the left.

    The decision which files to download can be made in two ways:

    ```mermaid
    flowchart LR
        start{"Download file(s)"}
        option1("From all datasets")
        option2("Tick on the checkboxes of your dataset(s) of interest")
        
        subgraph "Possible Button Texts"
            btnText1["SHOW ALL FILES"]
            btnText2["SHOW TO THE SELECTED DATASET/S ASSOCIATED FILES"]
        end

        start --> option1
        start --> option2
        option1 --> btnText1
        option2 --> btnText2
    ```

    Having clicked on the Button shown in the previous step, you will be redirected to the files overview page.

2. Tick the checkbox of the file(s) you want to download.

3. Click on "DOWNLOAD FILES"

4. In the opened modal click on each of the URLs to download the file(s).

    !!! Info "FAQ"
        {% include-markdown "content/user-guide/faq.md" start="## File download" %}