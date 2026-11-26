import 'package:material_ui/material_ui.dart';

/// A [TextEditingController] that syntax-highlights the JSON it holds.
class JsonTextEditingController extends TextEditingController {
  static final _token = RegExp(
    r'"(?:[^"\\]|\\.)*"\s*:|"(?:[^"\\]|\\.)*"|-?\b\d+(?:\.\d+)?(?:[eE][+-]?\d+)?\b|\b(?:true|false|null)\b|[{}\[\],]',
  );

  JsonTextEditingController({super.text});

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    if (value.composing.isValid && withComposing) {
      return super.buildTextSpan(
        context: context,
        style: style,
        withComposing: withComposing,
      );
    }

    final colors = Theme.of(context).colorScheme;
    final spans = <TextSpan>[];

    text.splitMapJoin(
      _token,
      onMatch: (match) {
        final word = match.group(0)!;

        spans.add(TextSpan(text: word, style: _styleOf(word, style, colors)));

        return '';
      },
      onNonMatch: (other) {
        spans.add(TextSpan(text: other, style: style));

        return '';
      },
    );

    return TextSpan(style: style, children: spans);
  }

  TextStyle? _styleOf(String word, TextStyle? base, ColorScheme colors) {
    if (word.endsWith(':')) {
      return base?.copyWith(fontWeight: FontWeight.bold, color: colors.primary);
    } else if (word.startsWith('"')) {
      return base?.copyWith(color: colors.tertiary);
    } else if (word == 'true' || word == 'false') {
      return base?.copyWith(
        fontWeight: FontWeight.bold,
        color: colors.secondary,
      );
    } else if (word == 'null') {
      return base?.copyWith(
        fontWeight: FontWeight.bold,
        color: colors.outline,
      );
    } else if (word.length == 1 && '{}[],'.contains(word)) {
      return base?.copyWith(color: colors.outline);
    }

    return base?.copyWith(color: colors.secondary);
  }
}
