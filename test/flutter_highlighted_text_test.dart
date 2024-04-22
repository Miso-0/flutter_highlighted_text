import 'package:flutter/material.dart';
import 'package:flutter_highlighted_text/flutter_highlighted_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HighlightedText Widget Tests', () {
    testWidgets('Highlights text correctly with custom style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HighlightedText(
              'This is a sample text with keywords to highlight',
              patterns: ['sample', 'highlight'],
              highLightStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      // Find highlighted text with the specified style
      final highlighted1 =
          find.text('sample').last; // 'sample' should be highlighted
      final highlighted2 =
          find.text('highlight').last; // 'highlight' should be highlighted

      expect(highlighted1, findsOneWidget);
      expect(highlighted2, findsOneWidget);

      // Verify the text style
      final textStyle1 = tester.widget<RichText>(highlighted1).text.style;
      final textStyle2 = tester.widget<RichText>(highlighted2).text.style;

      expect(textStyle1,
          const TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
      expect(textStyle2,
          const TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
    });

    testWidgets('onTap callback is triggered', (tester) async {
      String? tappedPattern;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HighlightedText(
              'Test text',
              patterns: const ['Test'],
              highLightStyle: const TextStyle(color: Colors.blue),
              onTap: (pattern) {
                tappedPattern = pattern;
              },
            ),
          ),
        ),
      );

      final highlightedText = find.text('Test');
      expect(highlightedText, findsOneWidget);
      await tester.tap(highlightedText);
      await tester.pumpAndSettle(); // Allow time for onTap callback to execute

      expect(tappedPattern, 'Test');
    });
  });
}
