# Number Trivia

> This project aims to demonstrate the implementation of clean architecture principles and practices, with a focus on Test-Driven Development (TDD). It provides a simple application for retrieving interesting trivia about numbers.

## Table of Contents

- Packages Used
- Project Structure
- Clean Architecture
- Testing
- Project Description

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



[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [MobX]: <https://pub.dev/packages/mobxr>
   [Flutter Modular]: <https://pub.dev/packages/flutter_modular>
   [http]: <https://pub.dev/packages/http>
   [Dartz]: <https://pub.dev/packages/dartz>
   [Realm]: <https://github.com/markdown-it/markdown-it>

