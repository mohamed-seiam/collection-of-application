// ignore_for_file: unnecessary_import, avoid_print, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/modules/social_app/social_register/social_register_cubit/states.dart';

class SocialRegisterCubit extends Cubit<SocialregisterState> {
  SocialRegisterCubit() : super(SocialregisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userregister({
    required String ?email,
    required String ?password,
    required String ?name,
    required String ?phone,
  }) {
    emit(SocialregisterLoadingState());
  }

  // IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePassowrdVisibality() {
    isPassword = !isPassword;
    // suffix =
    //     isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialRegisterPasswordVisibalityState());
  }
}
