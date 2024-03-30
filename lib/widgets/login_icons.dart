import 'package:flutter/material.dart';


class AuthPageLoginIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth / 3 - 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       Container(
          
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          
          decoration:BoxDecoration(
                                color: Colors.white,
                                 boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 1),
                                                blurRadius: 5,
                                                spreadRadius: 3,
                                                color: Color.fromARGB(250, 76, 208, 74)
                                                    .withOpacity(.4),
                                              ),
                                            ],
                                borderRadius: BorderRadius.circular(40),
                              ),
          child: Image.asset(
            "Assets/facebook-f-logo-transparent.png",
            fit: BoxFit.cover,
            height: 40,
            scale: 15,
          ),
        ),
        Container(
          
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          
          decoration:BoxDecoration(
                                color: Colors.white,
                                 boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 1),
                                                blurRadius: 5,
                                                spreadRadius: 3,
                                                color: Color.fromARGB(250, 76, 208, 74)
                                                    .withOpacity(.4),
                                              ),
                                            ],
                                borderRadius: BorderRadius.circular(40),
                              ),
          child: Image.asset(
            "Assets/google.png",
            fit: BoxFit.cover,
            height: 40,
            scale: 15,
          ),
        ),
        Container(
          
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          
          decoration: BoxDecoration(
                                color: Colors.white,
                                 boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 1),
                                                blurRadius: 5,
                                                spreadRadius: 3,
                                                color: Color.fromARGB(250, 76, 208, 74)
                                                    .withOpacity(.4),
                                              ),
                                            ],
                                borderRadius: BorderRadius.circular(40),
                              ),
          child: Image.asset(
            "Assets/apple-removebg-preview.png",
            fit: BoxFit.cover,
            height: 40,
            scale: 15,
          ),
        ),
      ],
    );
  }
}
