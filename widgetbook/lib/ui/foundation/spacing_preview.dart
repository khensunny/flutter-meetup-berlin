import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';

class DesignSystemSpacingPreview extends StatelessWidget {
  const DesignSystemSpacingPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            SpacingPreview(name: 'zero', spacing: DesignSystemSpacing.zero),
            SpacingPreview(name: 'xxs', spacing: DesignSystemSpacing.xxs),
            SpacingPreview(name: 'xs', spacing: DesignSystemSpacing.xs),
            SpacingPreview(name: 'sm', spacing: DesignSystemSpacing.sm),
            SpacingPreview(name: 'md', spacing: DesignSystemSpacing.m),
            SpacingPreview(name: 'lg', spacing: DesignSystemSpacing.l),
            SpacingPreview(name: 'xl', spacing: DesignSystemSpacing.xl),
            SpacingPreview(name: 'xxl', spacing: DesignSystemSpacing.xxl),
            SpacingPreview(name: 'xxxl', spacing: DesignSystemSpacing.xxxl),
          ],
        ),
      ),
    );
  }
}

class SpacingPreview extends StatelessWidget {
  const SpacingPreview({super.key, required this.spacing, required this.name});

  final double spacing;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        SizedBox(
          width: 48,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                '${spacing}px',
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: spacing,
          decoration: BoxDecoration(
            color: AppTheme.of(context).background.brand,
            borderRadius: BorderRadius.circular(AppTheme.of(context).radius.xs),
          ),
        ),
      ],
    );
  }
}
