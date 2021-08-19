import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class KeyPad extends StatelessWidget {
  final double buttonSize = 60.0;
  final TextEditingController amountController;
  final Function onChange;

  KeyPad({
    required this.onChange,
    required this.amountController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buttonWidget('.'),
              buttonWidget('0'),
              iconButtonWidget(Icons.arrow_back_ios, () {
                if (amountController.text.length > 0) {
                  amountController.text = amountController.text
                      .substring(0, amountController.text.length - 1);
                }
                if (amountController.text.length > 5) {
                  amountController.text = amountController.text.substring(0, 5);
                }
                onChange(amountController.text);
              }),

            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText) {
    return TextButton(
      onPressed: () {
        if (amountController.text.length <= 5) {
          amountController.text = amountController.text + buttonText;
          onChange(amountController.text);
        }
      },
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xfffefefe)),
        ),
      ),
    );
  }

  iconButtonWidget(IconData icon, Callback function) {
    return InkWell(
      onTap: function,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
