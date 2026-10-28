import 'package:flutter/widgets.dart';
import 'package:groceries_app/data/data.dart';
import 'package:groceries_app/data/mocks.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

part 'shop_data_view.stories.g.dart';

const meta = Meta(ShopDataView.new);

final $Default = _Story(
  args: _Args(
    fruits: Arg.fixed(MockDataStore.fruits),
    onFruitAdded: Arg.fixed((_) {}),
  ),
);
