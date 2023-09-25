# flutter_resizer_image

Flutter Resizer Image using Rust library for [fast image resizing](https://github.com/cykooz/fast_image_resize).

## Usage

- pubspec.yml

```yaml
dependencies:
  flutter_resizer_image: ^0.0.1
```

- New Instance

```dart
final resizerImage = FlutterResizerImage.instance();
```

- Resize with Percent

```dart
String image = "iVBORw0KGgoA....AAANS=";
final image = await resizerImage.resizerWithPercent(
    image: image,
    percent: 50,
);
```

- Resize with Width x Height

```dart
String image = "iVBORw0KGgoA....AAANS=";
final image = await resizerImage.resizer(
    image: image,
    width: 100,
    height: 100,
);
```

