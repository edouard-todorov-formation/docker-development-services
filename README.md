# Docker Development Services

Infrastructure Docker de développement pour l'apprentissage, l'expérimentation et les projets Full Stack.

Docker-based development infrastructure for learning, experimentation, and Full Stack projects.

---

## Languages

- [🇫🇷 Français](#version-Française)
- [🇬🇧 English](#English-Version)

---

# Version Française

...

## Objectif

Ce dépôt centralise les services d'infrastructure Docker utilisés dans l'environnement de développement.

Chaque service est isolé dans son propre dossier, dispose d'un fichier `docker-compose.yml` et peut inclure :

- un fichier `.env`
- un fichier `.env.example`
- un dossier de données persistant
- un dossier de sauvegardes
- des fichiers de configuration spécifiques selon le service

## Philosophie du dépôt

Ces services ont pour objectif d'accélérer le développement des projets.

Ils constituent une infrastructure mutualisée utilisée pendant les phases d'apprentissage, d'expérimentation et de développement.

Lorsqu'un projet atteint un niveau de maturité suffisant, il peut :

• continuer à utiliser ces services ;
• embarquer progressivement sa propre stack ;
• devenir totalement autonome.

Les services présents dans ce dépôt ne sont pas destinés à être obligatoirement utilisés en production.

## Services actuellement disponibles :

* MySQL
* PostgreSQL
* Redis
* MongoDB
* RabbitMQ
* MinIO
* Grafana
* Prometheus
* Node Exporter
* Elasticsearch
* Kibana

Services prévus :

* Nginx Proxy Manager

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

Storage/
└── MinIO/
    ├── .env.example
    ├── docker-compose.yml
    ├── backups/
    └── data-minio/

Monitoring/
├── Grafana/
│   ├── .env.example
│   ├── docker-compose.yml
│   ├── backups/
│   └── data-grafana/
│
├── Prometheus/
│   ├── docker-compose.yml
│   ├── prometheus.yml
│   ├── backups/
│   └── data-prometheus/
│
└── NodeExporter/
    ├── docker-compose.yml
    └── backups/

Search/
└── Elasticsearch/
    ├── .env.example
    ├── docker-compose.yml
    ├── data-elasticsearch/
    ├── data-kibana/
    ├── backups/
    ├── config/
    │   └── templates/
    │       └── dev-default-template.json
    ├── scripts/
    │   └── apply-dev-template.ps1
    ├── docs/
    └── README.md
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

### Grafana

Conteneur :

* grafana-server

Ports :

| Service | Port |
|----------|----------|
| Grafana | 3000 |

Accès :

```text
http://localhost:3000
```

---

### Prometheus

Conteneur :

* prometheus-server

Ports :

| Service | Port |
|----------|----------|
| Prometheus | 9090 |

Accès :

```text
http://localhost:9090
```

---

### Node Exporter

Conteneur :

* node-exporter

Ports :

| Service | Port |
|----------|----------|
| Node Exporter | 9100 |

Accès :

```text
http://localhost:9100/metrics
```
Endpoint Prometheus exposant les métriques système.

---

### Elasticsearch

Conteneurs :

* elasticsearch
* kibana

Ports :

| Service | Port |
|----------|----------|
| Elasticsearch | 9200 |
| Kibana | 5601 |

Accès :

```text
http://localhost:9200
http://localhost:5601
```

Particularités :

• Persistance validée
• Kibana inclus
• Cluster mono-nœud
• xpack.security.enabled=false
• Template Elasticsearch dev-default
• number_of_replicas=0 par défaut

---

## Configuration du monitoring

Après le démarrage des services Monitoring, quelques actions sont nécessaires pour finaliser la configuration.

## Configuration Elasticsearch

Après le premier démarrage d'Elasticsearch, appliquer le template de développement :

PowerShell :

.\scripts\apply-dev-template.ps1

Objectif :

Configurer automatiquement :

{
    "number_of_replicas": 0
}

pour tous les nouveaux index créés dans l'environnement de développement.

Cette configuration évite les index en état jaune sur un cluster mono-nœud.

### Ajouter Prometheus comme source de données Grafana

1. Ouvrir Grafana :

```text
http://localhost:3000
```

2. Se connecter avec les identifiants définis dans le fichier .env.

3. Aller dans :

```text
Connections
→ Data Sources
→ Add data source
```

4. Sélectionner :

```text
Prometheus
```

5. Utiliser l'URL suivante :

```text
http://host.docker.internal:9090
```

Note :

- `http://localhost:9090` depuis votre navigateur web
- `http://host.docker.internal:9090` depuis un conteneur Docker

6. Cliquer sur :

```text
Save & Test
```

### Importer un dashboard système

1. Dans Grafana :

```text
Dashboards
```

→ Import

2. Importer le dashboard :

```text
1860
```

3. Sélectionner la source de données Prometheus.
Cliquer sur :
```text
Import
```

Ce dashboard permet de visualiser :

l'utilisation CPU ;
l'utilisation mémoire ;
l'utilisation disque ;
le trafic réseau ;
la charge système ;
le temps de fonctionnement de la machine.

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
data-rabbitmq/
data-minio/
data-grafana/
data-prometheus/
data-elasticsearch/
data-kibana/
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
├── docker-compose.yml
├── backups/
├── data-service/ (données persistantes)(si nécessaire)
├── .env (optionnel)
├── .env.example (optionnel)
├── config/ (optionnel)
├── scripts/ (optionnel)
├── docs/ (optionnel)
└── fichiers de configuration spécifiques (optionnels)
```

Principes :

* 1 service par dossier dédié
* 1 fichier `docker-compose.yml`
* 1 dossier de données dédié lorsque nécessaire
* 1 dossier de sauvegardes dédié lorsque nécessaire
* 1 fichier `.env` lorsque le service utilise des variables d'environnement
* 1 fichier `.env.example` lorsque le service utilise des variables d'environnement

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

Each service is isolated in its own directory, includes a `docker-compose.yml` file, and may also contain:

- a `.env` file
- a `.env.example` file
- a persistent data directory
- a backup directory
- service-specific configuration files

## Repository Philosophy

These services are designed to accelerate project development.

They provide a shared infrastructure used during learning, experimentation, and development phases.

As a project reaches a sufficient level of maturity, it can:

continue using these services;
progressively adopt its own stack;
become fully autonomous.

The services provided in this repository are not intended to be mandatory for production use.

## Currently available services:

* MySQL
* PostgreSQL
* Redis
* MongoDB
* RabbitMQ
* MinIO
* Grafana
* Prometheus
* Node Exporter
* Elasticsearch
* Kibana

Planned services:

* Nginx Proxy Manager

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

Storage/
└── MinIO/
    ├── .env.example
    ├── docker-compose.yml
    ├── backups/
    └── data-minio/

Monitoring/
├── Grafana/
│   ├── .env.example
│   ├── docker-compose.yml
│   ├── backups/
│   └── data-grafana/
│
├── Prometheus/
│   ├── docker-compose.yml
│   ├── prometheus.yml
│   ├── backups/
│   └── data-prometheus/
│
└── NodeExporter/
    ├── docker-compose.yml
    └── backups/

Search/
└── Elasticsearch/
    ├── .env.example
    ├── docker-compose.yml
    ├── data-elasticsearch/
    ├── data-kibana/
    ├── backups/
    ├── config/
    │   └── templates/
    │       └── dev-default-template.json
    ├── scripts/
    │   └── apply-dev-template.ps1
    ├── docs/
    └── README.md
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

### Grafana

Container:

* grafana-server

Ports:

| Service | Port |
|----------|----------|
| Grafana | 3000 |

Access:

```text
http://localhost:3000
```

---

### Prometheus

Container:

* prometheus-server

Ports:

| Service | Port |
|----------|----------|
| Prometheus | 9090 |

Access:

```text
http://localhost:9090
```

---

### Node Exporter

Container:

* node-exporter

Ports:

| Service | Port |
|----------|----------|
| Node Exporter | 9100 |

Access:

```text
http://localhost:9100/metrics
```
Prometheus endpoint exposing system metrics.

---

### Elasticsearch

Container :

* elasticsearch
* kibana

Ports :

| Service | Port |
|----------|----------|
| Elasticsearch | 9200 |
| Kibana | 5601 |

Access :

```text
http://localhost:9200
http://localhost:5601
```

Key Characteristics :

• Persistence enabled and validated
• Kibana included
• Single-node cluster
• xpack.security.enabled=false
• Template Elasticsearch dev-default
• number_of_replicas=0 by default

---

## Monitoring Configuration

After starting the monitoring services, a few additional steps are required to complete the setup.

## Elasticsearch Configuration

After the first Elasticsearch startup, apply the development template:

PowerShell:

.\scripts\apply-dev-template.ps1

Purpose:

Automatically configure:

{
    "number_of_replicas": 0
}

for all new indexes created in the development environment.

This setting prevents indexes from entering a yellow state when running on a single-node cluster.

### Add Prometheus as a Grafana Data Source

1. Open Grafana:

```text
http://localhost:3000
```

2. Sign in using the credentials defined in the `.env` file.

3. Navigate to:

```text
Connections
→ Data Sources
→ Add data source
```

4. Select:

```text
Prometheus
```

5. Use the following URL:

```text
http://host.docker.internal:9090
```

Note:

- `http://localhost:9090` from your web browser
- `http://host.docker.internal:9090` from a Docker container.

6. Click:

```text
Save & Test
```

### Import a System Dashboard

1. In Grafana:

```text
Dashboards
```

→ Import

2. Import the following dashboard:

```text
1860
```

3. Select the Prometheus data source.

4. Click:

```text
Import
```

This dashboard provides visibility into:

CPU usage;
memory usage;
disk usage;
network traffic;
system load;
system uptime.

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

Docker data directories are excluded from version control and never pushed to GitHub.

Examples:

```text
data-mysql/
data-postgres/
data-pgadmin/
data-redis/
data-mongodb/
data-rabbitmq/
data-minio/
data-grafana/
data-prometheus/
data-elasticsearch/
data-kibana/
```

These directories are excluded through the `.gitignore` file.

---

## Backups

Each service includes a dedicated `backups/` directory intended to store backup exports.

---

## Conventions

Each service follows the structure below:

```text
ServiceName/
├── docker-compose.yml
├── backups/
├── data-service/ (when required)
├── .env (when required)
├── .env.example (when required)
├── config/ (when required)
├── scripts/ (when required)
├── docs/ (when required)
└── service-specific configuration files (when required)
```

Principles:

* 1 service per dedicated folder
* 1 `docker-compose.yml` file
* 1 dedicated data directory when required
* 1 dedicated backup directory when required
* 1 `.env` file when environment variables are needed
* 1 `.env.example` file when environment variables are needed

---

## Author

Edouard Todorov

Full Stack Developer

🌐 Portfolio: https://portfolio.tekedo.fr

💼 LinkedIn: https://www.linkedin.com/in/edouard-todorov

🐙 GitHub: https://github.com/edouard-todorov-formation
