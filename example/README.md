
# Installing

_This example assumes you're using a recent version of the Dart or Flutter SDK._

To use [package:json_fields][json_fields] in your package, add these
dependencies to your `pubspec.yaml`.

```yaml
dependencies:
  json_annotation:

dev_dependencies:
  build_runner:
  json_fields:
```

# Annotating

Annotate your code with classes defined in
[package:json_annotation][json_annotation].

- See [`lib/example.dart`][example] & [`lib/complex_example.dart`][complex_example] for an example of a file using these
  annotations.

- See [`lib/example.g.dart`][example_g] & [`lib/complex_example.g.dart`][complex_example_g] for the generated file.

# Generating

Run `pub run build_runner build` to generate files into your source directory.

```console
> pub run build_runner build
[INFO] ensureBuildScript: Generating build script completed, took 368ms
[INFO] BuildDefinition: Reading cached asset graph completed, took 54ms
[INFO] BuildDefinition: Checking for updates since last build completed, took 663ms
[INFO] Build: Running build completed, took 10ms
[INFO] Build: Caching finalized dependency graph completed, took 44ms
[INFO] Build: Succeeded after 4687ms with 1 outputs
```

_NOTE_: If you're using Flutter, replace `pub run` with
`flutter packages pub run`.

# Using

Checkout [`lib/main.dart`][main] for an example of how to use the generated classes.

[main]: lib/main.dart
[example]: lib/example.dart
[example_g]: lib/example.g.dart
[complex_example]: lib/complex_example.dart
[complex_example_g]: lib/complex_example.g.dart
[json_annotation]: https://pub.dev/packages/json_annotation
[json_fields]: https://pub.dev/packages/json_fields
