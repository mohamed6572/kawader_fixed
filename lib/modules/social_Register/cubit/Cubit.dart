
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/models/user_model.dart';
import 'package:kwader/modules/social_Register/cubit/States.dart';
import 'package:kwader/shared/components/components.dart';

import '../../otp/otp_screen.dart';
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
String? virfyId;
String? pin;
  void userRegister({
    required String name,
required context,
    required String phone,
    required String password,
  }) async{
    // emit(RegisterLodingState());
  try  {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${phone}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          navigateTo(context, OTP());
          virfyId=  verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      print(phone);
    }catch(e){
    print(e.toString());
  }

    // FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(email: phone, password: password)
    //     .then((value) {
    //       print ('when create user id= ${value.user!.uid}');
    //   createUser(
    //     uId: value.user!.uid,
    //     name: name,
    //     phone: phone,
    //
    //   );
    //
    // }
    // ).catchError((error) {
    //   emit(RegisterErerorState(error.toString()));
    //
    // });
  }
  void createUser({
    required String name,
    required String phone,
    required String uId,

  }) {
    UserModel model =
        UserModel(name: name, phone: phone, uId: uId,
        );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
          emit(CreateUserSucseslState());
    })
        .catchError((error) {
          emit(CreateUserErerorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;
CountryCode? countryCode;
  void ChangePasswordVisibilty() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(RegisterChangePasswordVisibiltyState());
  }
}
