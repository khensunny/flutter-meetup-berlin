import 'package:flutter/widgets.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

part 'about_screen.stories.g.dart';

const meta = Meta(AboutScreen.new);

/// This story demonstrates how assets are loaded in both the app package and
/// the widgetbook package simultaneously.
final $Default = _Story(args: _Args(onGoBack: Arg.fixed(() {})));
