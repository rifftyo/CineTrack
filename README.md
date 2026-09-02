# CineTrack 🎬

<p align="center">
  <img
    src="https://github.com/user-attachments/assets/431a65cc-6166-42c8-b3a2-5eb9b9fc0db6"
    alt="CineTrack - Mobile Movie Tracking Application"
    width="900"
  />
</p>

**CineTrack** is a mobile application that helps users discover movies, manage their watchlist, keep track of watched movies, provide ratings and reviews, and view their watching activity statistics in one application.

The application is built using **Flutter** with a **Clean Architecture** approach to provide a modular, scalable, and maintainable codebase.

> 🎯 **Project Type:** Mobile Application
> 📱 **Platform:** Android & iOS
> 🛠️ **Framework:** Flutter
> 💻 **Language:** Dart
> 🏗️ **Architecture:** Clean Architecture

---

## ✨ Features

### 🔍 Movie Discovery

* Browse the movie catalog.
* Search for movies based on user needs.
* View detailed movie information.
* Display information such as movie title, synopsis, cast, and rating.

### 📄 Movie Details

Users can view detailed information about a movie, including:

* Movie title
* Synopsis
* Cast
* Rating
* Other relevant movie information

### 👤 Profile

Users can manage their profile information and preferences as part of their overall experience with the application.

### 📎 Watchlist

The application allows users to add movies to their personal watchlist, making it easier to manage movies they want to watch.

### ⭐ Rating & Review

Users can provide ratings and reviews for movies they have watched to record and share their viewing experience.

### 🔐 Secure Storage

Sensitive information is stored using secure storage to help protect user data.

### 🎨 Modern UI

The application uses modern UI components with support for:

* Material Design 3
* Responsive layouts
* Custom animations
* Google Fonts
* Rating components
* Data visualization

---

## 🏗️ Architecture

CineTrack uses a **Clean Architecture** approach with a feature-based structure that separates the application into multiple layers.

```text
lib/
│
├── core/
│   └── Shared utilities & common components
│
├── features/
│   └── Feature-based modules
│       ├── data/
│       ├── domain/
│       └── presentation/
│
├── injection.dart
└── main.dart
```

### Layer Responsibilities

#### Data Layer

Responsible for retrieving and managing application data.

```text
Data Sources
     ↓
Models
     ↓
Repository Implementation
```

#### Domain Layer

Contains the application's business logic and remains independent of specific frameworks or data implementations.

```text
Entities / Business Rules
          ↓
      Use Cases
          ↓
    Repository Contract
```

#### Presentation Layer

Handles the application's UI and state management.

```text
Pages
  ↓
BLoC
  ↓
Widgets
```

This structure allows changes to the UI, data sources, or business logic to be made in a more isolated and maintainable manner.

---

## 🛠️ Tech Stack

| Technology                 | Usage                                   |
| -------------------------- | --------------------------------------- |
| **Flutter**                | Mobile application framework            |
| **Dart**                   | Programming language                    |
| **BLoC**                   | State management                        |
| **Flutter BLoC**           | BLoC integration with Flutter           |
| **GetIt**                  | Dependency injection                    |
| **Dio**                    | API communication                       |
| **Dartz**                  | Functional programming & error handling |
| **Equatable**              | Value equality                          |
| **JSON Annotation**        | JSON serialization annotations          |
| **JSON Serializable**      | JSON code generation                    |
| **Flutter Secure Storage** | Secure local storage                    |
| **Google Fonts**           | Typography                              |
| **Flutter Rating Bar**     | Rating component                        |
| **FL Chart**               | Data visualization                      |

These main dependencies are listed in the project's `pubspec.yaml`.

---

## 🔄 Application Flow

In general, the application follows this flow:

```text
User
 │
 ▼
Presentation Layer
 │
 │  User Interaction
 ▼
BLoC / State Management
 │
 ▼
Domain Layer
 │
 │  Use Case
 ▼
Repository
 │
 ▼
Data Layer
 │
 ├── Remote Data Source
 └── Local Data Source
 │
 ▼
API / Local Storage
```

The resulting data is then returned through the same layers until it is ultimately displayed in the UI.

---

## 📁 Project Structure

```text
lib/
│
├── core/
│   └── ...
│
├── features/
│   └── ...
│
├── injection.dart
└── main.dart
```

The actual repository structure separates `core` and `features`, with each feature containing `data`, `domain`, and `presentation` layers.

```text
features/
│
├── [feature]/
│   ├── data/
│   │   ├── datasources/
│   │   ├── models/
│   │   └── repositories/
│   │
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   │
│   └── presentation/
│       ├── pages/
│       ├── bloc/
│       └── widgets/
```

The actual repository structure separates `core` and `features`, following a feature-based architecture that includes `data`, `domain`, and `presentation` layers, along with dedicated folders for data sources, models, repositories, entities, use cases, pages, BLoC, and widgets.

---
