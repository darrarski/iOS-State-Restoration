# iOS State Restoration

![Swift v5.0](https://img.shields.io/badge/swift-v5.0-orange.svg)

**iOS app state restoration demo**

Example project that shows how to implement state restoration in iOS app that **does not** use storyboards.


## Setup

Requirements:

- [Xcode](https://developer.apple.com/xcode/) 10.2.1
- [SwiftLint](https://github.com/realm/SwiftLint)

## Description

### How to:

1. Open `StateRestoration.xcodeproj`.
2. Build and run `StateRestorationApp` scheme in iOS simulator.
3. Play with the app a bit, change stepper value, push new view controllers etc.
4. Kick the app to background (press <kbd>⇧</kbd> + <kbd>⌘</kbd> + <kbd>H</kbd>) to save current state.
5. Stop running the app in Xcode.
6. Start the app again (from Xcode or directly in simulator).
7. Previous state should be restored.

### The "state" of demo app is:

- Selected tab
- Navigation controllers stack
- View controllers titles
- Stepper values

### Hints:

- `UITabBarController` and `UINavigationController` manages state restoration without the need to add any code, apart from setting `restorationIdentifier` property on each of them.
- `UIViewController` subclasses need to implement several methods from `UIViewControllerRestoration` and `UIStateRestoring` protocols to save and restore their state.
- The saved state is removed if you "kill" the app from iOS task switcher.

## License

Copyright © 2019 Dariusz Rybicki Darrarski

License: **TBD**
