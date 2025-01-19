# Quiz App

A Flutter-based quiz application with gamification features. This app fetches quiz data from an API, presents interactive questions, and provides a reward and level system based on the user's performance.

## Features

- **Quiz Functionality**:
  - Multiple-choice questions.
  - Score calculation and dynamic feedback.
  - Rewards (Gold, Silver, Bronze medals) based on total points.
  - User levels (Expert, Intermediate, Beginner) based on performance.

- **UI/UX**:
  - Responsive and intuitive interface.
  - Animations for better engagement.

- **Backend Integration**:
  - Fetches quiz data from the API endpoint: [Quiz API](https://api.jsonserve.com/Uw5CrX).
  - Processes and validates answers dynamically.

## Project Setup

1. **Prerequisites**:
   - Ensure you have Flutter installed. Follow the [Flutter Installation Guide](https://docs.flutter.dev/get-started/install) for your operating system.
   - Dart version: Ensure the Dart SDK is compatible with Flutter.

2. **Clone the Repository**:
   ```bash
   git clone <your-repository-link>
   cd <your-repository-folder>
   ```

3. **Install Dependencies**:
   Run the following command to fetch the necessary dependencies:
   ```bash
   flutter pub get
   ```

4. **Run the App**:
   - Use an emulator or connect a physical device.
   - Run the app using:
     ```bash
     flutter run
     ```
 
## API Usage

The app fetches quiz data from the API endpoint:
```
https://api.jsonserve.com/Uw5CrX
```
- The data includes questions, options, and correctness flags.
- The app processes this data to generate the quiz dynamically.

## Screenshots and Videos

### Screenshots

#### Home Screen
![Home Screen](https://drive.google.com/file/d/12BouDICw9K2B9CXInvvsMo7AnujDsf4r/view?pli=1)

#### Splash Screen
![Splash Screen](https://drive.google.com/file/d/126i5vSFOd8GII4RcHN1KExAULfBa5-Hw/view?usp=drivesdk)

#### Summary Screen
![Summary Screen](https://drive.google.com/file/d/12KeA25W_zUm8jN6adPNkUyqC5KDh6CuE/view)

### Video Walkthrough
[![Video Walkthrough](https://drive.google.com/file/d/11tmTek-ztVidtwrRCpCk_VXj2duGhEct/view?usp=drivesdk)]

## Folder Structure

```
lib/
├── model/
│   └── quiz_model.dart
├── view/
│   ├── home_screen.dart
│   ├── splash_screen.dart
│   └── summary_screen.dart
└── main.dart
```

## Credits

- **API Source**: [JsonServe](https://www.jsonserve.com/)
- **Framework**: [Flutter](https://flutter.dev/)

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

Submit your feedback or queries by creating an issue in this repository or emailing us at [prashantg1216@gmail.com].

