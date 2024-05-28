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
  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = mq.width * 0.11;
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
            value: dark,
            onChanged: (bool value) {
              setState(
                () {
                  dark = value;
                },
              );
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
            SizedBox(
              height: mq.height * 0.11,
              width: mq.width * 0.6,
              child: Image.asset(
                'assets/images/religion.png',
                color: MyColors.textColor(),
              ),
            ),
            // const Spacer(),
            const SizedBox(
              height: 80,
              width: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
                    onPressed: () {},
                    child: Text(
                      'SignUp?',
                      style: Style.bodyTxtStyle(
                        txtColor: MyColors.textColor(
                          darkmodeClr: MyColors.darkactionColor,
                          lightModeClr: MyColors.lightactionColor,
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyTextFormField(),
                    MyTextFormField(),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CircularButton(
                          image: Image.asset('assets/images/google.png'),
                          onPressed: () {},
                        ),
                        CircularButton(
                          image: Image.asset('assets/images/facebook.png'),
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
                              darkmodeClr: MyColors.lightModtxtClr,
                              lightModeClr: MyColors.darkModtxtClr,
                            ),
                          ),
                          onPressed: () {},
                          bgClr: MyColors.textColor(
                              darkmodeClr: MyColors.darkactionColor,
                              lightModeClr: MyColors.lightactionColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
