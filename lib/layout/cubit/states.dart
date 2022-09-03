abstract class AppStates {}

class AppinitialState extends AppStates {}

class AppGetUserLoadingState extends AppStates {}

class AppGetUserSucsesState extends AppStates {}

class getSliderImageLoadingState extends AppStates {}
class getSliderImageSucsesState extends AppStates {}
class getSliderImageErrorState extends AppStates {}

class AppGetUserErrorState extends AppStates {
  final String error;

  AppGetUserErrorState(this.error);
}

class AppChangeBottomNavState extends AppStates {}

class AppNewPostState extends AppStates {}

class AppProfileImagePickedSuccsessState extends AppStates {}
class AppProfileImagePickedErrorState extends AppStates {}

class AppCoverImagePickedSuccsessState extends AppStates {}
class AppCoverImagePickedErrorState extends AppStates {}


class AppUploadProfileImageSuccsessState extends AppStates {}
class AppUploadProfileImageErrorState extends AppStates {}


class AppUploadCoverImageSuccsessState extends AppStates {}
class AppUploadCoverImageErrorState extends AppStates {}

class AppuserUpdateErrorState extends AppStates {}
class AppuserUpdateLoadingState extends AppStates {}

class AppCreatePostLoadingState extends AppStates {}
class AppCreatePostSuccsesState extends AppStates {}
class AppCreatePostErrorState extends AppStates {}


class AppPostImagePickedSuccsessState extends AppStates {}
class AppPostImagePickedErrorState extends AppStates {}

class AppRemovePostImageState extends AppStates {}


class AppgetPostLoadingState extends AppStates {}

class AppgetPostSucsesState extends AppStates {}
class AppgetPosttSucsesState extends AppStates {}

class AppgetPostErrorState extends AppStates {
  final String error;

  AppgetPostErrorState(this.error);
}
///////client
class AppCreateclientLoadingState extends AppStates {}
class AppCreateclientSuccsesState extends AppStates {}
class AppCreateclientErrorState extends AppStates {}


class AppclientImagePickedSuccsessState extends AppStates {}
class AppclientImagePickedErrorState extends AppStates {}

class AppRemoveclientImageState extends AppStates {}


class AppgetclientLoadingState extends AppStates {}

class AppgetclientSucsesState extends AppStates {}
class AppgetclienttSucsesState extends AppStates {}

class AppgetclientErrorState extends AppStates {
  final String error;

  AppgetclientErrorState(this.error);
}

class AppdeletepostSucssesState extends AppStates {}







