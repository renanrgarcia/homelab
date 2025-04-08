# vagrant-postgres-docker

## Overview

This project sets up a virtual environment using Vagrant on a 32-bit Debian server to run PostgreSQL databases in Docker containers with Docker Compose.

## Prerequisites

- Vagrant installed on your machine
- VirtualBox installed on your machine

## Getting Started

1. Clone this repository to your local machine:
   ```
   git clone <repository-url>
   cd vagrant-postgres-docker
   ```

2. Start the Vagrant environment:
   ```
   vagrant up
   ```

3. SSH into the Vagrant box:
   ```
   vagrant ssh
   ```

4. Once inside the virtual machine, Docker and Docker Compose will be installed automatically. You can verify the installation by running:
   ```
   docker --version
   docker-compose --version
   ```

## Running PostgreSQL

1. Navigate to the provisioning directory:
   ```
   cd provisioning
   ```

2. Start the PostgreSQL container using Docker Compose:
   ```
   docker-compose up -d
   ```

3. Access the PostgreSQL database:
   - The database will be accessible on the default port `5432`.
   - Use a PostgreSQL client or command line to connect to the database.

## Stopping the Services

To stop the PostgreSQL container, run:
```
docker-compose down
```

## Cleanup

To destroy the Vagrant environment and remove all resources, run:
```
vagrant destroy
```

## License

This project is licensed under the MIT License.