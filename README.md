# TaskFlow — Task Manager App

**TaskFlow** is a modern, clean, and lightweight task management mobile application built with **Flutter**. It helps you organize daily tasks, track progress, schedule due dates and times, and manage tasks by priority and category.

---

## ✨ Features

- **Home Dashboard (`HomeScreen`)**
  - Personalized greeting and daily streak counter badge
  - Gradient **Daily Progress Card** with completion percentage & progress bar
  - **Task Summary Cards** (*All Tasks*, *Pending*, *Completed*)
  - Quick view of **Today's Tasks**
- **My Tasks (`TaskScreen`)**
  - Search bar with automatic keyboard dismissal on outside tap
  - Horizontal category filter chips (*All*, *Todays*, *Upcoming*, *Complete*)
  - Interactive **Task Cards** with completion checkbox, one-line description, color-coded priority badge (*High*, *Medium*, *Low*), and action menu icon
- **Add Task (`AddTaskScreen`)**
  - Task title & multiline description inputs
  - Interactive **Due Date** (`showDatePicker`) and **Due Time** (`showTimePicker`) pickers
  - Custom animated **Priority Level Selector** (*Low*, *Medium*, *High*)
  - Custom **Category Selector** (*Work*, *Personal*, *Study*, *Health*)
- **Calendar View (`CalenderScreen`)**
  - Interactive monthly calendar powered by `table_calendar`
  - Quick *"Today"* jump button and daily task list view
- **Custom Notched Bottom Navigation (`BottomNavigationBarWidget`)**
  - Center-docked Floating Action Button (`+`) with `CircularNotchedRectangle`
  - Dynamic `CustomAppBar` title per screen and back-navigation tab history (`PopScope`)

---

## 📁 Project Structure

```text
lib/
├── main.dart
├── data/
│   └── dummy_task.dart          # Sample task list data
├── model/
│   └── task_model.dart          # Task data model
├── theme/
│   └── app_colors.dart          # App color palette
├── Screens/
│   ├── home_screen.dart         # Home dashboard screen
│   ├── task_Screen.dart         # All tasks & search/filter screen
│   ├── add_task_Screen.dart     # Create new task screen
│   ├── calender_Screen.dart     # Calendar schedule screen
│   └── profile_screen.dart      # User profile screen
└── widgets/
    ├── bottom_navigation_bar.dart
    ├── custom_app_bar.dart
    ├── progress_card.dart
    ├── section_header.dart
    ├── task_card.dart
    └── task_summary_card.dart
```

---

## 🛠️ Tech Stack & Packages

- **Framework:** [Flutter](https://flutter.dev/) (Dart `^3.12.2`)
- **Typography:** [`google_fonts`](https://pub.dev/packages/google_fonts) (`Inter`)
- **Icons:** [`font_awesome_flutter`](https://pub.dev/packages/font_awesome_flutter) & Material Icons
- **Calendar & Formatting:** [`table_calendar`](https://pub.dev/packages/table_calendar), [`intl`](https://pub.dev/packages/intl)

---

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/CodeWith-Basit/taskflow-task-manager.git
   cd taskflow-task-manager
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```
