# 📰 News App

A modern, feature-rich News Application built with Flutter, designed to keep you updated with the latest headlines from around the world.

## ✨ Features

- **Browse News**: Access breaking news and top headlines.
- **Categories**: Filter news by categories (Business, Entertainment, Health, Science, Sports, Technology).
- **Offline Support**: Cache news for offline reading.
- **Search**: Search for specific news articles.
- **Dark/Light Mode**: Seamless theme switching.
- **Responsive Design**: Optimized for various screen sizes.

## 🛠️ Tech Stack

This project leverages a robust stack of libraries and tools to ensure performance, scalability, and maintainability:

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Flutter Bloc](https://pub.dev/packages/flutter_bloc) & [Hydrated Bloc](https://pub.dev/packages/hydrated_bloc)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Routing**: [GoRouter](https://pub.dev/packages/go_router)
- **Functional Programming**: [Dartz](https://pub.dev/packages/dartz)
- **Local Storage**: [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **UI/UX**:
  - [Skeletonizer](https://pub.dev/packages/skeletonizer) (Loading effects)
  - [Lottie](https://pub.dev/packages/lottie) (Animations)
  - [Cached Network Image](https://pub.dev/packages/cached_network_image)

## 📂 Project Structure

The project follows a **Feature-First** architecture to ensure scalability and separation of concerns:

```
lib/
├── core/           # Core functionality (Routes, Themes, Utils, Network)
├── features/       # Feature-based modules (e.g., get_news)
│   └── get_news/
│       ├── data/       # Data layer (Repositories, Data Sources, Models)
│       ├── domain/     # Domain layer (Entities, Use Cases)
│       └── presentation/ # UI layer (Blocs, Pages, Widgets)
├── main.dart       # Application entry point
└── utility.dart    # General utilities
```

## 🚀 Getting Started

Follow these steps to set up the project locally.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1.  **Clone the repository**:

    ```bash
    git clone https://github.com/Mohamedismaell/News.git
    cd News_App
    ```

2.  **Install dependencies**:

    ```bash
    flutter pub get
    ```

3.  **Run the app**:
    ```bash
    flutter run
    ```

## 🧪 Testing

To run the tests:

```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1.  Fork the project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request
