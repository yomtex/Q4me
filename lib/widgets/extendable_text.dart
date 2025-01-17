import 'package:flutter/material.dart';
import 'package:mydelivery/utils/colors.dart';
import 'package:mydelivery/utils/dimension.dart';
import 'package:mydelivery/widgets/small_text.dart';

class ExtendbleText extends StatefulWidget {
  final String text;
  const ExtendbleText({super.key, required this.text});

  @override
  State<ExtendbleText> createState() => _ExtendbleTextState();
}

class _ExtendbleTextState extends State<ExtendbleText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf, size: Dimensions.font16, color: AppColors.paraColor)
          : Column(
              children: [
                SmallText(
                    text: hiddenText
                        ? ("$firstHalf...")
                        : firstHalf + secondHalf,height: 1.8, size: Dimensions.font16, color: AppColors.paraColor,),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText =!hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText?"Show more":"Show less",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
