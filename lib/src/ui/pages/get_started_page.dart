import 'package:dicoding/src/shared/theme.dart';
import 'package:dicoding/src/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: size.width / 1.2,
              height: size.height / 2.4,
              margin: EdgeInsets.only(bottom: defaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/image2.jpg',
                  ),
                ),
              ),
            ),
            Text(
              'Make History In a New\nDigital World',
              style: whiteTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'The techniques of digital art are used by the \nmainstream media in advertisments.',
              style: whiteTextStyle.copyWith(
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'Sign Up',
              width: size.width / 1.2,
              bgColor: kPrimaryColor,
              textStyle: whiteTextStyle,
              margin: const EdgeInsets.only(
                top: 48,
                bottom: 8,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
            ),
            CustomButton(
              title: 'Sign In',
              width: size.width / 1.2,
              borderColor: kWhiteColor,
              textStyle: whiteTextStyle,
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 48,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
            ),
          ],
        ),
      ),
    );
  }
}
