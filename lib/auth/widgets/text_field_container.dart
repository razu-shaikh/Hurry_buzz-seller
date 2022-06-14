import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../constants.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({ Key? key,this.child }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal:20,vertical:2),
      width: size.width *0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}