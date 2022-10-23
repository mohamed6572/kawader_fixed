import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/models/add_model.dart';
import 'package:kwader/models/slider_model.dart';
import 'package:kwader/models/user_model.dart';
import 'package:kwader/modules/chose_post/chosePosts.dart';
import 'package:kwader/modules/home/ProductsScrean.dart';
import 'package:kwader/modules/settings/Settings.dart';
import 'package:kwader/shared/components/constens.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppinitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  SliderModel? sliderModel;
List<SliderModel> slider= [];
  void getSilderImage() {
    emit(getSliderImageLoadingState());
    FirebaseFirestore.instance.collection('slider').get().then((value) {
      value.docs.forEach((element) {
              slider.add(SliderModel.fromJson(element.data()));
           });
      emit(getSliderImageSucsesState());
    }).catchError((e){
      print(e);
emit(getSliderImageErrorState());
    });

  }
  UserModel? userModel;

  void getUserData() {
    emit(AppGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uIdd).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      print(userModel?.name);
      print(userModel?.uId);
      print(userModel?.phone);
      emit(AppGetUserSucsesState());
    }).catchError((error) {
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  List<Widget> Screans = [
    ProductsScrean(),
    ChosePosts(),
    App_Settings(),
  ];
  List<String> titles = [
    'الرئيسية',
    'اضافه اعلان',
    'الاعدادات',
  ];
// ////////office
  var picker = ImagePicker();
  File? postofficeImage;

  void RemovePostofficeImage() {
    postofficeImage = null;
    emit(AppRemovePostImageState());
  }

  Future<void> getPostofficeImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postofficeImage = File(pickedFile.path);
      emit(AppPostImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(AppPostImagePickedErrorState());
    }
  }

  /////////////////////
  void UploadPostofficeImage({
    required String dateTime,
    required String title,
    required String descreption,
    required String price,
  }) {
    emit(AppCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postofficeImage?.path ?? '').pathSegments.last}')
        .putFile(postofficeImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPostOffice(title: title,description: descreption, dateTime: dateTime, Postimage: value,price: price);
      }).catchError((error) {
        emit(AppCreatePostErrorState());
      });
    }).catchError((error) {
      emit(AppCreatePostErrorState());
    });
  }

  void createPostOffice({
    required String dateTime,
    required String title,
    required String description,
    required String price,
    String? Postimage,
  }) {
    addModel model = addModel(
      uId: userModel?.uId,
      price: price,
      decrepthion: description,
      image:  Postimage ?? '',
      title: title,
      dateTime: dateTime,
    );

    FirebaseFirestore.instance
        .collection('posts').doc().set(model.toJson())
        .then((value) {
      emit(AppCreatePostSuccsesState());
    }).catchError((error) {
      emit(AppCreatePostErrorState());
    });
  }

  ////////////////////////
  List<addModel> posts = [];

  void getofficeposts() {
    FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
      posts = [];

      event.docs.forEach((element) {
        posts.add(addModel.fromJson(element.data()));
        print('usermodel == ${userModel?.uId}');

        // if(uId == userId?.uId){
        //   postsUser.add(addModel.fromJson(element.data()));
        //   print(postsUser.length);
        // }
        emit(AppgetPostSucsesState());
      });

    });
  }
  List<addModel> postsUser = [];

  void getpas()async{
    FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
      postsUser = [];
      event.docs.forEach((element) {
       String a= element.get('uId');
       if(a==uIdd) {
          postsUser.add(addModel.fromJson(element.data()));
          emit(AppgetPosttSucsesState());

       }else{
         return null;
       }

      });

    });

  }
///////////////////clint


  var picker1 = ImagePicker();
  File? postClientImage;

  void RemovePostClientImage() {
    postClientImage = null;
    emit(AppRemoveclientImageState());
  }

  Future<void> getPostClientImage() async {
    final pickedFile1 = await picker1.pickImage(source: ImageSource.gallery);
    if (pickedFile1 != null) {
      postClientImage = File(pickedFile1.path);
      emit(AppclientImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(AppclientImagePickedErrorState());
    }
  }

  /////////////////////
  void UploadPostClientImage({
    required String dateTime,
    required String title,
    required String description,
    required String price,
  }) {
    emit(AppCreateclientLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('client/${Uri.file(postClientImage?.path ?? '').pathSegments.last}')
        .putFile(postClientImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPostClient(title: title,description: description, dateTime: dateTime, Postimage: value,price: price);
      }).catchError((error) {
        emit(AppCreateclientErrorState());
      });
    }).catchError((error) {
      emit(AppCreateclientErrorState());
    });
  }

  void createPostClient({
    required String dateTime,
    required String title,
    required String description,
    required String price,
    String? Postimage,
  }) {
    addModel model = addModel(
      uId: userModel?.uId,
      price: price,
      decrepthion: description,
      image:  Postimage ?? '',
      title: title,
      dateTime: dateTime,
    );

    FirebaseFirestore.instance
        .collection('client')
        .doc().set(model.toJson())
        .then((value) {
      emit(AppCreateclientSuccsesState());
    }).catchError((error) {
      emit(AppCreateclientErrorState());
    });
  }

  ////////////////////////
  List<addModel> clients = [];
  void getClientposts() {
    FirebaseFirestore.instance.collection('client').snapshots().listen((event) {
      clients = [];
      event.docs.forEach((element) {
        clients.add(addModel.fromJson(element.data()));
        print('usermodel == ${userModel?.uId}');
        //

        // if(uId == userId?.uId){
        //   postsUser.add(addModel.fromJson(element.data()));
        //   print(postsUser.length);
        // }
        emit(AppgetclientSucsesState());
      });

    });
  }
  // void delete()async{
  //   FirebaseFirestore.instance.collection('posts').doc().delete().then((value) {
  //     emit(AppdeletepostSucssesState());
  //
  //   });
  // }

  List<addModel> clientsUser = [];

  void getcli()async{
    FirebaseFirestore.instance.collection('client').snapshots().listen((event) {
      clientsUser = [];
      event.docs.forEach((element) {
        String a= element.get('uId');
        if(a==uIdd) {
          clientsUser.add(addModel.fromJson(element.data()));
          emit(AppgetclienttSucsesState());

        }else{
          return null;
        }

      });

    });

  }

  int CurrentIndex = 0;
void backtohome(){

    CurrentIndex = 0;
    emit(AppChangeBottomNavState());

}
  void ChangeIndex(index) {
    // if(index == 0)getAllUsers();
    // if (index == 1)
    //   emit(AppNewPostState());
    // else {
      CurrentIndex = index;
      emit(AppChangeBottomNavState());
   // }
  }
}
