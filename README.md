# 📰 News App

A modern, feature-rich News Application built with Flutter, designed to keep you updated with the latest headlines from around the world.

## ✨ Features

- **Browse News**: Access breaking news and top headlines.
- **Categories**: Filter news by categories (Business, Entertainment, Health, Science, Sports, Technology).
- **Offline Support**: Cache news for offline reading.
- **Search**: Search for specific news articles.
- **Dark/Light Mode**: Seamless theme switching.
- **Responsive Design**:
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

<markdown-accessiblity-table data-catalyst=""><table>
<thead>
<tr>
<th>Light</th>
<th>Dark</th>
</tr>
</thead>
<tbody>
<tr>
<td> <img src="https://github.com/user-attachments/assets/1ab95c7a-4b44-4bd2-aa2a-5822671aec1e" width="300" style="max-width: 100%;"></td>
<td> <img src="https://github.com/user-attachments/assets/6b037609-d14e-41d1-a7e3-be314e5dfa59" width="300" style="max-width: 100%;"></td>
</tr>
<tr>
<td><img src="https://github.com/user-attachments/assets/665d8806-d2a3-4d43-a8bb-de2a79f4d61d" width="300" style="max-width: 100%;"></td>
<td><img src="https://github.com/user-attachments/assets/32cc7199-3d18-4ffe-8a36-89eb97c90878" width="300" style="max-width: 100%;"></td>
</tr>
<tr>
<td><img src="https://github.com/user-attachments/assets/459a721c-6402-48c4-b2f0-09eeeb049f31" width="300" style="max-width: 100%;"></td>
<td><img src="https://github.com/user-attachments/assets/ea6fcc83-711d-4d5c-ad57-9e8ac6c08fdb" width="300" style="max-width: 100%;"></td>
</tr> 
<tr>
<td><img src="https://github.com/user-attachments/assets/ef457a19-74ff-4ba0-b544-89485751d5e3" width="300" style="max-width: 100%;"></td>
<td><img src="https://github.com/user-attachments/assets/14f18b3c-b389-452f-8405-06bb23ad3946" width="300" style="max-width: 100%;"></td>
</tr>
<tr>
<td><img src="https://github.com/user-attachments/assets/f72bd21d-c7b2-442e-8a56-15a767b5d822" width="300" style="max-width: 100%;"></td>
<td><img src="https://github.com/user-attachments/assets/526318e0-dd73-45f8-abb1-375fba0d87ff" width="300" style="max-width: 100%;"></td>
</tr>
<tr>
<td><img src="https://github.com/user-attachments/assets/ccbf4eff-1487-48ca-8a9b-8c7d32c4940d" width="300" style="max-width: 100%;"></td>
<td><img src="https://github.com/user-attachments/assets/681303fb-6f39-42f5-9b5b-713a82052edc" width="300" style="max-width: 100%;"></td>
</tr>  
</tbody>
</table></markdown-accessiblity-table>





## 🌐 API Source

This application uses the **NewsAPI**:

- API: [https://newsapi.org](https://api.webz.io/)
- Endpoint: `newsApiLite`
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
2.  Create your Feature Branch 
3.  Commit your changes
4.  Push to the Branch 
5.  Open a Pull Request
