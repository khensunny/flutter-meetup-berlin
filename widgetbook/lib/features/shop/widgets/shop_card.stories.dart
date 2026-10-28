import 'package:flutter/widgets.dart';
import 'package:groceries_app/data/data.dart';
import 'package:groceries_app/data/mocks.dart';
import 'package:groceries_app/features/shop/shop.dart';
import 'package:widgetbook/widgetbook.dart';

part 'shop_card.stories.g.dart';

const meta = Meta(ShopCard.new);

final defaults = _Defaults(
  setup: (context, child, args) {
    return Padding(padding: const EdgeInsets.all(8), child: child);
  },
);

final $Default = _Story(
  args: _Args(fruit: Arg.fixed(MockDataStore.fruits.first)),
);
