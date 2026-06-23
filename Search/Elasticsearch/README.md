# Elasticsearch

🇫🇷 [Version française](#version-française) | 🇬🇧 [English version](#english-version)

---

# Version française

## Présentation

Cette stack fournit :

* Elasticsearch 8.18.2
* Kibana

L'installation est destinée à un environnement de développement local exécuté via Docker Desktop.

Configuration retenue :

* Cluster mono-nœud (`single-node`)
* Sécurité Elasticsearch désactivée
* Persistance des données activée
* Kibana connecté à Elasticsearch

---

## Arborescence

```text
Elasticsearch
├── docker-compose.yml
├── .env
├── .env.example
├── config
│   └── templates
│       └── dev-default-template.json
├── scripts
│   └── apply-dev-template.ps1
├── elasticsearch-data
├── kibana-data
└── README.md
```

---

## Services

### Elasticsearch

URL :

```text
http://localhost:9200
```

Vérification :

```powershell
Invoke-RestMethod `
    -Uri "http://localhost:9200"
```

---

### Kibana

URL :

```text
http://localhost:5601
```

---

## Persistance

Les données Elasticsearch sont stockées dans :

```text
elasticsearch-data/
```

Les données Kibana sont stockées dans :

```text
kibana-data/
```

La persistance a été validée par création d'index puis redémarrage complet de la stack Docker.

---

## Template de développement

### Pourquoi ?

Par défaut Elasticsearch crée chaque index avec :

```json
{
    "number_of_shards": 1,
    "number_of_replicas": 1
}
```

Dans un cluster mono-nœud, les réplicas ne peuvent pas être alloués.

Conséquence :

```text
Health = Yellow
```

Ce comportement est normal mais génère des alertes inutiles dans un environnement de développement.

Le template fourni configure automatiquement :

```json
{
    "number_of_replicas": 0
}
```

pour tous les nouveaux index.

Résultat :

```text
Health = Green
```

sur les index créés après application du template.

---

## Fichier du template

Emplacement :

```text
config/templates/dev-default-template.json
```

Contenu :

```json
{
    "index_patterns": ["*"],
    "priority": 1,
    "template": {
        "settings": {
            "number_of_replicas": 0
        }
    }
}
```

---

## Script d'application du template

Emplacement :

```text
scripts/apply-dev-template.ps1
```

Ce script applique automatiquement le template à Elasticsearch via l'API REST.

---

## Utilisation du script

Depuis le dossier Elasticsearch :

```powershell
cd E:\Dev\Docker\Services\Search\Elasticsearch
```

Exécuter :

```powershell
.\scripts\apply-dev-template.ps1
```

Réponse attendue :

```text
acknowledged : True
```

---

## Vérification du template

```powershell
Invoke-RestMethod `
    -Uri "http://localhost:9200/_index_template/dev-default"
```

---

## Important

Le template n'est pas rétroactif.

Il s'applique uniquement aux index créés après son installation.

Les index existants conservent leur configuration actuelle jusqu'à modification explicite.

---

## Validation réalisée

* Elasticsearch opérationnel
* Kibana opérationnel
* API REST validée
* Persistance validée
* Template de développement documenté
* Script d'application disponible

---

[⬆ Back to top](#elasticsearch)

# English Version

## Overview

This stack provides:

* Elasticsearch 8.18.2
* Kibana

The installation is intended for a local development environment running on Docker Desktop.

Selected configuration:

* Single-node cluster (`single-node`)
* Elasticsearch security disabled
* Data persistence enabled
* Kibana connected to Elasticsearch

---

## Directory Structure

```text
Elasticsearch
├── docker-compose.yml
├── .env
├── .env.example
├── config
│   └── templates
│       └── dev-default-template.json
├── scripts
│   └── apply-dev-template.ps1
├── elasticsearch-data
├── kibana-data
└── README.md
```

---

## Services

### Elasticsearch

URL:

```text
http://localhost:9200
```

Verification:

```powershell
Invoke-RestMethod `
    -Uri "http://localhost:9200"
```

---

### Kibana

URL:

```text
http://localhost:5601
```

---

## Persistence

Elasticsearch data is stored in:

```text
elasticsearch-data/
```

Kibana data is stored in:

```text
kibana-data/
```

Persistence has been validated by creating an index and performing a full Docker stack restart.

---

## Development Template

### Why?

By default, Elasticsearch creates every index with:

```json
{
    "number_of_shards": 1,
    "number_of_replicas": 1
}
```

In a single-node cluster, replica shards cannot be allocated.

Result:

```text
Health = Yellow
```

This behavior is normal but generates unnecessary warnings in a development environment.

The provided template automatically configures:

```json
{
    "number_of_replicas": 0
}
```

for all newly created indices.

Result:

```text
Health = Green
```

for indices created after the template is applied.

---

## Template File

Location:

```text
config/templates/dev-default-template.json
```

Content:

```json
{
    "index_patterns": ["*"],
    "priority": 1,
    "template": {
        "settings": {
            "number_of_replicas": 0
        }
    }
}
```

---

## Template Deployment Script

Location:

```text
scripts/apply-dev-template.ps1
```

This script automatically applies the template to Elasticsearch through the REST API.

---

## Using the Script

From the Elasticsearch directory:

```powershell
cd E:\Dev\Docker\Services\Search\Elasticsearch
```

Run:

```powershell
.\scripts\apply-dev-template.ps1
```

Expected response:

```text
acknowledged : True
```

---

## Verify the Template

```powershell
Invoke-RestMethod `
    -Uri "http://localhost:9200/_index_template/dev-default"
```

---

## Important

The template is not retroactive.

It only applies to indices created after installation.

Existing indices keep their current configuration until explicitly modified.

---

## Validation Performed

* Elasticsearch operational
* Kibana operational
* REST API validated
* Data persistence validated
* Development template documented
* Deployment script available

---

[⬆ Back to top](#elasticsearch)
