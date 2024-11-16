# Currency Conversion App

## Table of Contents

- [Currency Conversion App](#currency-conversion-app)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Setup Instructions](#setup-instructions)
  - [Project Architecture](#project-architecture)
    - [Domain-Driven Design (DDD) and Clean Architecture](#domain-driven-design-ddd-and-clean-architecture)
    - [Architectural Layers](#architectural-layers)
      - [1. Domain Layer](#1-domain-layer)
      - [2. Application Layer](#2-application-layer)
      - [3. Presentation Layer](#3-presentation-layer)
      - [4. Infrastructure Layer](#4-infrastructure-layer)
    - [Benefits of Our Architecture](#benefits-of-our-architecture)
  - [Documentation](#documentation)

## Prerequisites

- Flutter SDK installed on your system

## Setup Instructions

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Generate necessary code files:
   ```bash
   dart pub run build_runner watch --delete-conflicting-outputs
   ```
   This command will watch for changes and automatically regenerate code files.

## Project Architecture

### Domain-Driven Design (DDD) and Clean Architecture

The Currency Conversion App implements Domain-Driven Design principles and Clean Architecture to create a robust, maintainable, and scalable application.

### Architectural Layers

#### 1. Domain Layer

- Contains core business logic and domain models
- Isolated from external dependencies
- Defines application rules and policies

#### 2. Application Layer

- Manages application state
- Implements use cases
- Provides service orchestration
- Utilizes domain layer entities and value objects

#### 3. Presentation Layer

- Houses UI components and widgets
- Handles user interactions
- Implements state management using providers
- Displays data to users

#### 4. Infrastructure Layer

- Manages external services and APIs
- Handles data persistence
- Implements local storage solutions
- Provides data source implementations

### Benefits of Our Architecture

- **Separation of Concerns**: Each layer maintains distinct responsibilities
- **Enhanced Testability**: Clear boundaries enable comprehensive testing
- **Improved Scalability**: Facilitates easy addition of new features
- **Maintainable Codebase**: Organized structure reduces technical debt

## Documentation

For detailed documentation and architectural insights, visit my notion https://nosy-baritone-293.notion.site/Currency-Convertion-App-c5e6d3e949844ca3a803a11252ac6a37?pvs=74
