import 'package:flutter/material.dart';

class MyTextController extends TextEditingController {
  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    List<InlineSpan> children = [];
    if(text.contains('.')){
      children.add(TextSpan(style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(
          fontSize: 40, fontWeight: FontWeight.bold), text: text.substring(0, text.indexOf('.'))));
      children.add(TextSpan(text: '.'));

      if(text.length > text.indexOf('.')) {
        children.add(TextSpan(text: text.substring(text.indexOf('.') + 1, text.length), style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24, fontWeight: FontWeight.bold)));
      }
    } else {
      children.add(TextSpan(style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(
          fontSize: 40, fontWeight: FontWeight.bold), text: text));
    }
    return TextSpan(style: style, children: children);
  }
}