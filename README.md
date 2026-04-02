# 📚 Bookia - Book Store App

Bookia is a modern Flutter application for browsing and purchasing books. It offers a seamless shopping experience with features like user authentication, real-time search, cart management, and a wishlist.

## 🚀 Features

- **User Authentication**: Secure Login and Registration.
- **Home Screen**: Browse best-sellers and featured book sliders.
- **Search**: Fast real-time book search with debounce logic.
- **Cart Management**: Add, remove, and update book quantities in your cart.
- **Wishlist**: Save your favorite books for later.
- **Profile**: Manage user info and logout.
- **Localization**: Supports multiple languages (English & Arabic).
- **Responsive UI**: Optimized for different screen sizes using `flutter_screenutil`.

## 🛠️ Tech Stack & Architecture

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [Flutter BLoC (Cubit)](https://pub.dev/packages/flutter_bloc)
- **Networking**: [Dio](https://pub.dev/packages/dio) for API calls.
- **Dependency Injection**: Simple provider pattern via `BlocProvider`.
- **UI Components**:
  - `Skeletonizer` for loading states.
  - `Easy Localization` for translation.
  - `Flutter SVG` for vector icons.
- **Architecture**: Clean Architecture / MVVM Pattern.

## 📸 Screenshots

| Home | Search | Cart | Wishlist |
|------|--------|------|----------|
| ![Home](assets/screenshots/home.png) | ![Search](assets/screenshots/search.png) | ![Cart](assets/screenshots/cart.png) | ![Wishlist](assets/screenshots/wishlist.png) |

*(Note: Please add your screenshots to the `assets/screenshots` folder or update the links)*

## 📦 Getting Started

### Prerequisites
- Flutter SDK (Latest Stable)
- Android Studio / VS Code

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/bookia.git
   ```
2. Navigate to the project directory:
   ```bash
   cd bookia
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
Developed with ❤️ by Ahmed Darwish
