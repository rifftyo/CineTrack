# CineTrack 🎬

<p align="center">
  <img
    src="https://github.com/user-attachments/assets/431a65cc-6166-42c8-b3a2-5eb9b9fc0db6"
    alt="CineTrack - Mobile Movie Tracking Application"
    width="900"
  />
</p>

**CineTrack** adalah aplikasi mobile untuk membantu pengguna menemukan film, mengelola daftar tontonan, mencatat film yang telah ditonton, memberikan rating dan review, serta melihat statistik aktivitas menonton dalam satu aplikasi.

Aplikasi ini dibangun menggunakan **Flutter** dengan pendekatan **Clean Architecture** untuk menghasilkan struktur kode yang modular, mudah dikembangkan, dan mudah dipelihara.

> 🎯 **Project Type:** Mobile Application
> 📱 **Platform:** Android & iOS
> 🛠️ **Framework:** Flutter
> 💻 **Language:** Dart
> 🏗️ **Architecture:** Clean Architecture

---

## ✨ Features

### 🔍 Movie Discovery

* Menjelajahi katalog film.
* Mencari film berdasarkan kebutuhan pengguna.
* Menampilkan informasi film secara detail.
* Menampilkan informasi seperti judul, sinopsis, pemeran, dan rating.

### 📄 Movie Details

Pengguna dapat melihat informasi lengkap dari sebuah film, seperti:

* Judul film
* Sinopsis
* Pemeran
* Rating
* Informasi terkait film lainnya

### 👤 Profile

Pengguna dapat mengelola informasi profil serta preferensi mereka sebagai bagian dari pengalaman menggunakan aplikasi.

### 📎 Watchlist

Aplikasi menyediakan kemampuan untuk menambahkan film ke dalam daftar tontonan pribadi sehingga pengguna dapat mengelola film yang ingin ditonton.

### ⭐ Rating & Review

Pengguna dapat memberikan rating dan review terhadap film yang telah ditonton untuk membantu mencatat pengalaman menonton.

### 🔐 Secure Storage

Informasi tertentu yang membutuhkan penyimpanan aman menggunakan secure storage untuk membantu menjaga keamanan data pengguna.

### 🎨 Modern UI

Menggunakan komponen UI modern dengan dukungan:

* Material Design 3
* Responsive layouts
* Custom animations
* Google Fonts
* Rating components
* Data visualization

---

## 🏗️ Architecture

CineTrack menggunakan pendekatan **Clean Architecture** dengan struktur berbasis feature yang memisahkan aplikasi menjadi beberapa layer.

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

Bertanggung jawab terhadap pengambilan dan pengelolaan data.

```text
Data Sources
     ↓
Models
     ↓
Repository Implementation
```

#### Domain Layer

Berisi business logic aplikasi dan tidak bergantung pada framework atau implementasi data tertentu.

```text
Entities / Business Rules
          ↓
      Use Cases
          ↓
    Repository Contract
```

#### Presentation Layer

Menangani UI dan state management aplikasi.

```text
Pages
  ↓
BLoC
  ↓
Widgets
```

Struktur ini membuat perubahan pada UI, sumber data, maupun business logic dapat dilakukan secara lebih terisolasi.

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

Dependency utama tersebut tercantum pada `pubspec.yaml` project.

---

## 🔄 Application Flow

Secara umum, alur aplikasi mengikuti pola:

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

Hasil data kemudian dikembalikan melalui layer yang sama hingga akhirnya ditampilkan kembali pada UI.

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

Struktur aktual repository memisahkan `core` dan `features`, dengan masing-masing feature memiliki layer `data`, `domain`, dan `presentation`.

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


Struktur aktual repository memisahkan `core` dan `features`, dengan arsitektur berbasis feature yang mencakup `data`, `domain`, dan `presentation`, serta subfolder khusus untuk datasource, models, repositories, entities, use cases, pages, BLoC, dan widgets.

---

[CineTrack GitHub Repository](https://github.com/rifftyo/CineTrack?utm_source=chatgpt.com)
