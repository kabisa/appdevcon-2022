# Kudo Flutter Workshop @Kabisa

Building a Kudo App with Dart and Flutter technologie by @pascalw and @thnukid.

## Getting Started

For this workshop we'll be using Flutter Desktop for macOS, to minimize the number of required dependencies.

1. Install XCode
2. Install Flutter from the master channel:
   ```sh
   git clone -b master https://github.com/flutter/flutter.git
   ./flutter/bin/flutter doctor -v
   ```
   If setup correctly, the output shows a [✓]
3. Optionally, add the Flutter bin directory to your `$PATH`:
   ```sh
   export PATH="/path/to/flutter/repo/bin/:$PATH"
   ```
4. Install the VSCode Flutter plugin (https://flutter.dev/docs/get-started/editor?tab=vscode)
   OR
   Install Android Studio with the Flutter plugin (https://flutter.dev/docs/get-started/editor?tab=androidstudio)

## Our Agenda

| Item                                       | Time          | Notes                                                                                                     |
|--------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------------|
| Introduction & theory                      | 17:30 - 18:00 | - [Dart 101](#dart-101)<br/> - [Flutter 101](#flutter-101) <br/> - [Workshop Intro and Goals](#what-are-we-going-to-build) |
| Exercise 1: Build a Kudo card              | 18:00 - 18:30 |                                                                                                           |
| Exercise 2: Build a Kudo list view         | 18:30 - 19:00 |                                                                                                           |
| Break                                      | 19:00 - 19:15 |                                                                                                           |
| Exercise 3: Build a Kudo form              | 19:15 - 19:45 |                                                                                                           |
| Exercise 4: State management with Provider | 19:45 - 20:15 |                                                                                                           |
| Closing                                    | 20:15 - 20:30 |                                                                                                           |

## Dart 101

* The official [Dart.dev Language Tour](https://dart.dev/guides/language/language-tour)
* Reference [Cheatsheet Dart Language](https://learnxinyminutes.com/docs/dart/)

## Flutter 101

- https://flutterbyexample.com/
- [Flutter layout cheatsheet](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)

## What are we going to build?

Kudos are compliments that you give your colleguages for excellent work.

Today we want to build a Flutter Kudo App, so we created these user stories:

> As a user, I want to see a kudo transaction, so that I display kudos given and received.

> As a user, I want to see a kudo transaction feed, so that I see a list of kudos given.

> As a user, I want to create a kudo transaction form, so that I can enter new kudo transactions.

> As a user, I want to submit a new kudo transaction and show the transaction in the kudo feed, so that I can give kudos to my co-worker.

After the workshop you will be able to:

* Have a general idea about the Dart Language and how to use that with flutter
* Decipher a mockup into Flutter widgets
* [Give Kudos for the workshop ;)](https://kudos.kabisa.io)

Lets flutter away!

Start your journey [here](./workshop_starter/README.md).
