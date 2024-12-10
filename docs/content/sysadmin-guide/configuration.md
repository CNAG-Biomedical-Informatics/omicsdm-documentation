# Configuration

## Keycloak

!!! Info "TL;DR"
	Just import the file [realm-export.json](./realm-export.json){target="_blank"}. It will create the required realm ("3TR"), clients ("omicsdm", "shinyproxy"), mappers etc.

### Explanations

#### Clients

As you see when navigating to 
[localhost:8080/admin/master/console/#/3TR/clients](http://localhost:8080/admin/master/console/#/3TR/clients)

Two clients are created:

- **omicsdm**: Needed for omicsdm-server and omicsdm-client
- **shinyproxy**: Needed only when running OmicsDM with the analysis module

#### Mappers

As you see when navigating to 
[localhost:8080/admin/master/console/#/3TR/client-scopes](http://localhost:8080/admin/master/console/#/3TR/client-scopes)
For both clients the following shared token mappers have been created:

| Name | Type | Token Claim Name | Needed for |
|------|-------------|----------------| ------------------|
| group |  Group Membership | groups | add the users' group to the access token |
| email |  User Property | email | |
| aud |  Audience | aud | |





