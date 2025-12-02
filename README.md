<img width="1344" height="2992" alt="Screenshot_1764635341" src="https://github.com/user-attachments/assets/a502b86f-e097-433b-b528-b72fd8f8efe1" /><img width="1344" height="2992" alt="Screenshot_1764623644" src="https://github.com/user-attachments/assets/a27a3494-d582-46bd-992a-c2e0f3fd152c" /># 📰 News App

A modern, feature-rich News Application built with Flutter, designed to keep you updated with the latest headlines from around the world.

## ✨ Features

- **Browse News**: Access breaking news and top headlines.
- **Categories**: Filter news by categories (Business, Entertainment, Health, Science, Sports, Technology).
- **Offline Support**: Cache news for offline reading.
- **Search**: Search for specific news articles.
- **Dark/Light Mode**: Seamless theme switching.
- **Responsive Design**: <img width="1344" height="2992" alt="Screenshot_1764635323" src="https://github.com/user-attachments/assets/2774982b-7892-43bc-84a5-9423e08d8726" />
Optimized for various screen sizes.

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


## 📸 Screenshots

<p align="center">

<img width="1344" height="2992" alt="Screenshot_1764635341" src="https://github.com/user-attachments/assets/62e59a12-6759-4fdf-a1f5-b4f90e2162c8" /><img width="1344" height="2992" alt="Screenshot_1764623644" src="https://github.com/user-attachments/assets/c24b3663-e197-4b94-930d-046e973e93be" />
<img width="1344" height="2992" alt="Screenshot_1764635382" src="https://github.com/user-attachments/assets/c9696062-3730-4cb6-abc2-f019bf52ed82" />


  
</p>
<img width="1344" height="2992" alt="Screenshot_1764635397" src="https://github.com/user-attachments/assets/a802938c-f8a8-44b4-ab34-a498d1d182b1" />
<img width="1344" height="2992" alt="Screenshot_1764635322" src="https://github.com/user-attachments/assets/f4a297e1-5c33-4de3-b2ce-0715709880ff" />
<img width="1344" height="2992" alt="Screenshot_1764635388" src="https://github.com/user-attachments/assets/eca9b636-2fcc-4de9-8ec4-564eb052d458" />

## 🌐 API Source

This application uses the **NewsAPI**:

- API: [https://newsapi.org](https://newsapi.org)
- Endpoint: `/v2/top-headlines`
- You need an API key to fetch news articles.

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
