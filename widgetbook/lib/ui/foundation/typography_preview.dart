import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';

class DesignSystemTypographyPreview extends StatelessWidget {
  const DesignSystemTypographyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = AppTheme.of(context).typography;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            TypographyPreview(
              name: 'Display',
              styles: {'Display': styles.display},
            ),
            TypographyPreview(
              name: 'Heading',
              styles: {
                'Heading xl': styles.headingExtraLarge,
                'Heading lg': styles.headingLarge,
              },
            ),
            TypographyPreview(
              name: 'Subheading',
              styles: {
                'Subheading lg': styles.subheadingLarge,
                'Subheading sm': styles.subheadingSmall,
              },
            ),
            TypographyPreview(
              name: 'Body',
              styles: {
                'Body (semi bold)': styles.bodySemiBold,
                'Body (medium)': styles.bodyMedium,
                'Body (regular)': styles.bodyRegular,
                'Body sm': styles.bodySmall,
              },
            ),
            TypographyPreview(name: 'Label', styles: {'Label': styles.label}),
          ],
        ),
      ),
    );
  }
}

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({
    super.key,
    required this.name,
    required this.styles,
  });

  final String name;
  final Map<String, TextStyle> styles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.64,
          child: Text(
            name.toUpperCase(),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
          ),
        ),
        for (final style in styles.entries) Text(style.key, style: style.value),
      ],
    );
  }
}
