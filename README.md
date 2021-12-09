# CAT APP

A simple cat Application

## Getting Started

Download and Install [flutter](https://docs.flutter.dev/get-started/install) 


## 1. How to Run

With no setup the app will run in a Chrome Browser.

```sh
$ flutter run
```


## 2. How to Use

Launch application from your preferred platform. And cat Image will be displayed 

| iOS | Web |
| --- | --- |
|  ![Apple](/assets/ios.gif)| ![Web](/assets/web.gif) |

## 3. How it works

The application uses BLoC to handle state management and app lifecycle. 



Project structure:
```
<Project Dir>
  lib 
  │
  │  # Entrypoint for Application
  │  main.dart
  │
  └─ api
  │
  │  # Cat Service connected to https://cataas.com/#/
  │  cat_service.dart
  └─ bloc
  │
  │  # Flutter State Management
  │  random_cat_bloc.dart
  │  random_cat_event.dart
  │  random_cat_state.dart
  └─ model
  │
  │  # Cat model 
  │  cat.dart
  └─ screens
  │
  │  # Home Scren
  └──home.dart

  test
  │
  └─ widget_test.dart

  web
  │
  │ # Web Supporting Files
  └─ ...

# Flutter Spec
pubspec.yaml
```


