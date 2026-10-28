import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/data/data.dart';
import 'package:groceries_app/data/mocks.dart';
import 'package:groceries_app/features/features.dart';
import 'package:groceries_app/root/root.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../custom/view_state.dart';

part 'shop_screen.stories.g.dart';

class ShopScreenInput {
  const ShopScreenInput({required this.state});

  final ViewState state;
}

const meta = Meta(ShopScreen.new, argsType: ShopScreenInput.new);

final defaults = _Defaults(
  builder: (context, args) => const ShopScreen(),
  setup: (context, child, args) {
    return ProviderScope(
      overrides: [
        fruitsProvider.overrideWith((ref) {
          return args.state.map(data: MockDataStore.fruits, empty: <Fruit>[]);
        }),
      ],
      child: AppShell(
        activeRoute: AppRoute.shop,
        onRouteTap: (_) {},
        child: child,
      ),
    );
  },
);

final $Default = _Story(
  args: _Args(
    state: EnumArg<ViewState>(ViewState.data, values: ViewState.values),
  ),
);
