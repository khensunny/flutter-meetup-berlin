import 'package:flutter/widgets.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

part 'summary.stories.g.dart';

const meta = Meta(Summary.new);

final defaults = _Defaults(
  setup: (context, child, args) {
    return Padding(padding: const EdgeInsets.all(8), child: child);
  },
);

final $Default = _Story(
  args: _Args(
    subTotal: DoubleArg(
      10,
      style: const SliderDoubleArgStyle(min: 0, max: 100, divisions: 100),
    ),
    deliveryFees: DoubleArg(
      5,
      style: const SliderDoubleArgStyle(min: 0, max: 100, divisions: 100),
    ),
  ),
);
