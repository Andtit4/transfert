# transfert

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project architecture

lib/
└── presentation/
    ├── pages/           # Tes écrans
    ├── widgets/         # Les composants réutilisables
    └── bloc/           # La gestion d'état, le Domain Layer, Département Stratégique. lib/
└── domain/
    ├── entities/       # Tes modèles de données
    ├── usecases/       # Les actions possibles
    └── repositories/   # Les contrats de données et le back office, lib/
└── data/
    ├── repositories/   # L'implémentation concrète
    ├── datasources/    # Les sources de données
    └── models/         # Les convertisseurs de données,
