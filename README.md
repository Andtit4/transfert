# transfert

Un nouveau projet Flutter.

## Pour commencer

Ce projet est un point de départ pour une application Flutter.

Voici quelques ressources pour vous aider à démarrer si c'est votre premier projet Flutter :

- [Lab: Créez votre première application Flutter](https://docs.flutter.dev/get-started/codelab)
- [Carnet de recettes: Exemples utiles de Flutter](https://docs.flutter.dev/cookbook)

Pour obtenir de l'aide pour démarrer avec le développement Flutter, consultez la
[documentation en ligne](https://docs.flutter.dev/), qui propose des tutoriels,
des exemples, des conseils sur le développement mobile, et une référence complète de l'API.

## Architecture du projet

lib/
└── presentation/
    ├── pages/           # Vos écrans
    ├── widgets/         # Les composants réutilisables
    └── bloc/           # La gestion d'état, le Domain Layer, Département Stratégique. lib/
└── domain/
    ├── entities/       # Vos modèles de données
    ├── usecases/       # Les actions possibles
    └── repositories/   # Les contrats de données et le back office, lib/
└── data/
    ├── repositories/   # L'implémentation concrète
    ├── datasources/    # Les sources de données
    └── models/         # Les convertisseurs de données,
