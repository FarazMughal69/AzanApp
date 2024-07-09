import 'package:azan/screens/login/bloc/login_bloc.dart';
import 'package:azan/screens/signup/ui/signup.dart';
import 'package:azan/widgets/app_icon.dart';
import 'package:azan/widgets/circular_btn.dart';

import '../../../constant_folder/utility_export.dart';
import '../../../main.dart';
import '../../../widgets/txt_formfield.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  final FocusNode _emailfocusNode = FocusScopeNode();
  final FocusNode _passwordfocusNode = FocusScopeNode();
  final LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = mq.width * 0.11;
    bool rememberMe = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Icon(
            Icons.wb_sunny_rounded,
            color: MyColors.textColor(),
            size: 28,
          ),
          Switch(
            value: dark, // default false
            onChanged: (bool value) {
              loginBloc.add(ThemeChangeEvent(value: value));
            },
          ),
          RotationTransition(
            turns: const AlwaysStoppedAnimation(320 / 360),
            child: Icon(
              Icons.nightlight_round_outlined,
              color: MyColors.textColor(),
              size: 28,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: MyColors.backgroundColor(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const Spacer(),
            const SizedBox(
              height: 80,
              width: 80,
            ),
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
                    style: Style.headerTxtStyle(
                      txtColor: MyColors.textColor(),
                    ),
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
                      style: Style.bodyTxtStyle(
                        txtColor: MyColors.textColor(
                          lightThemeClr: MyColors.lightactionColor,
                          darkThemeClr: MyColors.darkactionColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyTextFormField(
                      leadingIcon: Icons.alternate_email_rounded,
                      obscureText: false,
                      hintText: 'Email',
                      node: _emailfocusNode,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => _passwordfocusNode.nextFocus(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                      leadingIcon: Icons.password,
                      obscureText: true,
                      hintText: 'password',
                      suffix: true,
                      node: _passwordfocusNode,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () => _passwordfocusNode.unfocus(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * 0.05, vertical: 20),
              child: Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        if (!rememberMe) {
                          rememberMe = true;
                        } else {
                          rememberMe = false;
                        }
                      });
                    },
                  ),
                  Text(
                    "Remember me?",
                    style: Style.bodyTxtStyle(
                      txtColor: MyColors.textColor(),
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password?",
                      style: Style.bodyTxtStyle(
                        txtColor: MyColors.textColor(
                          lightThemeClr: MyColors.lightactionColor,
                          darkThemeClr: MyColors.darkactionColor,
                        ),
                      ),
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
                          color: MyColors.textColor(
                            lightThemeClr: MyColors.lighttxtClr,
                            darkThemeClr: MyColors.darktxtClr,
                          ),
                        ),
                        onPressed: () {},
                        bgClr: MyColors.textColor(
                          lightThemeClr: MyColors.lightactionColor,
                          darkThemeClr: MyColors.darkactionColor,
                        ),
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
