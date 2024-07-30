import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import 'package:azan/themeModes/themes.dart';

import '../../../main.dart';
import '../../../utility/utility.dart';
import '../../widgets/app_features_widget.dart';
import '../../widgets/azan_content_widget.dart';
import '../../../blocs/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key})
      : _scrollController = ScrollController(),
        _opacityNotifier = ValueNotifier(1.0);

  final ScrollController _scrollController;
  final ValueNotifier<double> _opacityNotifier;

  // Build Context
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    context.read<HomeBloc>().add(const HomeInitialEvent());
    // print('HomeInitialEvent is triggered');
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            // This is background image of the Custom AppBar
            Positioned(
              width: mq.width,
              height: mq.height * 0.30,
              child: BlocListener<HomeBloc, HomeState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is HomeInitialState) {
                    // print('HomeInitialState is listened by the listener');
                    context.read<HomeBloc>().add(const ScrollEvent());
                  }
                  if (state is HomeScrollingState) {
                    // print('HomeScrollingState is listened by the listener');
                    double offset;
                    _scrollController.addListener(() {
                      offset = _scrollController.offset;
                      double height = mq.height * 0.17;
                      height = height - 50;
                      _opacityNotifier.value = 1 -
                          (offset /
                              height
                                  .round()); // Adjust the scroll length for opacity transition
                      if (_opacityNotifier.value < 0) {
                        _opacityNotifier.value = 0;
                      }
                    });
                  }
                },
                child: ValueListenableBuilder(
                  valueListenable: _opacityNotifier,
                  builder: (context, opacity, child) {
                    return Opacity(opacity: opacity, child: child);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/masjid.png'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // List View from the center of the app to the bottom
            ListView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                // Sized Box from top to the End of background image
                SizedBox(
                  height: mq.height * 0.17,
                ),

                // Next Prayer Time widget
                Center(
                  child: Container(
                    height: mq.height * 0.08,
                    width: mq.width * 0.8,
                    decoration: ThemeStyle.decoration(
                      color: Theme.of(context).cardColor,
                      reverseShadow: true,
                    ),
                    child: ListTile(
                      title: Text(
                        'Asar',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        'Next Prayer In 01:23',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Column(
                        children: [
                          const Icon(SolarIconsBold.mapPoint),
                          Text(
                            'Lahore',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),

                // Prayer Time and other content of the prayer
                Center(
                  child: Container(
                    height: mq.height * 0.416,
                    width: mq.width * 0.8,
                    decoration: ThemeStyle.decoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: BlocBuilder<HomeBloc, HomeState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is HomeLoadingState ||
                            state is HomeInitialState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is HomeLoadedState) {
                          // ignore: unused_local_variable
                          var timings = Utility.extractTodayPrayerList(
                              state.prayerTimings.data);
                          return ListView.builder(
                            itemCount:
                                Utility.getPrayerNameWithTime(timings).length,
                            itemBuilder: (context, index) {
                              final prayer =
                                  Utility.getPrayerNameWithTime(timings)[index];
                              return AzanContentWidget(
                                index: index,
                                prayerObj: prayer,
                              );
                            },
                          );
                        }
                        return const Center(
                          child: Text('Error'),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                // Additional features row
                Center(
                  child: SizedBox(
                    width: mq.width * 0.8,
                    height: mq.height * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AdditionalFeatureWidget(
                          imageIcon: Image.asset(
                            'assets/images/pray.png',
                            color: dark
                                ? ThemeStyle.darkIconColor
                                : ThemeStyle.lightIconColor,
                          ),
                          title: 'Prayer Tracking',
                        ),
                        AdditionalFeatureWidget(
                          imageIcon: Image.asset(
                            'assets/images/tasbih.png',
                            color: dark
                                ? ThemeStyle.darkIconColor
                                : ThemeStyle.lightIconColor,
                          ),
                          title: 'Tasbih Counter',
                        ),
                        AdditionalFeatureWidget(
                          imageIcon: Image.asset(
                            'assets/images/open-hands.png',
                            color: dark
                                ? ThemeStyle.darkIconColor
                                : ThemeStyle.lightIconColor,
                          ),
                          title: 'Duaa',
                        ),
                      ],
                    ),
                  ),
                ),

                //Additional Features Second row
                Center(
                  child: SizedBox(
                    width: mq.width * 0.8,
                    height: mq.height * 0.2,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AdditionalFeatureWidget(
                          iconData: SolarIconsOutline.notebookBookmark,
                          title: 'Islamic History',
                        ),
                        AdditionalFeatureWidget(
                          iconData: SolarIconsOutline.calendar,
                          title: 'Islamic Hijri Calendar',
                        ),
                        AdditionalFeatureWidget(
                          iconData: SolarIconsOutline.peopleNearby,
                          title: 'Community',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.11,
                )
              ],
            ),

            // Custom App Bar at the top of the screen
            Positioned(
              child: Container(
                height: mq.height * 0.091,
                width: mq.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(72, 0, 0, 0),
                ),
                child: ListTile(
                  title: Text(
                    'Today',
                    style: ThemeStyle.titleLargeActiveIndexTextStyle,
                  ),
                  subtitle: Text(
                    '11 Muharram 1446 AH',
                    style: ThemeStyle.bodySmallActiveIndexTextStyle,
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.settings_outlined,
                      size: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // Home Screen Bottom Sheet
        bottomSheet: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                SolarIconsBold.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                SolarIconsBold.handHeart,
              ),
              label: 'Charity',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                SolarIconsBold.book,
              ),
              label: 'Quran',
            ),
          ],
        ),
      ),
    );
  }
}

// 