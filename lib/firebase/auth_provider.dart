

import 'dart:convert';
import 'dart:io';

import 'package:agrosage/screens/otp_screen.dart';
import 'package:agrosage/firebase/user_model.dart';
import 'package:agrosage/firebase/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider  extends ChangeNotifier{

  bool _isSignedIn = false;
  bool get isSignedIn=> _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String ? _uid ;
  String get uid => _uid!;
  UserModel ? _userModel;
  UserModel get userModel => _userModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage= FirebaseStorage.instance;

  AuthProvider(){
    checkSignIn();
  }
  
  void checkSignIn() async{
    final SharedPreferences  s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin")?? false;
    notifyListeners();
  }

  Future setSignIn()async{
    final SharedPreferences  s = await SharedPreferences.getInstance();
    s.setBool("_isSignedIn", true);
    _isSignedIn = true;
    notifyListeners();
  }
  //signIn
  void signInWithPhone(BuildContext  context , String phoneNumber) async{
    try{
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        }, 
        verificationFailed: (error){
          throw Exception(error.message);
        }, 
        codeSent: ((verificationId, forceResendingToken) {
         Navigator.push(
                          context,
                          MaterialPageRoute
                          (
                          builder:(context) => OtpScreen( verificationId: verificationId,),
                        ));
        }), 
        codeAutoRetrievalTimeout: (verificationId) {});
    } 
    on FirebaseAuthException catch(e){
      showSnackbar(context, e.message.toString());
    }
    
  }

//verifyOTP
  void verifyOtp({
     required BuildContext context,
     required String verificationId,
     required String userOtp,
     required Function onSuccess
   }) async{
      _isLoading = true;
      notifyListeners();
      try{

         PhoneAuthCredential creds = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOtp);
        User ? user = (await _firebaseAuth.signInWithCredential(creds)).user!;
        if (user !=null){
          _uid=user.uid;
          onSuccess();
        }
        _isLoading = false;
        notifyListeners();

      } 
      on FirebaseAuthException catch(e){
        showSnackbar(context, e.message.toString());
         _isLoading = false;
        notifyListeners();
      }

  }
  //database operation
 Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      print("USER EXISTS");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }

Future<void> loginUser(data, context) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
     
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }


void saveUserDataToFirebase({
  required BuildContext context,
  required UserModel userModel,
  required Function onSuccess,
}) async {
  _isLoading = true;
  notifyListeners();
  try {
    // Set the createdAt, phoneNumber, and uid fields
    userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
    userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
    userModel.uid = _firebaseAuth.currentUser!.uid;

    // Set the email, password, and username fields from user input
    userModel.email = userModel.email; // You may need to adjust this based on your UserModel class
    userModel.password = userModel.password; // You may need to adjust this based on your UserModel class
    userModel.username = userModel.username; // You may need to adjust this based on your UserModel class

    // Initialize _userModel if it's null
    _userModel ??= UserModel(); // You may need to adjust this initialization based on your UserModel class

    _userModel = userModel;
    await _firebaseFirestore
        .collection("users")
        .doc(_uid)
        .set(userModel.toMap())
        .then((_) {
      onSuccess();
      _isLoading = false;
      notifyListeners();
    });
  } on FirebaseAuthException catch (e) {
    showSnackbar(context, e.message.toString());
    _isLoading = false;
    notifyListeners();
  }
}



Future saveUserDataToSP()async{
  SharedPreferences s = await SharedPreferences.getInstance();
  await s.setString("user_model", jsonEncode(userModel.toMap()));
  }


 Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        username: snapshot['username'],
        email: snapshot['email'],
        createdAt: snapshot['createdAt'],
        uid: snapshot['uid'],
        phoneNumber: snapshot['phoneNumber'],
      );
      _uid = userModel.uid;
    });
  }


Future<String> uploadFile(File selectedFile) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('files')
        .child(selectedFile.path.split('/').last);
    try {
      var uploadTask = await ref.putFile(selectedFile);
      var downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

}