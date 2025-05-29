# 🎵 MusicApp

This project demonstrates a professional approach to mobile app development with modularity, testability, and maintainability in mind.
It features a clean, layered architecture following **Clean Architecture principles**, **MobX** for state management, and **just_audio** for smooth audio playback.

---

## ✨ Features

- 🎧 Play audio files stored in assets
- ⏯️ Play / Pause controls
- 📦 Structured using Clean Architecture
- 🧠 MobX for reactive state management
- 💉 Dependency Injection with Injectable and GetIt
- 💽 Audio playback with just_audio
- 🌈 Neumorphic UI design
- 📱 Adaptive UI using ScreenUtil

---
## 🧰 Tech Stack

| Category                 | Tools / Packages                           |
|--------------------------|--------------------------------------------|
| Framework                | [Flutter](https://flutter.dev/)            |
| Architecture             | Clean Architecture                         |
| State Management         | [`mobx`](https://pub.dev/packages/mobx), [`flutter_mobx`](https://pub.dev/packages/flutter_mobx) |
| Audio Playback           | [`just_audio`](https://pub.dev/packages/just_audio) |
| Dependency Injection     | [`injectable`](https://pub.dev/packages/injectable), [`get_it`](https://pub.dev/packages/get_it) |
| Responsive Design        | [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil) |
| UI Style                 | [`flutter_neumorphic_plus`](https://pub.dev/packages/flutter_neumorphic_plus) |
| Code Generation          | [`build_runner`](https://pub.dev/packages/build_runner), [`injectable_generator`](https://pub.dev/packages/injectable_generator), [`mobx_codegen`](https://pub.dev/packages/mobx_codegen) |

---

## 📁 Project Structure

```text
lib/
├── core/               # Shared utilities, themes, and constants
├── features/
│   └── music_player/
│       ├── domain/         # Entities and use cases
│       ├── data/           # Repositories and data sources
│       └── presentation/   # UI and MobX stores
├── gen/                # Generated assets and files
└── main.dart           # Entry point of the app
```
---
## 🚀 Getting Started

### Prerequisites

- Flutter SDK >=3.7.2
- Dart SDK

### Installation

1. **Clone the repo:**
   ```bash
   git clone https://github.com/RohanBudhathoki/musicapp.git
   cd musicapp
2. **Install dependencies:**
   ```bash
   flutter pub get
3. **Generate code:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
4. **Run the app:**
   ```bash
   flutter run
---
## 📦 Assets Used

- 🎵 `assets/audios/` – Local audio files bundled with the app  
- 🖼️ `assets/png/` – App graphics, icons, and UI elements

---
##📸 Screenshots


<p align="center">
  <img src="https://github.com/user-attachments/assets/19814c67-3562-41be-a573-c1830b08efb0" width="250">
</p>

> 🎥 Simulator screen recording on iPhone 16 Pro Max showcasing the music playback UI.


---
##📄 License
  - 🔒 This project was developed exclusively for evaluation purposes.

  




