import 'package:flutter/material.dart';

import '../main.dart';
import '../themeModes/themes.dart';

class AdditionalFeatureWidget extends StatelessWidget {
  final Image? imageIcon;
  final IconData? iconData;
  final String title;
  const AdditionalFeatureWidget({
    super.key,
    this.imageIcon,
    this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: mq.height * 0.1,
          width: mq.width * 0.24,
          decoration: ThemeStyle.decoration(
            color: Theme.of(context).cardColor,
          ),
          child: Center(
            child: SizedBox(
              height: mq.height * 0.07,
              width: mq.width * 0.16,
              child: imageIcon ??
                  Icon(
                    iconData,
                    size: 35,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: mq.height * 0.02,
        ),
        SizedBox(
          width: mq.width * 0.24,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}
