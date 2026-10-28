import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook/test.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_workspace/widgetbook.config.dart';

import 'snapshot_http_overrides.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final workspaceConfig = config;
  final testConfig = workspaceConfig.copyWith(
    scenarioConfig: ScenarioConfig(
      definitions: workspaceConfig.scenarioConfig.definitions,
      nameBuilder: workspaceConfig.scenarioConfig.nameBuilder,
      setUp: workspaceConfig.scenarioConfig.setUp,
      tearDown: workspaceConfig.scenarioConfig.tearDown,
      // The wrapper runs inside each scenario's test zone, so the HTTP
      // overrides are visible while network images are loaded.
      wrapper: (tester, scenario, body) => HttpOverrides.runZoned(
        body,
        createHttpClient: createSnapshotHttpClient,
      ),
    ),
  );

  await testWidgetbook(testConfig);
}

extension on Config {
  Config copyWith({required ScenarioConfig scenarioConfig}) {
    return Config(
      initialRoute: initialRoute,
      components: components,
      appBuilder: appBuilder,
      home: home,
      addons: addons,
      integrations: integrations,
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      header: header,
      scrollBehavior: scrollBehavior,
      scenarioConfig: scenarioConfig,
      accessibilityConfig: accessibilityConfig,
      docsBuilder: docsBuilder,
      foldersExpandedByDefault: foldersExpandedByDefault,
    );
  }
}
