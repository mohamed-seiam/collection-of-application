
abstract class SocialregisterState {}

class SocialregisterInitialState extends SocialregisterState {}

class SocialregisterLoadingState extends SocialregisterState {}

class SocialregisterSuccessState extends SocialregisterState {}

class SocialregisterErrorState extends SocialregisterState {
  final String error;

  SocialregisterErrorState(this.error);
}

class SocialRegisterPasswordVisibalityState extends SocialregisterState {}
