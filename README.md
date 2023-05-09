# Number Trivia

> This project aims to demonstrate the implementation of clean architecture principles and practices, with a focus on Test-Driven Development (TDD). It provides a simple application for retrieving interesting trivia about numbers.

## Table of Contents

- [Packages Used](#packages-used)
- [Clean Architecture](#clean-architecture)
- [Project Structure](#project-structure)
- [Testing](#testing)
- [Project Description](#project-description)
- [How to Run](#how-to-run)
- [Playstore](#playstore)

## Packages Used

The following packages are used in this project:

- [MobX] - State management library for Flutter applications.
- [Flutter Modular] - Library for implementing modular Flutter applications.
- [http] - Package for making HTTP requests in Dart.
- [Dartz] - Functional programming library for Dart.
- [Realm] - Database package for Flutter.



## Clean Architecture

The clean architecture methodology has been followed to ensure separation of concerns and maintainability. The codebase is organized into layers:

1. **Presentation Layer**: This layer contains the UI components and handles user interactions.
2. **Domain Layer**: The domain layer contains the business logic and entities of the application. It is independent of any specific framework or platform.
3. **Data Layer**: The data layer handles data retrieval and storage. It abstracts the sources of data (APIs, databases, etc.) and provides repositories and data sources.

By adhering to the clean architecture principles, I achieve code that is modular, testable, and highly maintainable.

## Project Structure

The project is organized into two main modules:

1. **number_trivia**: This module encapsulates the core business logic of the number trivia application. It contains classes and services responsible for fetching number trivia data and handling the application's state.
2. **configuration**: This module handles the configuration and setup of the project, such as dependency injection and routing.
## Testing

Unit tests are an integral part of this project, ensuring the correctness and stability of the codebase. The tests are implemented using the Dart **'test'** package and the **'mocktail'** library for mockt dependencies.

## Project Description

The Number Trivia project is a Flutter application that allows users to retrieve interesting trivia about numbers. Users can enter a specific number or choose to fetch a random trivia fact. The application makes use of an external API to fetch the trivia data.

This project serves as a practical demonstration of clean architecture principles, emphasizing the separation of concerns and the testability of the code. The combination of clean architecture and TDD practices leads to a robust and maintainable codebase.

Feel free to explore the code and provide any feedback or suggestions. Contributions are also welcome!

## How to Run
To run the Number Trivia application locally, follow these steps:

1. Clone the repository:
``` 
git clone https://github.com/tiagocasa/number_trivia.git
```
2. Navigate to the project directory:
``` 
cd number_trivia
```
3. Install the dependencies:
``` 
flutter pub get
```
4. Run the application:
``` 
flutter run
```
Make sure you have a Flutter development environment set up and an emulator or a connected device to run the application on.

## Playstore
You can download the app from the Google Play Store [here]

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [MobX]: <https://pub.dev/packages/mobxr>
   [Flutter Modular]: <https://pub.dev/packages/flutter_modular>
   [http]: <https://pub.dev/packages/http>
   [Dartz]: <https://pub.dev/packages/dartz>
   [Realm]: <https://github.com/markdown-it/markdown-it>
   [here]: <https://play.google.com/store/apps/details?id=com.BigHouseStudio.NumberTrivia>

