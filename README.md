# 📚 Bookia Store

A production-style Flutter bookstore app focused on clean architecture, scalable feature modules, and polished authentication UX.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.x-blue.svg)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20%2B%20Feature--First-purple.svg)
![State Management](https://img.shields.io/badge/State%20Management-BLoC%20%2F%20Cubit-blue.svg)

## ✨ Highlights

*   🔐 **Complete Auth Flow**: Login and Register with secure token management.
*   🌍 **Localization**: English + Arabic support using `easy_localization`.
*   📱 **Responsive UI**: Adaptive sizing for all devices with `flutter_screenutil`.
*   🏗️ **Scalable Structure**: Feature-first organization with clean boundaries.
*   🧩 **Maintainable Codebase**: Reusable core widgets, centralized strings, and themes.
*   🔍 **Advanced Search**: Real-time book search with optimized debounce logic.
*   🛒 **Shopping Experience**: Fully functional Cart and Wishlist management.

## 🧰 Tech Stack

*   **Flutter + Dart**
*   **BLoC/Cubit** for state management
*   **easy_localization** for i18n
*   **flutter_screenutil** for responsive design
*   **Dio** for networking & API integration
*   **Skeletonizer** for polished loading states
*   **flutter_gen** for strongly-typed assets
*   **Shared Preferences** for local data persistence

## 🏗️ Architecture

The project follows a **Feature-First + Clean Architecture** approach where each feature can evolve independently.

```text
lib/
├── core/
│   ├── helper/
│   ├── networking/
│   ├── routing/
│   ├── theme/
│   └── widgets/
├── features/
│   ├── auth/
│   ├── home/
│   ├── cart/
│   ├── wishlist/
│   ├── search/
│   └── profile/
└── main.dart
```

## 🔄 Data Flow

```mermaid
graph TD
    A[UI Layer] -->|User Action| B[Cubit / Bloc]
    B -->|State Updates| A
    B -->|Request| C[Repository]
    C -->|Response| B
    C -->|API Calls| D[Remote Data Source]
    C -->|Local Storage| E[Local Data Source]
```

## 🎬 Project Demo

*(Add your demo video or GIF here)*

## 📸 Screenshots

### Authentication & Home
| Splash | Onboarding | Login | Home |
| :---: | :---: | :---: | :---: |
| ![Splash](assets/screenshots/splash.png) | ![Onboarding](assets/screenshots/onboarding.png) | ![Login](assets/screenshots/login.png) | ![Home](assets/screenshots/home.png) |

### Features
| Search | Cart | Wishlist | Profile |
| :---: | :---: | :---: | :---: |
| ![Search](assets/screenshots/search.png) | ![Cart](assets/screenshots/cart.png) | ![Wishlist](assets/screenshots/wishlist.png) | ![Profile](assets/screenshots/profile.png) |

## 🚀 Getting Started

### Prerequisites

*   Flutter SDK installed
*   Dart SDK installed
*   Android Studio or VS Code

### Run Locally

```bash
git clone https://github.com/your-username/bookia.git
cd bookia
flutter pub get
flutter run
```

### Optional: Regenerate Generated Files

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🤝 Contributing

Contributions are welcome.

1.  Fork the repository
2.  Create your branch: `git checkout -b feature/your-feature`
3.  Commit changes: `git commit -m "Add your feature"`
4.  Push branch: `git push origin feature/your-feature`
5.  Open a Pull Request

---
Developed with ❤️ by Ahmed Darwish
