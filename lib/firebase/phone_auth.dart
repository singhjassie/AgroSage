import 'package:agrosage/firebase/auth_provider.dart';
import 'package:agrosage/screens/otp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Phone_auth extends StatefulWidget {
  const Phone_auth({super.key});

  @override
  State<Phone_auth> createState() => _Phone_authState();
}

class _Phone_authState extends State<Phone_auth> {

  final TextEditingController phoneController=TextEditingController();
  Country selectedCountry =Country(
    phoneCode: "91",
    countryCode: "IN", 
    e164Sc: 0, 
    geographic: true, 
    level: 1, 
    name: "India", 
    example: "India", 
    displayName:"India", 
    displayNameNoCountryCode: "IN",
    e164Key: "");

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(TextPosition(offset: phoneController.text.length));
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30,horizontal: 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
               Container(
                padding: EdgeInsets.all(10),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.greenAccent.shade100
                  
                ),
                child: Image.asset("Assets/auth-removebg-preview (1).png",),
                
               ),
               SizedBox(height: 20,),
               Text("Register your Phone number ",style: TextStyle(
                  color: Color(0xffb488047),
                  fontSize: 22, 
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10,),
               Text("Add your phone number, we'll send you a  verification code ",style: TextStyle(
                  color: const Color.fromARGB(255, 107, 106, 106),
                  fontSize: 15, 
                 
                ),
                textAlign: TextAlign.center,),
                 SizedBox(height: 30,) ,
               TextFormField(
                        controller: phoneController,
                        onChanged: (value){
                          setState(() {
                            phoneController.text = value;
                          });
                        },
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          
                          filled: true,
                          fillColor:Color.fromARGB(248, 146, 190, 135) ,
                          label: const Text("Phone Number"),
                          hintText: 'Enter Phone Number',
                          hintStyle: TextStyle(
                            color: Color(0xffb225A21),
                            fontWeight: FontWeight.w500
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                             color: Color.fromARGB(248, 146, 190, 135) ,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                               color: Color.fromARGB(248, 146, 190, 135) ,
                            ),
                             borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                              onTap: (){
                                showCountryPicker(context: context,
                                 countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: 550
                                 ),
                                 onSelect: (value){
                                  setState(() {
                                    selectedCountry=value;
                                  });
                                });
                              },
                              child: Text("${selectedCountry.flagEmoji}  +${selectedCountry.phoneCode}",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                            color: Color(0xffb225A21)),)
                            ),
                          ),
                          suffixIcon: phoneController.text.length > 9?
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 30,width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                            child: Icon(Icons.done,
                            color: Color(0xffb225A21),
                            size: 20,),
                          ):null
                        ), ),
                     SizedBox(height: 30,) ,
                     SizedBox(
                      width:285,
                      height: 50,
                       child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffb488047),
                          shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))
                        ),
                         onPressed: () async {
                    // Call verifyPhoneNumber when the button is pressed
                    await sendVerificationCode();
                  },
                       child: Text("Send code",style: TextStyle(color: Colors.white,fontSize: 20),)),
                     ),
              ],
            ),
          ),
        ),
      ),
   
    );
  }

 Future<void> sendVerificationCode() async {
  try {
    // Get the user's entered phone number
    String phoneNumber = '+${selectedCountry.phoneCode}${phoneController.text.trim()}';
    
    // Save the phone number to Firebase or perform any necessary operations
    // For simplicity, let's assume you're using Firestore
    await FirebaseFirestore.instance.collection('phone_numbers').add({
      'number': phoneNumber,
    });

    // Initiate OTP verification and send SMS
    await FirebaseAuth.instance.verifyPhoneNumber(
      // Provide appropriate callbacks
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Handle automatic verification
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Navigate to OTP screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationId: verificationId),
          ),
        );
        
        // Optionally, you can automatically submit the code for verification
        // Uncomment the following lines if you want to automatically submit the code
        // and complete the verification process
        // String smsCode = await yourMethodToRetrieveSMSCode();
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        // await FirebaseAuth.instance.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout if needed
      },
      timeout: Duration(seconds: 60), // Adjust the timeout duration as needed
      // codeAutoRetrievalTimeout: (String verificationId) {
      //   // Handle auto retrieval timeout
      // },
    );
  } catch (e) {
    // Handle any other errors
    print("Error sending verification code: $e");
  }
}


}
  // void sendPhoneNumber (){
  //   final ap = Provider.of<AuthProvider>(context,listen: false);
  //   String phoneNumber = phoneController.text.trim();
  //   ap.signInWithPhone( context, "+ ${selectedCountry.phoneCode}$phoneNumber");
  // }
  // void  sendPhoneNumber(){
  //   FirebaseAuth.instance.verifyPhoneNumber(
  //     verificationCompleted: (PhoneAuthCredential credential){}, 
  //     verificationFailed: (FirebaseException ex){}, 
  //     codeSent: (String verificationid , int ? Resendtoken){}, 
  //     codeAutoRetrievalTimeout: (String verificationid ){},phoneNumber: phoneController.text.toString());
  // }
