import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

part 'bottom_navigation_bar.stories.g.dart';

class BottomNavigationBarInput {
  const BottomNavigationBarInput();
}

const meta = Meta(
  BottomNavigationBar.new,
  argsType: BottomNavigationBarInput.new,
);

final defaults = _Defaults(
  builder: (context, args) {
    return BottomNavigationBar(
      navItems: [
        NavigationItem(
          isSelected: false,
          iconUnselected: FontAwesomeIcons.lemon,
          iconSelected: FontAwesomeIcons.solidLemon,
          text: AppLocalizations.of(context)!.navigationShopLabel,
        ),
        NavigationItem(
          isSelected: true,
          iconUnselected: FontAwesomeIcons.rectangleList,
          iconSelected: FontAwesomeIcons.solidRectangleList,
          text: AppLocalizations.of(context)!.navigationBasketLabel,
        ),
        NavigationItem(
          isSelected: false,
          iconUnselected: FontAwesomeIcons.user,
          iconSelected: FontAwesomeIcons.user,
          text: AppLocalizations.of(context)!.navigationUserLabel,
        ),
      ],
    );
  },
);

final $Default = _Story(
  designLink:
      'https://www.figma.com/design/HsANkdhbsCNTkXBzNJRNLD/Groceries-Demo?node-id=7271-52117&t=N6qwmLP7MP59ClWB-4',
);
