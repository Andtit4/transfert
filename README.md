# Transfert

Un nouveau projet Flutter.

## Introduction

Ce projet sert de point de départ pour le développement d'une application Flutter.

### Ressources utiles pour débuter :

- [Lab : Créez votre première application Flutter](https://docs.flutter.dev/get-started/codelab)  
- [Recettes Flutter : Exemples pratiques](https://docs.flutter.dev/cookbook)

Pour plus d'informations, consultez la [documentation Flutter](https://docs.flutter.dev/) qui propose des tutoriels, des exemples, des guides de développement mobile, et une référence complète de l'API.

## Structure du projet

```plaintext
lib/
├── presentation/
│   ├── pages/         # Écrans de l'application
│   ├── widgets/       # Composants réutilisables
│   └── bloc/          # Gestion d'état et logique stratégique
├── domain/
│   ├── entities/      # Modèles de données
│   ├── usecases/      # Cas d'utilisation (actions)
│   └── repositories/  # Interfaces pour la gestion des données
├── data/
│   ├── repositories/  # Implémentations concrètes des interfaces
│   ├── datasources/   # Sources de données (API, base de données, etc.)
│   └── models/        # Modèles pour les transformations de données
