# Docker Development Services

Infrastructure Docker de développement pour l'apprentissage, les expérimentations et les projets Full Stack.

## Objectif

Ce dépôt centralise les services techniques utilisés dans l'environnement de développement.

Services actuellement disponibles :

* MySQL
* PostgreSQL
* Redis
* MongoDB

Services prévus :

* RabbitMQ
* MinIO
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
```

---

## Démarrer un service

### Exemple avec MySQL

Se placer dans le dossier du service :

```powershell
cd BDD\MySQL
```

Créer le fichier `.env` :

```powershell
Copy-Item .env.example .env
```

Modifier les paramètres du fichier `.env`.

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
docker compose down
```

Redémarrer les conteneurs :

```powershell
docker compose restart
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

* postgres
* pgadmin

Port PostgreSQL :

```text
5432
```

---

### Redis

Conteneur :

* redis

Port :

```text
6379
```

---

### MongoDB

Conteneurs :

* mongodb
* mongo-express

Port MongoDB :

```text
27017
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

## Historique

Infrastructure validée :

* Git
* GitHub SSH
* Docker Desktop
* MySQL
* PostgreSQL
* Redis
* MongoDB
* Persistance des données
* Versionnement Git des stacks Docker

---

## Auteur

Edouard Todorov