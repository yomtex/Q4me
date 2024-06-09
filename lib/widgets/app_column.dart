import 'package:flutter/material.dart';
import 'package:mydelivery/utils/colors.dart';
import 'package:mydelivery/utils/dimension.dart';
import 'package:mydelivery/widgets/big_text.dart';
import 'package:mydelivery/widgets/icon_and_text_widget.dart';
import 'package:mydelivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                );
              }),
            ),
            SizedBox(width: 10),
            SmallText(text: "4.7"),
            SizedBox(width: 10),
            SmallText(text: "1287"),
            SizedBox(width: 10),
            SmallText(text: "Comments"),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              iconData: Icons.circle_sharp,
              string: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              iconData: Icons.location_on,
              string: "1.7km",
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidget(
              iconData: Icons.access_time,
              string: "32mins",
              iconColor: AppColors.iconColor2,
            ),
          ],
        )
      ],
    );
  }
}
