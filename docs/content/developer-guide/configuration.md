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
server:
  forward-headers-strategy: native

proxy:
  title: Open Analytics Shiny Proxy
  logo-url: https://www.openanalytics.eu/shinyproxy/logo.png
  landing-page: /
  heartbeat-rate: 10000
  heartbeat-timeout: 60000
  port: 8080
  authentication: openid
  my-apps-mode: InLine
  admin-groups: admin
  oauth2:
    resource-id: shinyproxy
    jwks-url: "http://${KC_INTERNAL_URL}/realms/${KC_REALM}/protocol/openid-connect/certs"
    roles-claim: realm_roles
    username-attribute: preferred_username
  openid:
    auth-url: "http://${DOMAIN}/realms/${KC_REALM}/protocol/openid-connect/auth"
    logout-url: "http://${DOMAIN}/realms/${KC_REALM}/protocol/openid-connect/logout?client_id=shinyproxy&post_logout_redirect_uri=http://localhost:3830"
    token-url: "http://${KC_INTERNAL_URL}/realms/${KC_REALM}/protocol/openid-connect/token"
    jwks-url: "http://${KC_INTERNAL_URL}/realms/${KC_REALM}/protocol/openid-connect/certs"
    client-id: "${KC_CLIENT_ID}"
    Client-secret: "${KC_CLIENT_SECRET}"
    username-attribute: email
    roles-claim: realm_roles
  docker:
    internal-networking: true
  specs:
    - id: 01_cellxgene
      display-name: Cellxgene
      description: Single-cell RNA-seq visualization tool
      container-cmd: [
        launch,
        https://cellxgene-example-data.czi.technology/pbmc3k.h5ad
      ]
      container-image: cz/cellxgene
      container-network: 3tr-server_sp-net
logging:
  file:
    name: shinyproxy.log
```

