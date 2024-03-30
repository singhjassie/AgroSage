import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications"),),
      body: Container(
        child:  Column(
          children: [
            Row(
              children: [
                CircleAvatar(),
                Column(
                  children: [
                    Text("Heading",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Discription",style: TextStyle(fontSize: 10),),
                    Divider(
                     
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                CircleAvatar(),
                Column(
                  children: [
                    Text("Heading",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Discription",style: TextStyle(fontSize: 10),),
                    Divider(  ),
                  ],
                )
              ],
            ),
        ],),
      ),
    );
  }
}