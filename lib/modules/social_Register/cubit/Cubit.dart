
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/models/user_model.dart';
import 'package:kwader/modules/social_Register/cubit/States.dart';
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String phone,
    required String password,
  }) {
    emit(RegisterLodingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: phone, password: password)
        .then((value) {
          print ('when create user id= ${value.user!.uid}');
      createUser(
        uId: value.user!.uid,
        name: name,
        phone: phone,

      );

    }).catchError((error) {
      emit(RegisterErerorState(error.toString()));
      
    });
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

  void ChangePasswordVisibilty() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(RegisterChangePasswordVisibiltyState());
  }
}
