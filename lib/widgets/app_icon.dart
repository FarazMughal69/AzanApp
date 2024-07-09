import '../constant_folder/utility_export.dart';
import '../main.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    // print('build');
    return SizedBox(
      height: mq.height * 0.11,
      width: mq.width * 0.6,
      child: Image.asset(
        'assets/images/religion.png',
        color: MyColors.textColor(),
      ),
    );
  }
}
