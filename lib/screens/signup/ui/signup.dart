import 'package:azan/screens/login/ui/login_screen.dart';
import 'package:azan/widgets/txt_formfield.dart';

import '../../../constant_folder/utility_export.dart';
import '../../../main.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/circular_btn.dart';
// import '../../login/ui/login_screen.dart';

class MySignUpScrren extends StatelessWidget {
  const MySignUpScrren({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode userNameFocusNode = FocusScopeNode();
    final FocusNode passwordFocusNode = FocusScopeNode();
    final FocusNode emailFocusNode = FocusScopeNode();
    final FocusNode confirmPasswordFocusNode = FocusScopeNode();
    final double horizontalPadding = mq.width * 0.11;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.11, horizontal: 0),
                child: const AppLogo(),
              ),
              MyTextFormField(
                leadingIcon: Icons.person,
                obscureText: false,
                hintText: "Full Name",
                node: userNameFocusNode,
                onEditingComplete: () => emailFocusNode.nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextFormField(
                leadingIcon: Icons.alternate_email_outlined,
                obscureText: false,
                hintText: "Email",
                node: emailFocusNode,
                onEditingComplete: () => passwordFocusNode.nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextFormField(
                leadingIcon: Icons.password,
                obscureText: true,
                hintText: "Password",
                suffix: true,
                node: passwordFocusNode,
                onEditingComplete: () => confirmPasswordFocusNode.nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextFormField(
                leadingIcon: Icons.password,
                obscureText: true,
                hintText: "Confirm Password",
                suffix: true,
                node: confirmPasswordFocusNode,
                onEditingComplete: () => confirmPasswordFocusNode.unfocus(),
                textInputAction: TextInputAction.done,
              ),
              // const Spacer(),
              SizedBox(
                height: mq.height * 0.3,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  TextButton(
                    child: Text(
                      'Already User?',
                      style: Style.bodyTxtStyle(
                        fontSize: 18,
                        txtColor: MyColors.textColor(
                          lightThemeClr: MyColors.lightactionColor,
                          darkThemeClr: MyColors.darkactionColor,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MyLoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  CircularButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: MyColors.textColor(
                        lightThemeClr: MyColors.lighttxtClr,
                        darkThemeClr: MyColors.darktxtClr,
                      ),
                    ),
                    bgClr: MyColors.textColor(
                      lightThemeClr: MyColors.lightactionColor,
                      darkThemeClr: MyColors.darkactionColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
