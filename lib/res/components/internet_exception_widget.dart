import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/res/colors/app_colors.dart';

class InternetExceptionWidget extends StatefulWidget {
  final onPress;

  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * .15),
        Icon(Icons.cloud_off, color: AppColor.redColor, size: 50),
        Center(
          child: Text(
            'internet_exception'.tr,
            style: TextStyle(color: AppColor.primaryTextColor),
          ),
        ),
        SizedBox(height: height * .05),
        InkWell(
          onTap: widget.onPress,
          child: Container(
            height: 44,
            width: 160,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Text(
              'Retry',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
