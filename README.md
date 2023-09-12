<p align="center">
  <a href="https://linkedin.com/in/sohrabonline">
    <img src="https://raw.githubusercontent.com/sohrabonline/connected/master/assets/logo.png" height="300">
  </a>
  <h1 align="center">CONNECTED</h1>
  <pre style="text-align: start;color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif;">Are you sure you are</span><span style="font-family: Verdana, Geneva, sans-serif;"> <strong><span style="color: rgb(44, 130, 201);">connected</span></strong>?</span></pre>
<div id="gtx-trans" style="position: absolute; left: 211px; top: -5px;">
    <div class="gtx-trans-icon"></div>
</div>
</p>

A Flutter package to check your internet connection and show result as widget on your screen!


This library provides functionality to monitor and verify internet connectivity
by checking reachability to various `Uri`s. It relies on the 'internet_connection_checker_plus' => `connectivity_plus`
package for listening to connectivity changes and the `http` package for making
network requests.

## Features
- Check internet connectivity status
- Listen for internet connectivity changes and show it on your screen as widget
- You can customize connected and disconnected widget

## Supported Platforms

| Platform | Check Connectivity | Listen for Changes |
| :------: | :----------------: | :----------------: |
| Android  |         ✅         |         ✅         |
|   iOS    |         ✅         |         ✅         |
|  macOS   |         ✅         |         ✅         |
|  Linux   |         ✅         |         ✅         |
| Windows  |         ✅         |         ✅         |
|   Web    |         ✅         |         ✅         |


## Getting started

### Android

Add the following permissions to your `AndroidManifest.xml` file:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

### macOS

Add the following permissions to your macOS `.entitlements` files:

```entitlements
<key>com.apple.security.network.client</key>
<true/>
```

For more information, see the [Flutter Networking Documentation].

## Usage

### 1. Add dependency

Add the `internet_connection_checker_plus` package to your `pubspec.yaml` file:

```yaml
dependencies:
  connected: [latest version]
```

### 2. Import the package

Import the `connected` package into your Dart file:

```dart
import 'package:connected/connected.dart';
```

### 3. Checking for internet connectivity

The simplest way to check for internet connectivity is to use the
`NetworkService()` class:

```dart
Future<bool> get hasConnection async => await NetworkService().isConnected;

## Additional information

### 4. Listening for internet connectivity changes

Wrap "widget" in builder of MaterialApp with Connected()

```dart
      ...child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return Connected(widget: widget ?? MySizedBox.h0);
        },
        home: App(),
      )...
```


