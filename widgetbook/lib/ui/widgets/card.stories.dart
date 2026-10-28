import 'package:flutter/widgets.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'card.stories.g.dart';

class CardInput {
  const CardInput({required this.content});

  final String content;
}

const meta = Meta(Card.new, argsType: CardInput.new);

final defaults = _Defaults(
  builder: (context, args) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(args.content),
      ),
    );
  },
);

final $Default = _Story(
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7340-24498&t=N6qwmLP7MP59ClWB-4',
  args: _Args(content: StringArg('This is some text')),
);
