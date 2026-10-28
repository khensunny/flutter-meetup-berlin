import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/data/mocks.dart';
import 'package:groceries_app/features/features.dart';
import 'package:groceries_app/root/root.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../custom/view_state.dart';

part 'basket_screen.stories.g.dart';

class BasketScreenInput {
  const BasketScreenInput({required this.state});

  final ViewState state;
}

const meta = Meta(BasketScreen.new, argsType: BasketScreenInput.new);

final defaults = _Defaults(
  builder: (context, args) => const BasketScreen(),
  setup: (context, child, args) {
    return ProviderScope(
      overrides: [
        basketProvider.overrideWith(() {
          if (args.state == ViewState.empty) {
            return BasketNotifier();
          }

          final items = Map.fromEntries(
            MockDataStore.fruits
                .where((fruit) => fruit.name != 'Banana')
                .map((fruit) => MapEntry(fruit, 1)),
          );

          return BasketNotifier(Basket(items));
        }),
      ],
      child: AppShell(
        activeRoute: AppRoute.basket,
        onRouteTap: (_) {},
        child: child,
      ),
    );
  },
);

final $Default = _Story(
  args: _Args(
    state: EnumArg<ViewState>(
      ViewState.data,
      values: [ViewState.empty, ViewState.data],
    ),
  ),
);
