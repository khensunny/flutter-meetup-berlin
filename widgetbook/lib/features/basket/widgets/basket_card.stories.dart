import 'package:flutter/widgets.dart';
import 'package:groceries_app/data/data.dart';
import 'package:groceries_app/data/mocks.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../custom/fruit_arg.dart';

part 'basket_card.stories.g.dart';

class BasketCardInput {
  const BasketCardInput({required this.fruit, required this.count});

  final Fruit fruit;
  final int count;
}

const meta = Meta(BasketCard.new, argsType: BasketCardInput.new);

final defaults = _Defaults(
  builder: (context, args) {
    return BasketCard(
      fruit: args.fruit,
      count: args.count,
      onFruitAdded: () {},
      onFruitRemoved: () {},
    );
  },
  setup: (context, child, args) {
    return Padding(padding: const EdgeInsets.all(8), child: child);
  },
);

final $Default = _Story(
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=8808-4859&t=zUakLdAaKjMZAqSq-4',
  args: _Args(fruit: FruitArg(MockDataStore.fruits.first), count: IntArg(0)),
);
