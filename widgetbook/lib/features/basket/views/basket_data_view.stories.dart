import 'package:groceries_app/data/mocks.dart';
import 'package:groceries_app/features/features.dart';
import 'package:widgetbook/widgetbook.dart';

part 'basket_data_view.stories.g.dart';

class BasketDataViewInput {
  const BasketDataViewInput({
    required this.mangoQuantity,
    required this.avocadoQuantity,
    required this.delivery,
    required this.subTotal,
  });

  final int mangoQuantity;
  final int avocadoQuantity;
  final double delivery;
  final double subTotal;
}

const meta = Meta(BasketDataView.new, argsType: BasketDataViewInput.new);

final defaults = _Defaults(
  builder: (context, args) {
    final fruits = MockDataStore.fruits
        .where((fruit) => fruit.name != 'Banana')
        .toList();

    return BasketDataView(
      items: {fruits[0]: args.mangoQuantity, fruits[1]: args.avocadoQuantity},
      delivery: args.delivery,
      subTotal: args.subTotal,
      onFruitAdded: (_) {},
      onFruitRemoved: (_) {},
      onContinueToShipping: () {},
    );
  },
);

final $Default = _Story(
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=6809-5504&t=zUakLdAaKjMZAqSq-4',
  args: _Args(
    mangoQuantity: IntArg(2),
    avocadoQuantity: IntArg(2),
    delivery: DoubleArg(5),
    subTotal: DoubleArg(50),
  ),
);
