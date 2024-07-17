import 'package:azan/themeModes/theme_modes.dart';
import 'package:azan/themeModes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home/ui/home_screen.dart';
// import 'screens/login/ui/login_screen.dart';
import 'themeModes/theme_bloc.dart';
// import 'screens/signup/ui/signup.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

late Size mq;
bool dark = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    // FocusScope.of(context).requestFocus(emailfocusNode);
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        buildWhen: (previous, current) => current is IntialThemeState,
        builder: (context, state) {
          if (state is IntialThemeState) {
            //print(state);
            // Default the is the User Preference Theme But when user change to any dark or light then
            //Toggle theme event trigger then theme mode is either light or dark then according
            // the condition in switch case if execute the that part which is true,
            // To resolve the Issue we have to ask the user to use either system or custom theme and then set the
            // state according to the user wish

            // Prayer Api

            // https://muslimsalat.com/api/
            //Prayer Times API (RapidAPI): https://aladhan.com/prayer-times-api (This one aggregates results from other APIs)
            //MohanadOO Prayer Time API (GitHub): https://github.com/topics/prayer-times (This one uses the Aladhan library)

            final brightness = MediaQuery.platformBrightnessOf(context);
            //print("**************** $brightness *****************");
            final themeMode = state.themeMode;
            ThemeData? currentTheme;
            switch (themeMode) {
              case ThemeModes.light:
                currentTheme = lightTheme;
                break;
              case ThemeModes.dark:
                currentTheme = darkTheme;
                break;
              default:
                if (brightness == Brightness.light) {
                  currentTheme = lightTheme;
                  dark = false;
                }
                if (brightness == Brightness.dark) {
                  currentTheme = darkTheme;
                  dark = true;
                }
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Azan App',
              // initialRoute: "/",
              // routes: {
              //   '/': (context) => const MyLoginScreen(),
              //   '/signUp': (context) => const MySignUpScrren(),
              // },
              theme: currentTheme,
              // home: const MyLoginScreen(),
              home: const HomeScreen(),
            );
          }
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text(
                    'Sorry for the interupt there is some issue with app. it will be resolved soon, we have noticed the issue'),
              ),
            ),
          );
        },
      ),
    );
  }
}
