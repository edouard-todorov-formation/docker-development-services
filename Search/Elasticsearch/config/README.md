# Elasticsearch Development Template

## 🌐 Navigation

* [Français](#francais)
* [English](#english)

---

# Français

## Pourquoi ?

Par défaut, Elasticsearch crée chaque index avec :

```json
{
    "number_of_shards": 1,
    "number_of_replicas": 1
}
```

Dans un cluster mono-nœud, les réplicas ne peuvent pas être alloués.

### Conséquence

* Health = **Yellow**

Ce comportement est normal mais génère des alertes inutiles dans un environnement de développement.

Le template fourni configure automatiquement :

```json
{
    "number_of_replicas": 0
}
```

pour tous les nouveaux index.

### Résultat

* Health = **Green**

sur les index créés après application du template.

---

## Fichier du template

### Emplacement

```text
config/templates/dev-default-template.json
```

### Contenu

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

### Emplacement

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

### Réponse attendue

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

# English

## Why?

By default, Elasticsearch creates each index with:

```json
{
    "number_of_shards": 1,
    "number_of_replicas": 1
}
```

In a single-node cluster, replicas cannot be allocated.

### Consequence

* Health = **Yellow**

This behavior is expected, but it generates unnecessary alerts in a development environment.

The provided template automatically configures:

```json
{
    "number_of_replicas": 0
}
```

for all newly created indexes.

### Result

* Health = **Green**

for indexes created after the template has been applied.

---

## Template File

### Location

```text
config/templates/dev-default-template.json
```

### Content

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

### Location

```text
scripts/apply-dev-template.ps1
```

This script automatically applies the template to Elasticsearch using the REST API.

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

### Expected Response

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

The template is **not retroactive**.

It only applies to indexes created after the template has been installed.

Existing indexes keep their current configuration until they are explicitly modified.
