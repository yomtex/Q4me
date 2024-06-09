
import 'package:flutter/cupertino.dart';
import 'package:mydelivery/utils/dimension.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({super.key,  this.color = const Color(0xFF332d2b),this.size=20, required this.text,  this.overflow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: size==0?Dimensions.font20:size,
      ),
    );
  }
}
