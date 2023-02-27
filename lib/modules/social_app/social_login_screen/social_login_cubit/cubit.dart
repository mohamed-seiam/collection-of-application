// ignore_for_file: unnecessary_import, avoid_print, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/modules/social_app/social_login_screen/social_login_cubit/states.dart';

class SocialLoginCubit extends Cubit<SocialloginState> {
  SocialLoginCubit() : super(SocialloginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  void userloin({
    required String email,
    required String password,
  }) {
    emit(SocialloginLoadingState());

  }

  // IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePassowrdVisibality() {
    isPassword = !isPassword;
    // suffix =
    //     isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopChangePasswordVisibalityState());
  }
}
