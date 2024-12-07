# Dependencies

## Pre-requisites

Before deploying OmicsDM, you need to install the following dependencies:

 - [Docker]()
 - [Docker Compose]()

## Services

| Required by | Service | Description | Version | License |
|---|--------|-------------|---------|---------|
| Core | [Keycloak]() | Identity and access management solution. | 22 | [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0) |
| Core |[PostgreSQL]() | Object-relational database system. | 13.4 | [PostgreSQL](https://www.postgresql.org/about/licence/) |
| Core | [MinIO]() | Distributed object storage server. | 2021-10-06T00-00-00Z | [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0) |
| Visualisation Module | [ShinyProxy]() |  |  | []() |
| Analysis Module | [Celery]() |  |  | []() |
| Analysis Module | [REDIS]() | In-memory data structure store, used as a database, cache, and message broker. | 6.2.5 | [BSD-3-Clause](https://opensource.org/licenses/BSD-3-Clause) |
| Analysis Module | [RabbitMQ]() | Message broker that implements the Advanced Message Queuing Protocol (AMQP). | 3.9.7 | [Mozilla Public License 1.1](https://www.rabbitmq.com/mpl.html) |