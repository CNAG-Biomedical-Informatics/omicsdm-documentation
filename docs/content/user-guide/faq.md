# FAQ

## General

## Dataset creation

??? faq "I accidentally filled some fields wrong, can I correct them?"
    
    No, you cannot correct the fields after the dataset has been created. 
    Please contact the helpdesk to explain the situation so the admin can correct the fields for you.

    ##### last change 2024-12-08 by Ivo Leist [:fontawesome-brands-github:](https://github.com/IvoLeist)

## File upload

??? faq "Does the upload start immediately as soon I have selected a file?"

    Eventhough it looks like the upload has started, the files are not uploaded until you click on "SUBMIT". 

    ##### last change 2024-12-08 by Ivo Leist [:fontawesome-brands-github:](https://github.com/IvoLeist)

??? faq "Can I pause the upload process and resume later?"

    No, the upload process is not resumable. If you e.g. close the browser tab, the upload process is interrupted and you have to start over.

    ##### last change 2024-12-08 by Ivo Leist [:fontawesome-brands-github:](https://github.com/IvoLeist)

??? faq "After uploading I realised that there is a mistake in the file. Can I correct it?"

    No, you cannot overwite the uploaded file. Best is to upload the again with the correct data making sure it has the same name as the original file. The system will automatically version the file. To avoid confusion, you can mark the original file as "deleted" so the users only have access to the correct file.

    ##### last change 2024-12-08 by Ivo Leist [:fontawesome-brands-github:](https://github.com/IvoLeist)

??? faq "I accidentaly uploaded a wrong file, can I delete it?"

    No, you cannot delete any uploaded file (refer to [File deletion](../../concepts/distributed-file-storage/#file-deletion)). Best is to mark the file as "deleted" so no one can access it. If the file contains sensitive data, please explain the situation in an email to the helpdesk.

    ##### last change 2024-12-08 by Ivo Leist [:fontawesome-brands-github:](https://github.com/IvoLeist)

## File download

??? faq "Can I download multiple files at once?"

    No, you have to download each selected file individually.

    ##### last change 2024-12-08 by Ivo Leist [:fontawesome-brands-github:](https://github.com/IvoLeist)

??? faq "Downloading each file one by one with the browser is a bit tedious, you have an idea?"

    I would suggest to use tools like `wget` or `curl` to download multiple files 
    as soon you got the URLs from the file download modal.

    ##### last change 2024-12-08 by Ivo Leist [:fontawesome-brands-github:](https://github.com/IvoLeist)

??? faq "Why do you not support the download of multiple files at once in a zip?"

    The files are directly donwloaded from the S3 bucket. 
    Temporarily storing them on the server to bundle them into a zip file would 
    introduce additional complexity, increase server load, and potentially pose security risks.

    ##### last change 2024-12-08 by Ivo Leist [:fontawesome-brands-github:](https://github.com/IvoLeist)
