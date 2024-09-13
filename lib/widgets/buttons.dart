import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term_1_reflection/assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/gestures.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool outline;
  final void Function()? onPressed;
  const MyButton({
    super.key,
    required this.text,
    this.outline = false,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: outline ? Colors.transparent : colors.dark,
          border: Border.all(color: colors.dark),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: outline ? colors.dark : colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Navigator.pop(context),
      padding: EdgeInsets.zero,
      child: Container(
        width: 41,
        height: 41,
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors().border),
        ),
        child: Center(
          child: SvgPicture.asset(IconsPaths().backArrowIcon),
        ),
      ),
    );
  }
}

class AccountInfo extends StatelessWidget {
  final String text1;
  final String text2;
  final Function()? onTap;

  const AccountInfo({
    super.key,
    required this.text1,
    this.onTap,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium,
          children: <TextSpan>[
            TextSpan(text: "$text1\t"),
            TextSpan(
              text: text2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
