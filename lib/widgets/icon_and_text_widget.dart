import 'package:flutter/cupertino.dart';
import 'package:mydelivery/utils/dimension.dart';
import 'package:mydelivery/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData iconData;
  final String string;
  final Color iconColor;
  const IconAndTextWidget({
    super.key,
    required this.iconData,
    required this.string,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: iconColor, size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: string),
      ],
    );
  }
}
