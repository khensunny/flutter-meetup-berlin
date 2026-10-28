import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'primary_button.stories.g.dart';

class PrimaryButtonInput {
  const PrimaryButtonInput({required this.content, required this.enabled});

  final String content;
  final bool enabled;
}

const meta = Meta(PrimaryButton.new, argsType: PrimaryButtonInput.new);

final defaults = _Defaults(
  builder: (context, args) {
    return PrimaryButton(
      content: args.content,
      onPressed: args.enabled ? () {} : null,
    );
  },
  setup: (context, child, args) {
    return Padding(padding: const EdgeInsets.all(16), child: child);
  },
);

final $Default = _Story(
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7235-4663&t=N6qwmLP7MP59ClWB-4',
  args: _Args(content: StringArg('Button'), enabled: BoolArg(true)),
);
