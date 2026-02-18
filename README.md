# CineTrack

A comprehensive Flutter-based movie tracking and discovery application with authentication, social features, and advanced analytics.

---

## Project Overview

CineTrack is a feature-rich mobile application designed to help movie enthusiasts discover, track, and manage their movie-watching experience. Built with Flutter and following clean architecture principles, the application provides seamless cross-platform support for iOS and Android devices.

The application addresses the need for a centralized platform where users can:
- **Discover** new movies and explore film catalogs
- **Track** watched movies and maintain personal watchlists
- **Analyze** their movie-watching statistics and preferences
- **Connect** through authenticated user profiles
- **Rate & Review** movies with a comprehensive rating system

**Target Users:**
- Movie enthusiasts and cinephiles
- Casual viewers seeking movie recommendations
- Users who want to track their movie-watching history
- Social media-focused individuals interested in sharing film reviews

---

## Features

### Implemented Features

- **User Authentication**
  - User registration with email verification
  - Secure login with encrypted credential storage
  - Password reset functionality with verification
  - Session management and secure token handling

- **Movie Discovery**
  - Browse comprehensive movie catalog
  - Advanced search functionality with filters
  - Detailed movie information (title, synopsis, cast, ratings)
  - Movie rating system with visual indicators

- **Movie Management**
  - Add movies to personal watchlist
  - Mark movies as watched with tracking
  - Movie detail pages with comprehensive information
  - Rating and review capabilities

- **User Profile**
  - Personalized user profiles
  - Profile management and settings
  - User preference configuration

- **Statistics & Analytics**
  - Movie-watching statistics dashboard
  - Visualization of viewing patterns using charts
  - Watch history analytics
  - Personal movie statistics aggregation

- **User Interface**
  - Material Design 3 implementation
  - Edge-to-edge responsive layouts
  - Smooth custom animations
  - Optimized for both mobile platforms

### Planned Features

- Social features (user following, movie recommendations)
- Advanced filtering and sorting options
- Integration with external movie databases
- Offline mode for saved data
- Multi-language support
- Dark mode implementation refinements

---

## Tech Stack

### Core Technologies

- **Language:** Dart 3.10.4+
- **Framework:** Flutter
- **Platform Support:** iOS, Android

### Architecture & Design Patterns

- **Architecture Pattern:** Clean Architecture with Feature-based modular structure
- **State Management:** BLoC (Business Logic Component) with Flutter BLoC
- **Dependency Injection:** GetIt service locator
- **Functional Programming:** Dartz (Either/Result pattern) for error handling

### Key Libraries & Dependencies

| Category | Library | Purpose |
|----------|---------|---------|
| **HTTP & Networking** | dio ^5.9.0 | RESTful API client with interceptors |
| | http_parser ^4.1.2 | HTTP protocol handling |
| **State Management** | bloc ^9.2.0 | Business logic separation |
| | flutter_bloc ^9.1.1 | Flutter BLoC integration |
| | get_it ^9.2.0 | Service locator and dependency injection |
| **Data Serialization** | json_annotation ^4.9.0 | JSON serialization annotations |
| | json_serializable ^6.11.4 | Code generation for JSON serialization |
| **Functional Programming** | dartz ^0.10.1 | Functional programming utilities (Either) |
| | equatable ^2.0.8 | Equality comparison utilities |
| **Security** | flutter_secure_storage ^10.0.0 | Secure credential storage |
| **UI Components** | cupertino_icons ^1.0.8 | iOS-style icons |
| | google_fonts ^7.1.0 | Google Fonts integration |
| | flutter_rating_bar ^4.0.1 | Rating widget component |
| | fl_chart ^1.1.1 | Chart visualization library |
| **Code Quality** | flutter_lints ^6.0.0 | Flutter lint rules |
| | build_runner ^2.10.5 | Code generation runner |

---
