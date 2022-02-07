# circle_progress_bar

An animated progress bar with text inside and customizable style.

![screenshot to illustrate what can be build](https://user-images.githubusercontent.com/13302336/152804173-ac451d35-e5fb-419f-8497-f176bdfe4058.jpeg)

## Usage

### 1 - Depend on it

Add it to your package's pubspec.yaml file

```yml
dependencies:
  circle_progress_bar: ^0.1.0
```


### 2 - Install it

Install packages from the command line

```sh
flutter packages get
```

### 3 - Use it

```dart
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example app'),
        ),
        body: SizedBox(
          width: 100,
          child: CircleProgressBar(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.black12,
            value: 0.5,
            child: AnimatedCount(
              count: 0.5,
              unit: '%',
              duration: Duration(milliseconds: 500),
            ),
          ),
        )
      ),
    );
  }
}
```

## Apps using this plugin

| EHW+ | Your app? |
|---|---|
| ![EHW+](https://play-lh.googleusercontent.com/TDPCEwTmGEootK5VnPLu94AZ4Ks4-eTa_sg9IoLqWOk_aBr-OxjkfKe2s0OkvLgWKNc_=w220-rw)| ... |

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

