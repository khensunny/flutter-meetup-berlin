import 'package:groceries_app/data/data.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

part 'account_data_view.stories.g.dart';

class AccountDataViewInput {
  const AccountDataViewInput({required this.name, required this.isVerified});

  final String name;
  final bool isVerified;
}

const meta = Meta(AccountDataView.new, argsType: AccountDataViewInput.new);

final defaults = _Defaults(
  builder: (context, args) {
    return AccountDataView(
      user: User(name: args.name, isVerified: args.isVerified),
      onVerifyEmail: () {},
    );
  },
);

final $Default = _Story(
  args: _Args(name: StringArg('John Doe'), isVerified: BoolArg(false)),
);
