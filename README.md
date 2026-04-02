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




https://github.com/user-attachments/assets/53be56b5-b7d5-45f9-95c9-706b5b2dbcd4




## 📸 Screenshots
<img width="275" height="600" alt="image" src="https://github.com/user-attachments/assets/f6027253-091a-4477-a3ac-51b516f8f050" />
<img width="276" height="612" alt="image" src="https://github.com/user-attachments/assets/20da873e-c75f-4092-b9a7-1ab6de1e1f12" />
<img width="293" height="611" alt="image" src="https://github.com/user-attachments/assets/5e71aaf5-8f14-4431-abfb-64f940c9db15" />
<img width="276" height="611" alt="image" src="https://github.com/user-attachments/assets/5c8d511d-03bc-4368-b4cd-7e723689732a" />
<img width="327" height="720" alt="image" src="https://github.com/user-attachments/assets/9b441007-d2bf-4381-a6a9-346affc62636" />
<img width="332" height="729" alt="image" src="https://github.com/user-attachments/assets/a8f24d8f-29d8-492f-9441-c2e1c96185c5" />
<img width="324" height="712" alt="image" src="https://github.com/user-attachments/assets/005d496b-233b-4c69-bbfd-9c41de3eae1d" />
<img width="324" height="696" alt="image" src="https://github.com/user-attachments/assets/4efbfbfc-ddf5-4f1a-ad7e-ad3f81cd98a7" />
<img width="313" height="682" alt="image" src="https://github.com/user-attachments/assets/ce37b8e9-8e76-48e2-9c05-7831c04fd637" />
<img width="253" height="552" alt="image" src="https://github.com/user-attachments/assets/78515b10-db8f-4b27-868e-f29c858549f3" />
<img width="327" height="705" alt="image" src="https://github.com/user-attachments/assets/b24026ce-a86d-49e7-983b-af9b851d8991" />

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
git clone https://github.com/AHMEDCS50MAHMOUD/bookia/edit/master
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
