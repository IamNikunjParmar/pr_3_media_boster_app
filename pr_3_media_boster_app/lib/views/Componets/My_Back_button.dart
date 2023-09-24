import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ()=>
          Navigator.of(context).pop(),
      icon: Icon(
          Icons.arrow_back_ios_new_rounded),
      color:  Color(0xff0B2447),

    );
  }
}
