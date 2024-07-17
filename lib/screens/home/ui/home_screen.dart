// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solar_icons/solar_icons.dart';

import 'package:azan/themeModes/themes.dart';

import '../../../main.dart';
import '../../../widgets/azan_content_widget.dart';
import '../example.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Prayers {
  final String prayerName;
  final String prayerTime;
  final IconData iconData;
  const Prayers({
    required this.prayerName,
    required this.prayerTime,
    required this.iconData,
  });
}

List<Prayers> prayerList = const [
  Prayers(
    prayerName: 'Fajir',
    prayerTime: '04:30',
    iconData: SolarIconsBold.sunrise,
  ),
  Prayers(
    prayerName: 'Dhuhar',
    prayerTime: '01:30',
    iconData: SolarIconsBold.sun2,
  ),
  Prayers(
    prayerName: 'Asar',
    prayerTime: '04:30',
    iconData: SolarIconsBold.sun,
  ),
  Prayers(
    prayerName: 'Maghrib',
    prayerTime: '07:30',
    iconData: SolarIconsBold.sunfog,
  ),
  Prayers(
    prayerName: 'Isha',
    prayerTime: '08:45',
    iconData: SolarIconsBold.moon,
  ),
];

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  double _opacity = 1.0;

  // InitState

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    double offset = _scrollController.offset;
    setState(() {
      double height = mq.height * 0.30;
      height = height - 50;

      _opacity = 1 -
          (offset /
              height
                  .round()); // Adjust the scroll length for opacity transition
      if (_opacity < 0) _opacity = 0; // Ensure opacity doesn't go negative
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // Build Context
  @override
  Widget build(BuildContext context) {
    int activeIndex = 4;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blueGrey[50],

        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: SizedBox(
                // decoration: BoxDecoration(color: Colors.amber),
                height: mq.height * 0.68,
                width: mq.width,
              ),
            ),
            Positioned(
              width: mq.width,
              height: mq.height * 0.30,
              child: Opacity(
                opacity: _opacity,
                child: Image.asset(
                  'assets/images/masjid.png',
                  fit: BoxFit.fill,
                  color: Theme.of(context).highlightColor,
                ),
              ),
            ),
            Positioned(
              width: mq.width,
              height: mq.height * 0.30,
              child: Opacity(
                opacity: _opacity,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Theme.of(context).splashColor,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              controller: _scrollController,
              children: <Widget>[
                SizedBox(
                  height: mq.height * 0.26,
                ),
                Center(
                  child: Container(
                    height: mq.height * 0.43,
                    width: mq.width * 0.8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: dark
                              ? ThemeStyle.darkUpperShahdowColor
                              : ThemeStyle.lightUpperShahdowColor,
                          spreadRadius: ThemeStyle.spreadRadius,
                          blurRadius: ThemeStyle.blurRadius,
                          offset: ThemeStyle.upperOffset,
                        ),
                        BoxShadow(
                          color: dark
                              ? ThemeStyle.darkLowerShahdowColor
                              : ThemeStyle.lightLowerShahdowColor,
                          spreadRadius: ThemeStyle.spreadRadius,
                          blurRadius: ThemeStyle.blurRadius,
                          offset: ThemeStyle.lowerOffset,
                        ),
                      ],
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.rectangle,
                      borderRadius: ThemeStyle.borderRadius,
                    ),
                    child: ListView.builder(
                      itemCount: prayerList.length,
                      itemBuilder: (context, index) {
                        final prayer = prayerList[index];
                        // return AzanContentWidget(
                        //   prayerName: prayer.prayerName,
                        //   prayerTime: prayer.prayerTime,
                        //   icon: prayer.iconData,
                        //   index: index,
                        // );

                        return Container(
                          decoration: BoxDecoration(
                            color: index == activeIndex
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                          child: ListTile(
                              // tileColor: index == activeIndex
                              //     ? Theme.of(context).primaryColor
                              //     : Color.fromARGB(183, 22, 156, 114),
                              // tileColor: Colors.amber,
                              title: Text(
                                prayer.prayerName,
                                style: index == activeIndex
                                    ? ThemeStyle.bodyMediumActiveIndexTextStyle
                                    : Theme.of(context).textTheme.bodyMedium,
                              ),
                              subtitle: Text(
                                prayer.prayerTime,
                                style: index == activeIndex
                                    ? ThemeStyle.bodySmallActiveIndexTextStyle
                                    : Theme.of(context).textTheme.bodySmall,
                              ),
                              trailing: Icon(
                                prayer.iconData,
                                size: 29,
                                color:
                                    index == activeIndex ? Colors.white : null,
                              ),
                              onTap: () {
                                setState(
                                  () => activeIndex = index,
                                );
                                print('$index');
                              }),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: mq.width,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 216, 116),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContainerBehindExample()),
                        );
                      },
                      child: const Text('Example')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: mq.width,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 216, 116),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: mq.width,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 216, 116),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: mq.width,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 216, 116),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: mq.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(188, 25, 21, 8),
                  ),
                ),
                Container(
                  width: mq.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(187, 121, 105, 216),
                  ),
                ),
                Container(
                  width: mq.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(187, 158, 152, 135),
                  ),
                ),
                Container(
                  width: mq.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(187, 101, 85, 34),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
