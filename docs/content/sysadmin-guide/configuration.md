# Configuration

## Keycloak

!!! Info "TL;DR"
	Just import the file [realm-export.json](./realm-export.json){target="_blank"}. It will create the required realm ("3TR"), clients ("omicsdm", "shinyproxy"), mappers etc.

#### Explanations

##### Clients

As you see when navigating to 
[admin/master/console/#/3TR/clients](http://localhost:8080/admin/master/console/#/3TR/clients){target="_blank"}
two clients have been created:

- omicsdm:  Needed for [omicsdm-server](https://github.com/CNAG-Biomedical-Informatics/omicsdm-server){target="_blank"}
                and [omicsdm-client](https://github.com/CNAG-Biomedical-Informatics/omicsdm-client){target="_blank"}
- shinyproxy: Needed only when running OmicsDM with the analysis module

##### Mappers

As you see when navigating to 
[admin/master/console/#/3TR/client-scopes](http://localhost:8080/admin/master/console/#/3TR/client-scopes)
the client scope "shared_mappers" has been created:

| Name | Type | Description | Needed for |
|------|-------------|----------------| ------------------
| group |  Group Membership | add the users' group to the access token | OmicsDM core |
| email |  User Property | replace the username with the user's email | Analysis module |  
| include_audience |  Audience | add shinyproxy to audience |  Analysis module |

This client scope has added to the clients "omicsdm" and "shinyproxy" as a default client scope.




