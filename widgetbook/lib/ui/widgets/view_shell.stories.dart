import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'view_shell.stories.g.dart';

const meta = Meta(ViewShell.new);

const loadingMeta = Meta(ViewShell.loading);

const errorMeta = Meta(ViewShell.error);

final $Default = _Story(
  args: _Args(child: Arg.fixed(const _BrandBackground())),
);

final $Loading = _LoadingStory();

final $Error = _ErrorStory();

class _BrandBackground extends StatelessWidget {
  const _BrandBackground();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: AppTheme.of(context).background.brand);
  }
}
