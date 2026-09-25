<div align="center">

# 📚 Zedny (زدني)

*A lightweight learning platform connecting a teacher with their students*

![Java](https://img.shields.io/badge/Java-Spring%20Boot-6DB33F?style=flat&logo=springboot&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-Frontend-02569B?style=flat&logo=flutter&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=flat&logo=mysql&logoColor=white)
![FCM](https://img.shields.io/badge/Firebase-Cloud%20Messaging-FFCA28?style=flat&logo=firebase&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-lightgrey?style=flat)

</div>

---

## 📖 Table of Contents

- [About](#-about)
- [Documentation](#-documentation)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Data Models](#-data-models)
- [API Reference](#-api-reference)
- [Getting Started](#-getting-started)
- [Flutter Project Structure](#-flutter-project-structure)
- [Screenshots](#-screenshots)
- [License](#-license)

---

## 📌 About

**Zedny (زدني)** is a mobile learning app that gives a teacher a simple way to organize their course content into chapters and lectures, and gives students an easy way to browse that content and stay up to date through notifications.

The app is built with a **Flutter** mobile client and a **Spring Boot** REST API backend, backed by **MySQL**.

---

## 📑 Documentation

| Document | Link |
|----------|------|
| Business Requirements Document (BRD) | [Open in Google Docs](https://docs.google.com/document/d/1C-42eFQp7yAwUJKRRjOH2l--jvOluNNd/edit?usp=sharing&ouid=116229143266236096054&rtpof=true&sd=true) |
| Product Requirements Document (PRD) | [Open in Google Docs](https://docs.google.com/document/d/1uT25OHnkz8bwV_z6vsMOzr2Im8R5vnVU/edit?usp=sharing&ouid=116229143266236096054&rtpof=true&sd=true) |

---

## ✨ Features

### 🔐 Authentication

- **Student registration** — a student signs up with their name, phone number, parent's phone number, and grade
- **Student login** — phone number + OTP verification (no password)
- **Teacher login** — phone number + OTP verification (no password)

### 👨‍🏫 Teacher

- ➕ Create chapters
- 🎥 Add lectures to a chapter
- 👥 View the full list of registered students
- 🔍 Search students by **name**, **phone number**, or **parent's phone number**
- 📢 Send a push notification to all students at once

### 🎓 Student

- 📝 Register and log in via phone + OTP
- 📂 Browse chapters, with all lectures neatly sectioned under each one
- 🔔 Receive and view notifications sent by the teacher

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|------------|
| Mobile App | Flutter (Dart) |
| Backend API | Java · Spring Boot · Spring Data JPA |
| Database | MySQL |
| Push Notifications | Firebase Cloud Messaging (FCM) |

---

## 🗂 Data Models

### Teacher
| Field | Type | Description |
|-------|------|--------------|
| `id` | Long | Primary key |
| `phone` | String | Used for OTP login |

### Student
| Field | Type | Description |
|-------|------|--------------|
| `id` | Long | Primary key |
| `name` | String | Full name |
| `grade` | String | School grade |
| `phone` | String | Student's phone number, used for OTP login |
| `parentPhone` | String | Parent's phone number |
| `fcmToken` | String | Device token used to deliver push notifications |

### Chapter
| Field | Type | Description |
|-------|------|--------------|
| `id` | Long | Primary key |
| `name` | String | Chapter title |
| `order` * | int | Display order among chapters |
| `description` | String | Short description of the chapter |
| `grade` | String | Target school grade (e.g. `"1st Secondary"`) |
| `lectures` | List\<Lecture\> | One-to-many — the lectures inside this chapter |

### Lecture
| Field | Type | Description |
|-------|------|--------------|
| `id` | Long | Primary key |
| `chapter` | Chapter | Many-to-one — the chapter this lecture belongs to |
| `name` | String | Lecture title |
| `description` | String | Short description |
| `video` | String | Video URL/source |
| `thumbnail` | String | Thumbnail image URL |
| `order` * | int | Display order within the chapter |
| `createdAt` | LocalDateTime | Auto-set on creation |
| `updatedAt` | LocalDateTime | Auto-updated on edit |

### Notification
| Field | Type | Description |
|-------|------|--------------|
| `id` | Long | Primary key |
| `title` | String | Notification title |
| `body` | String | Notification content |
| `createdAt` | LocalDateTime | Sent timestamp |

> Notifications are broadcast to **all students** — there is no per-student targeting or read/unread tracking in the current version.

> \* `order` is a reserved keyword in SQL. Map it to a different column name (e.g. `chapter_order`, `lecture_order`) when defining the JPA entity to avoid query errors.

**Relationships:** `Chapter (1) ──< (many) Lecture` · `Student` and `Notification` are standalone entities with no direct relation to Chapter/Lecture in the current scope.

---

## 🔌 API Reference

| Method | Endpoint | Description |
|--------|----------|--------------|
| `POST` | `/students/register` | Register a new student (name, phone, parent phone, grade) |
| `POST` | `/auth/otp/request` | Request an OTP for a given phone number (student or teacher) |
| `POST` | `/auth/otp/verify` | Verify the OTP and log in (student or teacher) |
| `POST` | `/chapters` | Create a new chapter |
| `GET` | `/chapters` | List all chapters, each with its lectures |
| `POST` | `/chapters/{chapterId}/lectures` | Add a lecture to a chapter |
| `GET` | `/students` | List all students |
| `GET` | `/students/search?query=` | Search students by name, phone, or parent phone |
| `POST` | `/notifications` | Teacher broadcasts a notification to all students |
| `GET` | `/students/me/notifications` | Student views their notifications |

---

## 🚀 Getting Started

### Prerequisites
- JDK 17+
- Maven
- MySQL 8+
- Flutter SDK
- A Firebase project (for FCM push notifications)

### Backend Setup
```bash
git clone <your-repo-url>
cd backend
# configure your DB credentials in src/main/resources/application.properties
mvn spring-boot:run
```

### Frontend Setup
```bash
cd mobile
flutter pub get
flutter run
```

---

## 📁 Flutter Project Structure

```
lib/
 ├── data/
 │    ├── repo/            # Repository implementations
 │    ├── models/          # Data models (DTOs)
 │    └── enums/           # Shared enums
 │
 ├── service/
 │    ├── service/                # Abstract service contracts
 │    └── service_implementation/ # Concrete service implementations (API calls)
 │
 └── presentation/
      ├── view/             # Screens
      ├── widget/           # Reusable widgets
      └── cubit/            # State management (Cubit)
```

---

## 🖼 Screenshots

| Login | Student Home | Chapter View | Notifications |
|:-----:|:------------:|:------------:|:-------------:|
|  _ _  |     _ _      |     _ _      |      _ _      |
