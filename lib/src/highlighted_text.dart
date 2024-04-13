import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HighlightedText extends Text {
  const HighlightedText(
    super.data, {
    super.key,
    super.maxLines,
    super.locale,
    super.overflow,
    super.selectionColor,
    super.semanticsLabel,
    super.softWrap,
    super.strutStyle,
    super.style,
    super.textAlign,
    super.textDirection,
    super.textHeightBehavior,
    super.textScaler,
    super.textWidthBasis,
    required this.patterns,
    required this.highLightStyle,
    this.onTap,
    this.caseSensitive = false,
    this.unicode = false,
    this.multiple = false,
    this.dotAll = false,
  });

  //Style the highlighted text
  final TextStyle highLightStyle;

  ///The list of texts to find in the given value
  final List<String> patterns;

  final bool caseSensitive;
  final bool unicode;
  final bool multiple;
  final bool dotAll;

  ///When the matched pattern is tapped
  ///I thought it might be usefull
  final void Function(String pattern)? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      key: key,
      maxLines: maxLines,
      locale: locale,
      overflow: overflow ?? TextOverflow.clip,
      selectionColor: selectionColor,
      softWrap: softWrap ?? true,
      strutStyle: strutStyle,
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler ?? TextScaler.noScaling,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      text: TextSpan(
        children: [..._words(data ?? '', _matches())],
      ),
    );
  }

  List<InlineSpan> _words(String text, Iterable<RegExpMatch> matches) {
    final List<InlineSpan> result = [];
    int start = 0;
    for (final RegExpMatch match in matches) {
      if (match.start != start) {
        result.add(
          TextSpan(
            text: text.substring(start, match.start),
            style: style,
          ),
        );
      }
      final String t = text.substring(match.start, match.end);
      result.add(
        TextSpan(
          text: t,
          style: highLightStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              onTap?.call(t);
            },
        ),
      );
      start = match.end;
    }
    if (start < text.length) {
      result.add(
        TextSpan(text: text.substring(start, text.length), style: style),
      );
    }
    return result;
  }

  //find the reg x matches on the text
  Iterable<RegExpMatch> _matches() {
    final String regPattern = patterns.join('|');
    final RegExp combinedRegExp = RegExp(
      regPattern,
      caseSensitive: caseSensitive,
      unicode: unicode,
      dotAll: dotAll,
      multiLine: multiple,
    );
    final Iterable<RegExpMatch> matches = combinedRegExp.allMatches(data ?? '');
    return matches;
  }
}
