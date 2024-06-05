import 'package:azan/widgets/txt_formfield.dart';

import '../../../constant_folder/utility_export.dart';
// import '../../login/ui/login_screen.dart';

class MySignUpScrren extends StatelessWidget {
  const MySignUpScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(),
      body: const Column(
        children: [
          MyTextFormField(
            leadingIcon: Icons.person,
            obscureText: false,
            hintText: "Full Name",
          ),
          MyTextFormField(
            leadingIcon: Icons.alternate_email_outlined,
            obscureText: false,
            hintText: "Email",
          ),
          MyTextFormField(
            leadingIcon: Icons.lock_outline_sharp,
            obscureText: true,
            hintText: "Password",
          ),
          MyTextFormField(
            leadingIcon: Icons.lock_outline_sharp,
            obscureText: true,
            hintText: "Confirm Password",
          ),
        ],
      ),
    );
  }
}
