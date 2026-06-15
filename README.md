# Docker Development Services

Infrastructure Docker de développement pour l'apprentissage, l'expérimentation et les projets Full Stack.

Docker-based development infrastructure for learning, experimentation, and Full Stack projects.

---

## Languages

- [Français](#version-française)
- [English](#english-version)

---

# Version Française

...

## Objectif

Ce dépôt centralise les services d'infrastructure Docker utilisés dans l'environnement de développement.

Chaque service est isolé dans son propre dossier,  dispose d'un docker-compose.yml et peut inclure :

- un fichier .env
- un fichier .env.example
- un dossier de données persistant
- un dossier de sauvegardes
- des fichiers de configuration spécifiques selon le service

Services actuellement disponibles :

* MySQL
* PostgreSQL
* Redis
* MongoDB
* RabbitMQ
* MinIO

Services prévus :

* Grafana
* Elasticsearch

---

## Prérequis

* Docker Desktop
* Backend WSL2 recommandé
* Git
* PowerShell 7 (Windows)

---

## Cloner le dépôt

```powershell
git clone git@github.com:edouard-todorov-formation/docker-development-services.git
```

Le dépôt peut être cloné dans n'importe quel répertoire.

Exemples :

```text
C:\Projects\docker-development-services

D:\Docker\docker-development-services

/home/dev/docker-development-services
```

---

## Architecture recommandée

L'environnement de référence utilise l'organisation suivante :

```text
E:\Dev
├── Projects
├── Docker
│   └── Services
├── AI
└── Backups
```

Le dépôt est alors situé dans :

```text
E:\Dev\Docker\Services
```

Cette organisation n'est pas obligatoire mais elle est recommandée pour séparer clairement :

* les projets de développement ;
* les services Docker ;
* les sauvegardes ;
* les ressources IA.

---

## Structure actuelle

```text
BDD/
├── MongoDB/
│   ├── .env.example
│   ├── docker-compose.yml
│   ├── backups/
│   └── data-mongodb/
│
├── MySQL/
│   ├── .env.example
│   ├── docker-compose.yml
│   ├── backups/
│   └── data-mysql/
│
├── PostgreSQL/
│   ├── .env.example
│   ├── docker-compose.yml
│   ├── backups/
│   ├── data-postgres/
│   └── data-pgadmin/
│
└── Redis/
     ├── .env.example
     ├── docker-compose.yml
     ├── backups/
     └── data-redis/

Messaging/
└── RabbitMQ/
    ├── .env.example
    ├── docker-compose.yml
    ├── backups/
    └── data-rabbitmq/

Storage
└── MinIO
     ├── .env.example
     ├── docker-compose.yml
     ├── backups/
     └── data-minio/
```

---

## Démarrer un service

### Exemple avec MySQL

Ouvrir un terminal PowerShell dans le dossier du dépôt.

Se placer dans le dossier du service :

```powershell
cd BDD\MySQL
```

Créer le fichier `.env` à partir du modèle fourni:

```powershell
Copy-Item .env.example .env
```

Cette commande crée une copie du fichier .env.example et la renomme en .env.

Modifier ensuite les paramètres du fichier .env selon vos besoins.

Démarrer les conteneurs :

```powershell
docker compose up -d
```

---

## Vérifications

Afficher les conteneurs actifs :

```powershell
docker ps
```

Afficher les logs :

```powershell
docker compose logs -f
```

Arrêter les conteneurs :

```powershell
docker compose stop
```

Redémarrer les conteneurs :

```powershell
docker compose restart
```

Arrêter et supprimer les conteneurs :

```powershell
docker compose down
```

Redémarrer complètement le service :

```powershell
docker compose up -d
```

---

## Services disponibles

### MySQL

Conteneurs :

* mysql-server
* phpmyadmin

Ports :

| Service    | Port |
| ---------- | ---- |
| MySQL      | 3306 |
| phpMyAdmin | 8080 |

Accès :

```text
http://localhost:8080
```

---

### PostgreSQL

Conteneurs :

* postgres-server
* pgadmin

Ports :

| Service | Port |
|----------|----------|
| PostgreSQL | 5432 |
| pgAdmin | 8081 |

Accès :

```text
http://localhost:8081
```

---

### Redis

Conteneur :

* redis-server

Ports :

| Service | Port |
|----------|----------|
| Redis | 6379 |

Accès :

```text
redis://localhost:6379
```

---

### MongoDB

Conteneurs :

* mongodb-server
* mongo-express

Ports :

| Service | Port |
|----------|----------|
| MongoDB | 27017 |
| Mongo Express | 8082 |

Accès :

```text
http://localhost:8082
```

---

### RabbitMQ

Conteneur :

* rabbitmq-server

Ports :

| Service | Port |
|----------|----------|
| RabbitMQ AMQP | 5672 |
| RabbitMQ Management | 15672 |

Accès :

```text
http://localhost:15672
```

---

### MinIO

Conteneur :

* minio-server

Ports :

| Service | Port |
|----------|----------|
| MinIO API | 9000 |
| MinIO Console | 9001 |

Accès :

```text
http://localhost:9001
```

---

## Gestion des secrets

Les fichiers suivants ne sont jamais versionnés :

```text
.env
```

Les mots de passe réels restent uniquement sur la machine locale.

Les fichiers versionnés sont :

```text
.env.example
```

---

## Données persistantes

Les données Docker ne sont jamais envoyées sur GitHub.

Exemples :

```text
data-mysql/
data-postgres/
data-pgadmin/
data-redis/
data-mongodb/
```

Ces dossiers sont exclus via le fichier `.gitignore`.

---

## Sauvegardes

Chaque service possède un dossier :

```text
backups/
```

destiné à recevoir les futures sauvegardes exportées.

---

## Convention utilisée

Chaque service suit la structure suivante :

```text
NomDuService/
├── .env
├── .env.example
├── docker-compose.yml
├── backups/
└── data-service/
```

Principes :

* 1 technologie = 1 dossier
* 1 fichier `.env`
* 1 fichier `.env.example`
* 1 fichier `docker-compose.yml`
* 1 dossier de données dédié
* 1 dossier de sauvegardes dédié

---

## Auteur

Edouard Todorov

Développeur Full Stack

🌐 Portfolio : https://portfolio.tekedo.fr

💼 LinkedIn : https://www.linkedin.com/in/edouard-todorov

🐙 GitHub : https://github.com/edouard-todorov-formation

---
---
---

# English Version

...

Docker-based development infrastructure for learning, experimentation, and Full Stack projects.

## Purpose

This repository centralizes the Docker infrastructure services used in the development environment.

Each service is isolated in its own directory, includes a 'docker-compose.yml' file, and may also contain:

a '.env' file
a '.env.example' file
a persistent data directory
a backup directory
service-specific configuration files

Currently available services:

* MySQL
* PostgreSQL
* Redis
* MongoDB
* RabbitMQ
* MinIO

Planned services:

* Grafana
* Elasticsearch

---

## Requirements

* Docker Desktop
* WSL2 backend recommended
* Git
* PowerShell 7 (Windows)

---

## Clone the Repository

```powershell
git clone git@github.com:edouard-todorov-formation/docker-development-services.git
```

The repository can be cloned into any directory.

Examples:

```text
C:\Projects\docker-development-services

D:\Docker\docker-development-services

/home/dev/docker-development-services
```

---

## Recommended Directory Structure

The reference environment uses the following organization:

```text
E:\Dev
├── Projects
├── Docker
│   └── Services
├── AI
└── Backups
```

The repository is then located at:

```text
E:\Dev\Docker\Services
```

This structure is not mandatory but is recommended to clearly separate:

* development projects
* Docker services
* backups
* AI resources

---

## Current Structure

```text
BDD/
├── MongoDB/
│   ├── .env.example
│   ├── docker-compose.yml
│   ├── backups/
│   └── data-mongodb/
│
├── MySQL/
│   ├── .env.example
│   ├── docker-compose.yml
│   ├── backups/
│   └── data-mysql/
│
├── PostgreSQL/
│   ├── .env.example
│   ├── docker-compose.yml
│   ├── backups/
│   ├── data-postgres/
│   └── data-pgadmin/
│
└── Redis/
     ├── .env.example
     ├── docker-compose.yml
     ├── backups/
     └── data-redis/
     
Messaging/
└── RabbitMQ/
    ├── .env.example
    ├── docker-compose.yml
    ├── backups/
    └── data-rabbitmq/

Storage
└── MinIO
     ├── .env.example
     ├── docker-compose.yml
     ├── backups/
     └── data-minio/
```

---

## Starting a Service

### Example with MySQL

Open a PowerShell terminal from the repository root directory.

Navigate to the service directory:

```powershell
cd BDD\MySQL
```

Create the `.env` file from the provided template:

```powershell
Copy-Item .env.example .env
```

This command creates a copy of `.env.example` and renames it to `.env`.

Edit the values in the `.env` file according to your needs.

Start the containers:

```powershell
docker compose up -d
```

---

## Verification and Management

List running containers:

```powershell
docker ps
```

Display logs:

```powershell
docker compose logs -f
```

Stop containers:

```powershell
docker compose stop
```

Restart containers:

```powershell
docker compose restart
```

Stop and remove containers:

```powershell
docker compose down
```

Recreate and start the service:

```powershell
docker compose up -d
```

---

## Available Services

### MySQL

Containers:

* mysql-server
* phpmyadmin

Ports:

| Service    | Port |
| ---------- | ---- |
| MySQL      | 3306 |
| phpMyAdmin | 8080 |

Access:

```text
http://localhost:8080
```

---

### PostgreSQL

Containers:

* postgres-server
* pgadmin

Ports:

| Service    | Port |
| ---------- | ---- |
| PostgreSQL | 5432 |
| pgAdmin    | 8081 |

Access:

```text
http://localhost:8081
```

---

### Redis

Container:

* redis-server

Ports:

| Service | Port |
| ------- | ---- |
| Redis   | 6379 |

Access:

```text
redis://localhost:6379
```

---

### MongoDB

Containers:

* mongodb-server
* mongo-express

Ports:

| Service       | Port  |
| ------------- | ----- |
| MongoDB       | 27017 |
| Mongo Express | 8082  |

Access:

```text
http://localhost:8082
```

---

### RabbitMQ

Container:

* rabbitmq-server

Ports:

| Service | Port |
|----------|----------|
| RabbitMQ AMQP | 5672 |
| RabbitMQ Management | 15672 |

Access:

```text
http://localhost:15672
```

---

### MinIO

Container :

* minio-server

Ports :

| Service | Port |
|----------|----------|
| MinIO API | 9000 |
| MinIO Console | 9001 |

Access :

```text
http://localhost:9001
```

---

## Secrets Management

The following files are never versioned:

```text
.env
```

Real passwords and credentials remain only on the local machine.

The following files are versioned:

```text
.env.example
```

---

## Persistent Data

Docker data directories are never pushed to GitHub.

Examples:

```text
data-mysql/
data-postgres/
data-pgadmin/
data-redis/
data-mongodb/
```

These directories are excluded through the `.gitignore` file.

---

## Backups

Each service includes a dedicated:

```text
backups/
```

directory intended to store future backup exports.

---

## Conventions

Each service follows the structure below:

```text
ServiceName/
├── .env
├── .env.example
├── docker-compose.yml
├── backups/
└── data-service/
```

Principles:

* 1 technology = 1 directory
* 1 `.env` file
* 1 `.env.example` file
* 1 `docker-compose.yml` file
* 1 dedicated data directory
* 1 dedicated backup directory

---

## Author

Edouard Todorov

Full Stack Developer

🌐 Portfolio: https://portfolio.tekedo.fr

💼 LinkedIn: https://www.linkedin.com/in/edouard-todorov

🐙 GitHub: https://github.com/edouard-todorov-formation
