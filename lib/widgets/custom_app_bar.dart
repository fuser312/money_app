import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomAppBar extends StatelessWidget {
  final bool? isHome;
  CustomAppBar({this.isHome = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Text('MoneyApp', style: Theme.of(context).textTheme.bodyText1,),
          isHome!
              ? SizedBox()
              : GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
        ],
      ),
    );
  }
}
