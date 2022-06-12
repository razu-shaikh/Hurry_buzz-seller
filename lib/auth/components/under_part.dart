import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class UnderPart extends StatelessWidget {
  const UnderPart(
      {Key? key,
        required this.title,
        required this.navigatorText,
        required this.onTap})
      : super(key: key);
  final String title;
  final String navigatorText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            navigatorText,
            style: GoogleFonts.besley(
                color: Colors.black54,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
            ),
          ),
        )
      ],
    );
  }
}