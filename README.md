# Infinite Album Viewer

A Flutter application built with Clean Architecture principles for viewing albums with infinite scrolling.

## Project Structure

```
lib/
├── core/
│   ├── di/
│   │   └── hive_init.dart          # Hive initialization
│   ├── network/
│   │   └── dio_client.dart         # HTTP client configuration
│   └── utils/
│       └── constants.dart          # App constants
├── features/
│   └── albums/
│       ├── data/
│       │   ├── models/             # Data models
│       │   ├── datasources/        # Remote and local data sources
│       │   └── repositories_impl/  # Repository implementations
│       ├── domain/
│       │   ├── entities/           # Business entities
│       │   ├── repositories/       # Repository interfaces
│       │   └── usecases/           # Business logic use cases
│       └── presentation/
│           ├── bloc/               # State management
│           ├── widgets/            # Reusable widgets
│           └── screens/            # UI screens
└── main.dart
```

## Dependencies

- **flutter_bloc**: State management
- **dio**: HTTP client for API calls
- **hive**: Local storage
- **hive_flutter**: Flutter integration for Hive
- **path_provider**: File system access
- **equatable**: Value equality for objects

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Architecture

This project follows Clean Architecture principles with the following layers:

- **Presentation Layer**: UI components, BLoC state management
- **Domain Layer**: Business logic, entities, use cases
- **Data Layer**: Data sources, models, repository implementations

## Features

- [ ] Album listing with infinite scroll
- [ ] Album details view
- [ ] Photo gallery
- [ ] Offline support
- [ ] Search functionality
