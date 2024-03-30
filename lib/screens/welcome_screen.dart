import 'package:agrosage/screens/login_screen.dart';
import 'package:agrosage/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  
       Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         decoration: const BoxDecoration(
           image: DecorationImage(
           fit: BoxFit.fill,
           image: AssetImage("assets/images/leaf_image.png")
    ),
  ),
     child: Scaffold(
      backgroundColor: Colors.transparent,
       body: Column(
         children: [
         const SizedBox(height: 50,),
           Container(
            margin: const EdgeInsets.all(25),
             child: Text(
              "Grow your Knowledge ,  Grow your Crops",style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 50,fontWeight: FontWeight.bold),),
           ),
           const SizedBox(height: 200,),
           SizedBox(
            width: 220,
            height: 45,
             child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white38,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
              }, child: const Text("Login",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),)),
           ),
           TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp(),));
           }, child: const Text("Create an account",style: TextStyle(color: Colors.white,fontSize: 18),))
         ],
       ),
       ),
);
    
  }
}