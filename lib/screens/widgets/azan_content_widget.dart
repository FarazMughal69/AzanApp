import 'package:flutter/material.dart';

import '../../models/prayermodel.dart';
import '../../themeModes/themes.dart';
// import 'package:solar_icons/solar_icons.dart';

class AzanContentWidget extends StatelessWidget {
  final Prayers prayerObj;
  final int index;
  const AzanContentWidget({
    super.key,
    required this.prayerObj,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    late int activeIndex = 0;
    return Container(
      decoration: BoxDecoration(
        color: index == activeIndex ? Theme.of(context).primaryColor : null,
        borderRadius: activeIndex == 4
            ? ThemeStyle.bottomBorderRadius
            : activeIndex == 0
                ? ThemeStyle.topBorderRadius
                : null,
      ),
      child: ListTile(
        title: Text(
          prayerObj.prayerName,
          style: index == activeIndex
              ? ThemeStyle.bodyMediumActiveIndexTextStyle
              : Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          prayerObj.prayerTime,
          style: index == activeIndex
              ? ThemeStyle.bodySmallActiveIndexTextStyle
              : Theme.of(context).textTheme.bodySmall,
        ),
        trailing: Icon(
          prayerObj.iconData,
          size: 29,
          color: index == activeIndex ? Colors.white : null,
        ),
        onTap: () {},
      ),
    );
  }
}
