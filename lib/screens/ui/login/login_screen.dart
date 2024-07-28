import 'package:azan/screens/ui/signup/signup.dart';
import 'package:azan/themeModes/theme_bloc.dart';
import 'package:azan/widgets/app_icon.dart';
import 'package:azan/widgets/circular_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../../../themeModes/theme_modes.dart';
import '../../../widgets/txt_formfield.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  late FocusNode emailfocusNode;
  final FocusNode passwordfocusNode = FocusNode();
  final FocusScopeNode focusScopeNode = FocusScopeNode();
  @override
  void initState() {
    emailfocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('object');
    final double horizontalPadding = mq.width * 0.11;

    //
    bool rememberMe = false;

    // final LoginBloc loginBloc = LoginBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Icon(
            Icons.wb_sunny_rounded,
            color: Theme.of(context).highlightColor,
            size: 28,
          ),
          // Theme changing button
          Switch(
            value: dark, // default false
            onChanged: (bool value) {
              if (!dark) {
                dark = true;
              } else {
                dark = false;
              }
              // print(dark);
              // focusScopeNode.unfocus();
              context.read<ThemeBloc>().add(
                    ToggleThemeEvent(
                      newThemeMode: dark ? ThemeModes.dark : ThemeModes.light,
                    ),
                  );
            },
          ),

          // rotate the moon icon
          RotationTransition(
            turns: const AlwaysStoppedAnimation(320 / 360),
            child: Icon(
              Icons.nightlight_round_outlined,
              color: Theme.of(context).highlightColor,
              size: 28,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const Spacer(),
            const SizedBox(
              height: 80,
              width: 80,
            ),

            // Logo of the app at login screen widget
            // ignore: prefer_const_constructors
            AppLogo(),
            // const Spacer(),
            const SizedBox(
              height: 80,
              width: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SignIn',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MySignUpScrren();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'SignUp?',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
            ),

            //Login form
            FocusScope(
              node: focusScopeNode,
              child: Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Email Address TextFormField
                      MyTextFormField(
                        leadingIcon: Icons.alternate_email_rounded,
                        obscureText: false,
                        hintText: 'Email',
                        node: emailfocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => passwordfocusNode.nextFocus(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Password TextFormFormFields
                      MyTextFormField(
                        leadingIcon: Icons.password,
                        obscureText: true,
                        hintText: 'Password',
                        suffix: true,
                        node: passwordfocusNode,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () => passwordfocusNode.unfocus(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * 0.05, vertical: 20),
              child: Row(
                children: [
                  // Remember me check box
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Remember me?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),

                  // forget password button to reset the password
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password?",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      // Continue with Google Login button
                      CircularButton(
                        image: Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.fill,
                          width: 70,
                          height: 70,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 5,
                        height: 0,
                      ),

                      //Continue with facebook Login button
                      CircularButton(
                        image: Image.asset(
                          'assets/images/facebook.png',
                          fit: BoxFit.fill,
                          width: 70,
                          height: 70,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircularButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).cardColor,
                        ),
                        onPressed: () {
                          // passwordfocusNode.dispose();
                          // emailfocusNode.dispose();
                          // focusScopeNode.dispose();
                        },
                        bgClr: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
