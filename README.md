
### HighlightedText

A Flutter widget that provides a way to find and highlight specific text patterns within a body of text. It also offers tappable interactions for highlighted text segments.

##### Key Features

* `Find and Highlight`: Effortlessly highlights multiple text patterns within your text content.
* `Custom Styling`: Apply your own text style to the highlighted parts for a unique look.
*  `Tap Interactions`: Define actions that happen when a user taps the highlighted text (e.g., display a popup, navigate to a new view).
* `Flexible Matching`:
    * Case-sensitive or case-insensitive matching
    * Unicode support
    * Single or multi-line matching
    * Utilize dotAll for broader regular expression matching

##### Installation

Add the highlighted_text package to your project’s dependencies in your pubspec.yaml file:

```dart
dependencies:
  highlighted_text: ^current version

Run flutter pub get to install the package.
```

##### Usage

Import the package and use the HighlightedText widget:

```dart
import 'package:highlighted_text/highlighted_text.dart';

HighlightedText(
  "This is a sample text with keywords to highlight",
  patterns: ["sample", "highlight"],
  highLightStyle: const TextStyle(
    color: Colors.orange,
    fontWeight: FontWeight.bold,
  ),
  onTap: (pattern) {
    print("Tapped on: $pattern");
  },
), 

```

Customization

`highLightStyle`: Control the styling of highlighted text (color, background, font, etc.)
`onTap`: Define a callback function to execute when a user taps on highlighted text.
`caseSensitive`, `unicode`, `multiple`, `dotAll`: Configure regular expression matching behavior.

Example

```dart
Dart
import 'package:flutter/material.dart';
import 'package:highlighted_text/highlighted_text.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: HighlightedText(
            "Find multiple words or phrases. This is case-sensitive.",
            patterns: ["Find", "case-sensitive"],
            highLightStyle: const TextStyle(
              color: Colors.red, 
              backgroundColor: Colors.yellow,
            ),
            caseSensitive: true,
          ),
        ),
      ),
    );
  }
}
```

License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Miso-0/flutter_highlighted_text?tab=License-1-ov-file) file for details.