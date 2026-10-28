import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/data/data.dart';
import 'package:groceries_app/features/features.dart';
import 'package:groceries_app/root/root.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../custom/view_state.dart';

part 'account_screen.stories.g.dart';

class AccountScreenInput {
  const AccountScreenInput({
    required this.state,
    required this.name,
    required this.isVerified,
  });

  final ViewState state;
  final String name;
  final bool isVerified;
}

const meta = Meta(AccountScreen.new, argsType: AccountScreenInput.new);

final defaults = _Defaults(
  builder: (context, args) => const AccountScreen(),
  setup: (context, child, args) {
    return ProviderScope(
      overrides: [
        userProvider.overrideWith((ref) {
          return args.state.map(
            data: User(name: args.name, isVerified: args.isVerified),
          );
        }),
      ],
      child: AppShell(
        activeRoute: AppRoute.account,
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
      values: [ViewState.data, ViewState.loading, ViewState.error],
    ),
    name: StringArg('John Doe'),
    isVerified: BoolArg(false),
  ),
);
