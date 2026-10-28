import 'package:groceries_app/data/data.dart';
import 'package:groceries_app/data/mocks.dart';
import 'package:widgetbook/widgetbook.dart';

/// An [Arg] that shows the mocks fruits in a dropdown.
class FruitArg extends Arg<Fruit> with SingleFieldOnly<Fruit> {
  FruitArg(super.value, {super.name});

  @override
  Field<Fruit> get field {
    return ObjectDropdownField<Fruit>(
      name: 'fruit',
      initialValue: value,
      values: MockDataStore.fruits,
      labelBuilder: (fruit) => fruit.name,
    );
  }
}
