import 'package:flutter/widgets.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

part 'cost_item_row.stories.g.dart';

const meta = Meta(CostItemRow.new);

final defaults = _Defaults(
  setup: (context, child, args) {
    return Padding(padding: const EdgeInsets.all(8), child: child);
  },
);

final $Default = _Story(
  args: _Args(
    label: StringArg('Delivery'),
    cost: DoubleArg(
      5,
      style: const SliderDoubleArgStyle(min: 0, max: 10000, divisions: 100),
    ),
  ),
);
