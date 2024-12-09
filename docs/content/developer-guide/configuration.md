# Configuration

## Server Configuration
::: dummy_package.config.OmicsDM_Server_Config
    options:
	    heading_level: 6

## Client Configuration

```json
{
  "security": true,
  "api_endpoint": "http://localhost:8082/",
  "config_keycloak": {
    "realm": "3TR",
    "resource": "omicsdm_client",
    "auth-server-url": "http://localhost:8080/",
    "ssl-required": "external",
    "public-client": true,
    "confidential-port": 0,
  },
  // file upload limit: 100 GB
  "max_content_length": 100 * 1000 * 1024 * 1024,

  "config_aws": {
    "cloudfront": true,
    "aws_url": "http://localhost:9000",
    "signerUrl":"http://localhost:8082/api/files",

    "aws_key": "accesskey",
    "bucket": "bucketdevel3tr",
    "awsRegion": "us-east-1",

    "computeContentMd5": false,
    "partSize": 6 * 1024 * 1024,
    "maxConcurrentParts": 5,
    "awsSignatureVersion": "2",
    "sendCanonicalRequestToSignerUrl": true,
  }
}
```

## Shinyproxy Configuration

!!! Info "ShinyProxy is only needed for the Visualisation Module."

!!! Info "3TR-specific"
    The visualisation module is not available for the 3TR consortium.

```yaml


```

