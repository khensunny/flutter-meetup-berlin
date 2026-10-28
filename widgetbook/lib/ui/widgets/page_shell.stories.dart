import 'package:flutter/material.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'page_shell.stories.g.dart';

class PageShellInput {
  const PageShellInput({required this.header, required this.color});

  final String header;
  final Color color;
}

const meta = Meta(PageShell.new, argsType: PageShellInput.new);

final defaults = _Defaults(
  builder: (context, args) {
    return PageShell(title: args.header, child: _Placeholder(args.color));
  },
);

final $Default = _Story(
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=6802-3379&t=N6qwmLP7MP59ClWB-4',
  args: _Args(
    header: StringArg('Header'),
    color: ColorArg(const Color(0xFFD9D9D9)),
  ),
);

class _Placeholder extends StatelessWidget {
  const _Placeholder(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color);
  }
}
