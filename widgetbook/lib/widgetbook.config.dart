import 'package:flutter/material.dart' hide ThemeMode;
import 'package:flutter/scheduler.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components.g.dart';
import 'custom/github_addon.dart';

Widget appThemeBuilder(BuildContext context, AppThemeData theme, Widget child) {
  return AppTheme(data: theme, child: child);
}

final config = Config(
  components: components,
  appBuilder: (context, child) => materialAppBuilder(
    context,
    ColoredBox(color: const Color(0xFF404040), child: child),
  ),
  addons: [
    BuilderAddon(
      name: 'Disable Animations (Cloud)',
      builder: (context, child) {
        // In Widgetbook Cloud context, disable the animations
        // so that the [Loader] widget doesn't show up in all
        // the reviews' diffs.
        if (WidgetbookState.of(context).previewMode) {
          timeDilation = double.maxFinite;
        }

        return child;
      },
    ),
    GitHubAddon('widgetbook/groceries-demo'),
    ViewportAddon([Viewports.none, IosViewports.iPhone13, IosViewports.iPad]),
    LocaleAddon(
      AppLocalizations.supportedLocales.reversed.toList(),
      AppLocalizations.localizationsDelegates,
    ),
    ThemeAddon<AppThemeData>({
      'Light': AppThemeData.light,
      'Dark': AppThemeData.dark,
    }, appThemeBuilder),
    AlignmentAddon(),
    TextScaleAddon(),
    BuilderAddon(
      name: 'SafeArea',
      builder: (_, child) => SafeArea(child: child),
    ),
    SemanticsAddon(),
  ],
  scenarioConfig: ScenarioConfig(
    definitions: [
      ScenarioDefinition(
        name: 'German Light',
        modes: [
          LocaleMode(
            const Locale('de'),
            AppLocalizations.localizationsDelegates,
          ),
          ThemeMode<AppThemeData>('Light', AppThemeData.light, appThemeBuilder),
        ],
      ),
      ScenarioDefinition(
        name: 'German Dark',
        modes: [
          LocaleMode(
            const Locale('de'),
            AppLocalizations.localizationsDelegates,
          ),
          ThemeMode<AppThemeData>('Dark', AppThemeData.dark, appThemeBuilder),
        ],
      ),
      ScenarioDefinition(
        name: 'English Light',
        modes: [
          LocaleMode(
            const Locale('en'),
            AppLocalizations.localizationsDelegates,
          ),
          ThemeMode<AppThemeData>('Light', AppThemeData.light, appThemeBuilder),
        ],
      ),
      ScenarioDefinition(
        name: 'English Dark',
        modes: [
          LocaleMode(
            const Locale('en'),
            AppLocalizations.localizationsDelegates,
          ),
          ThemeMode<AppThemeData>('Dark', AppThemeData.dark, appThemeBuilder),
        ],
      ),
    ],
  ),
);
