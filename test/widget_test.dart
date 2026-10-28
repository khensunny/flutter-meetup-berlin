import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/data/data.dart';
import 'package:groceries_app/features/account/account.dart';
import 'package:groceries_app/features/basket/basket.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/ui/ui.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  const fruit = Fruit(
    id: 1,
    name: 'Mango',
    imageUrl: 'https://example.com/mango.jpg',
    farm: 'John Doe Farm',
    origin: 'California',
    price: 3.34,
  );

  group('Basket', () {
    test('tracks quantities and totals', () {
      const basket = Basket.empty();

      final oneMango = basket.copyWithIncreasedQuantity(fruit);
      expect(oneMango.items[fruit], 1);
      expect(oneMango.subTotal, fruit.price);

      final twoMangoes = oneMango.copyWithIncreasedQuantity(fruit);
      expect(twoMangoes.items[fruit], 2);
      expect(twoMangoes.subTotal, fruit.price * 2);

      final oneMangoAgain = twoMangoes.copyWithDecreasedQuantity(fruit);
      expect(oneMangoAgain.items[fruit], 1);

      final emptyBasket = oneMangoAgain.copyWithDecreasedQuantity(fruit);
      expect(emptyBasket.isEmpty, isTrue);
    });

    test('notifier adds, removes and clears fruits', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(basketProvider.notifier).addFruit(fruit);
      expect(container.read(basketProvider).items[fruit], 1);

      container.read(basketProvider.notifier).removeFruit(fruit);
      expect(container.read(basketProvider).isEmpty, isTrue);

      container.read(basketProvider.notifier)
        ..addFruit(fruit)
        ..addFruit(fruit)
        ..clear();
      expect(container.read(basketProvider).isEmpty, isTrue);
    });
  });

  testWidgets('account view shows the signed-in user', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: AppTheme(
          data: AppThemeData.light,
          child: const Scaffold(
            body: AccountDataView(
              user: User(name: 'John Doe', isVerified: true),
              onVerifyEmail: _noop,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Welcome,'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
  });
}

void _noop() {}
