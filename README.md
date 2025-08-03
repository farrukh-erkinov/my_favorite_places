# Surf Places

Проект для поиска и сохранения интересных мест.

## API
Swagger с описание api доступен по ссылке http://109.73.206.134:8888/docs/student/

## Архитектура

Проект построен на основе принципов **Clean Architecture** и использует подход **Feature-First**. Основная цель такой архитектуры — разделение ответственностей, тестируемость и простота поддержки.

### Структура проекта

Код приложения находится в директории `lib` и организован следующим образом:

- **lib/**
  - `api/`: Код для взаимодействия с API (модели DTO, клиенты Retrofit).
  - `assets/`: Строковые константы и пути к ассетам.
  - `core/`: Ядро приложения. Содержит базовые классы, утилиты и абстракции, не зависящие от бизнес-логики (например, базовый репозиторий, обработка ошибок).
  - `features/`: Основная директория с фичами приложения.
    - `app/`: Корневой виджет приложения и настройка DI.
    - `common/`: Общие для нескольких фич виджеты, сущности, репозитории и т.д.
    - `имя_фичи/`: Изолированный модуль с конкретной функциональностью.
      - `data/`: Слой данных (реализации репозиториев, работа с API и БД).
      - `domain/`: Слой доменной логики (сущности, интерфейсы репозиториев, интеракторы).
      - `ui/`: Слой представления (экраны, виджеты, WidgetModels).
  - `uikit/`: Набор переиспользуемых UI-компонентов (кнопки, кастомные виджеты, темы).
  - `main.dart`: Точка входа в приложение для `prod` окружения.
  - `runner.dart`: Инициализация и запуск приложения.

### Схема слоев

Каждая фича разделена на три слоя: `UI`, `Domain`, `Data`.

- **Data Layer**: Отвечает за получение данных из внешних источников (сеть, база данных). Содержит реализации репозиториев, DTO (Data Transfer Objects) и мапперы для преобразования DTO в доменные сущности. **Важно**: все репозитории должны наследоваться от `BaseRepository` из `lib/core/data/repositories/base_repository.dart` для унификации обработки запросов и ошибок.
- **Domain Layer**: Содержит бизнес-логику приложения. Не зависит от других слоев. Включает в себя доменные модели (Entities) и интерфейсы (контракты) репозиториев.
- **UI Layer**: Отвечает за отображение данных. Использует связку **Screen-WM-Model**.
  - **Screen (Widget)**: Декларативное описание интерфейса. Не содержит логики, кроме как передачи пользовательских событий в `WidgetModel`.
  - **WidgetModel (WM)**: Посредник между `Screen` и `Model`. Обрабатывает пользовательские действия, управляет навигацией и передает данные для отображения в `Screen`.
  - **Model**: Содержит логику управления состоянием экрана. Взаимодействует с `Domain Layer` (через репозитории), выполняет бизнес-логику, обрабатывает данные и предоставляет их `WM` через `ValueListenable`.

### Управление зависимостями (DI)

В проекте используется `provider` для внедрения зависимостей. Зависимости делятся на два уровня:

- **Глобальные (`AppDependencies`)**: Зависимости, которые используются в нескольких фичах или во всем приложении (например, `ApiClient`, `IFavoritesRepository`). Они объявляются в `lib/features/app/di/app_dependencies.dart`.
- **Локальные (`FeatureDependencies`)**: Зависимости, необходимые только для одной конкретной фичи. Они объявляются в файле `dependencies.dart` внутри директории фичи (например, `lib/features/places/ui/places_dependencies.dart`). Это позволяет сохранять модульность и не загрязнять глобальное пространство имен.

## Создание новой фичи

Чтобы добавить новую фичу (например, `UserProfile`), следуйте шагам:

1.  **Создайте структуру директорий**:

    ```
    lib/features/user_profile/
    ├── data/
    │   ├── repositories/
    │   │   └── user_profile_repository.dart
    │   └── ...
    ├── domain/
    │   ├── enitites/
    │   │   └── user_profile_entity.dart
    │   └── reposiotries/
    │       └── i_user_profile_repository.dart
    └── ui/
        ├── screens/
        │   ├── user_profile_model.dart
        │   ├── user_profile_screen_builder.dart
        │   ├── user_profile_screen.dart
        │   └── user_profile_wm.dart
        └── widgets/
    ```

2.  **Domain Layer**:
    - Создайте сущность `UserProfileEntity`.
    - Определите контракт в `i_user_profile_repository.dart`.

    ```dart
    // lib/features/user_profile/domain/reposiotries/i_user_profile_repository.dart
    abstract interface class IUserProfileRepository {
      Future<UserProfileEntity> getUserProfile();
    }
    ```

3.  **Data Layer**:
    - Создайте DTO (если нужно) и маппер.
    - Реализуйте `IUserProfileRepository` в `user_profile_repository.dart`, унаследовав его от `BaseRepository`.

    ```dart
    // lib/features/user_profile/data/repositories/user_profile_repository.dart
    class UserProfileRepository extends BaseRepository implements IUserProfileRepository {
      // ...
    }
    ```

4.  **UI Layer**:
    - Создайте `UserProfileModel`, который будет реализовывать логику состояния.
    - Создайте `UserProfileWM`, который будет использовать `UserProfileModel` и `IUserProfileRepository`.
    - Создайте `UserProfileScreen`, который будет отображать данные из `UserProfileWM`.
    - Свяжите все в `user_profile_screen_builder.dart`, который создаст WM и передаст его в экран.

5.  **Добавьте зависимости**:
    - **Глобальные зависимости**: Если репозиторий или сервис будет использоваться в нескольких фичах, добавьте его провайдер в `lib/features/app/di/app_dependencies.dart`.
    - **Локальные зависимости**: Для зависимостей, специфичных для `UserProfile`, создайте файл `lib/features/user_profile/ui/user_profile_dependencies.dart`.

    ```dart
    // lib/features/user_profile/ui/user_profile_dependencies.dart
    abstract class UserProfileDependencies {
      static List<SingleChildWidget> providers() {
        return [
          Provider<IUserProfileRepository>(
            create: (context) => UserProfileRepository(
              apiClient: context.read<ApiClient>(),
            ),
          ),
          Provider<IUserProfileModel>(
            create: (context) => UserProfileModel(
              userProfileRepository: context.read<IUserProfileRepository>(),
            ),
          ),
        ];
      }
    }
    ```

    Затем эти зависимости нужно будет предоставить в `UserProfileScreenBuilder`.

Следуя этому руководству, вы сможете создавать новые фичи, которые будут соответствовать общей архитектуре проекта.
