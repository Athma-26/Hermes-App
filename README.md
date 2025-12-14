# Book-Tracking-App
# 📚 Hermes: Your Personal Messenger of Knowledge

[![Flutter](https://img.shields.io/badge/Flutter-Framework-blue?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-Language-blue?logo=dart)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/YOUR_GITHUB_USERNAME/hermes-book-tracker?style=social)](https://github.com/YOUR_GITHUB_USERNAME/hermes-book-tracker/stargazers)

---

## ✨ Overview

Hermes is a beautifully designed, intuitive Flutter application that helps you track your reading journey. Named after the Greek messenger of the gods, Hermes aims to be your personal messenger of knowledge, making it effortless to manage your book collection, discover new reads, track your progress, and even keep notes and reviews.

Whether you're an avid reader or just starting, Hermes provides a seamless experience to categorize, rate, and reflect on your literary adventures.

**Key Features:**

* **Book Management:** Add, edit, and delete books from your personal library.
* **Reading Status:** Mark books as 'read', 'reading', or 'want to read'.
* **Personalized Ratings & Reviews:** Rate books and write detailed reviews.
* **Favorite Books:** Highlight your most loved books for quick access.
* **Statistics:** Get insights into your reading habits (total books, favorites, genres, languages).
* **Genre & Language Filtering:** Easily sort your collection.
* **Search Functionality:** Quickly find any book in your library.
* **Adaptive Theme:** Seamlessly switch between light and dark mode.
* **Beautiful UI/UX:** A clean, modern interface inspired by Material Design.

---

## 📸 Screenshots

Here's a glimpse of Hermes in action!

| Splash Screen 🚀 | Book List (Light) 📖 | Book List (Dark) 🌙 |
| :---------------- | :------------------ | :---------------- |
| ![](/assets/screenshots/splash_screen.png) | ![](/assets/screenshots/book_list_light.png) | ![](/assets/screenshots/book_list_dark.png) |

| Book Details (Reviews) 📝 | Add/Edit Book Form ✍️ | Search Results 🔍 |
| :----------------------- | :------------------ | :---------------- |
| ![](/assets/screenshots/book_details.png) | ![](/assets/screenshots/edit_book_form.png) | ![](/assets/screenshots/search_results.png) |

---

## 🎥 Demo Video

Watch a short video demonstration of Hermes' core features!

[![Hermes Demo Video](https://img.youtube.com/vi/YOUR_VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)
*(Click the image above to watch the demo on YouTube)*

---

## 🛠️ Tech Stack

* **Flutter:** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
* **Dart:** Google's optimized client-side language for fast apps on any platform.
* **State Management:** Provider (or GetX/Riverpod/BLoC - *mention what you use*).
* **Database:** Hive (or SQLite/Firebase - *mention what you use for local/cloud storage*).
* **Dependencies:**
    * `flutter_rating_bar`: For star ratings.
    * `intl`: For date formatting.
    * `provider` (if used): For state management.
    * `hive` / `hive_flutter` (if used): For local database.
    * `image_picker` (if you add cover image functionality).
    * `path_provider` (if you need to store files).

---

## ⚙️ Installation & Setup

Follow these steps to get Hermes up and running on your local machine.

### Prerequisites

* **Flutter SDK:** Make sure you have Flutter installed. If not, follow the official Flutter installation guide: [Install Flutter](https://flutter.dev/docs/get-started/install)
* **IDE:** Android Studio, VS Code, or IntelliJ IDEA with Flutter plugins installed.

### Steps

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Athma-26/Hermes-App.git](ttps://github.com/Athma-26/Hermes-App.git)
    cd hermes-book-tracker
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```
    (Choose your desired device/emulator from your IDE or by running `flutter devices`)

---

## 🧪 Running Tests

Hermes includes a comprehensive suite of unit and widget tests to ensure reliability.

To run all tests:

```bash
flutter test
