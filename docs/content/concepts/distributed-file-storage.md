# Distributed File Storage

## Brief Primer into File vs Object Storage

<div class="grid cards" markdown>

-   
    File storage is not ideal for large file uploads due to its inherent scalability limitations.
    Object storage on the other hand is a more cost-efficient and scalable solution for large datasets.


    | Feature                 | **File Storage**              | **Object Storage**           |
    |-------------------------|-------------------------------|------------------------------|
    | **Organization**        | Hierarchical (folders) | Flat namespace (keys)               |
    | **Metadata**            | Basic (File properties)      | Extensive and customizable    |
    | **Access Method**       | File paths (e.g., NFS, SMB)  | APIs (e.g., REST, S3)         |
    | **Mutability**          | Overwrites, appends          | Immutable                     |
    | **Use Case**            | Real-time applications       | Large datasets                |
    | **Scalability**         | Vertical (Upgrade of existing hardware) | Horizontal (Addition of nodes)|
    | **Cost**                | Higher for scaling           | Cost-efficient at scale       |

- <figure markdown>
    ![ShinyProxy](../../img/file_vs_object_storage.png){ width="100%" }
    <figcaption>
      File vs Object Storage adapted from
      </br>
      <span>
      <a href="https://www.scaleway.com/en/blog/understanding-the-different-types-of-storage">
        scaleway.com/en/blog/understanding-the-different-types-of-storage
      </a>
      </span>
    </figcaption>
  </figure>
</div>

## Object Storage with MinIO

The OmicsDM data warehouse solution employs [MinIO](https://min.io), 
a S3-compatible distribute object storage system, to store all uploaded files,
in a so-called S3 bucket. 

## File Upload Driven by EvaporateJS

The file upload is driven by [EvaporateJS](https://github.com/TTLabs/EvaporateJS) 
a JavaScript library that allows for large file uploads (in chunks)
directly from the browser to the S3 bucket.

```mermaid
sequenceDiagram
  participant User
  participant client as OmicsDM Client (with EvaporateJS)
  participant signer_server as OmicsDM Server
  participant S3 as S3 Bucket

  User->>client: Upload File Request
  loop Until All Chunks Uploaded
      client->>signer_server: Request Signed Policy for Next Chunk
      signer_server->>client: Return Signed Policy
      client->>S3: Upload Next Chunk
      S3->>client: Confirm Chunk Upload Success
  end
  client->>S3: Complete Multipart Upload
  S3->>client: Confirm Multipart Upload Success
  client->>User: Notify Upload Complete
```

## Automatic File Versioning

The OmicsDM data warehouse solution comes with automatic file versioning:

A re-upload of a file with the same name will not overwrite the existing file on the S3 bucket
but create a new version of it.

```mermaid
sequenceDiagram
  participant User
  participant client as OmicsDM Client
  participant server as OmicsDM Server
  participant S3 as S3 Bucket

  User->>client: Upload File Request
  client->>server: Check for Existing File
  server->>client: Return filename including the new version number
  client->>S3: Upload file using EvaporateJS
  S3->>client: Confirm Upload Success
  client->>server: Notify file upload success
  client->>User: Notify Upload Complete
```

## File Download leveraging presigned URLs

For each file selected to be downloaded, the user receives a unique download link,
a so-called presigned URL. 

```mermaid
sequenceDiagram
  participant User
  participant client as OmicsDM Client
  participant server as OmicsDM Server
  participant S3 as S3 Bucket

  User->>client: File Request
  client->>server: Forward File Request
  server->>S3: API Call
  S3->>server: Create Time-bound Presigned URL
  server->>client: Return Presigned URL
  client->>User: Present Presigned URL
  User->>S3: Download File using Presigned URL
```

## File deletion

To prevent accidental deletion of files, the OmicsDM data warehouse solution has no method to delete any
to the S3 bucket uploaded files. The only option the user gets is to mark a file as "deleted".
This switches a boolean flag in the database, preventing 

(a) The file from being shown in the files overview

(b) The generation of a pre-signed URL for the download of the respective file