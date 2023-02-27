// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/layout/news_app/cubit/states.dart';
import 'package:messanger/modules/business_screen/business_screen.dart';
import 'package:messanger/modules/science_screen/science_screen.dart';
import 'package:messanger/modules/settings_screen/setting_screen.dart';
import 'package:messanger/modules/sports_screen/sports_screen.dart';
import 'package:messanger/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>
{
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) =>BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> bottomitem =
  [
    BottomNavigationBarItem(
        icon:Icon(Icons.business_center_outlined),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.science_outlined),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.settings),
      label: 'Setting',
    ),
  ];

  List<Widget> screens =
  [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    SettingScreen()
  ];

  void changeBottomnavNews(int index)
  {
    currentindex = index;
    if(index==1)
    {
      getScienceData();
    }
    if(index==2)
    {
      getSportsData();
    }
    emit(BottomNavChange());
  }

  List<dynamic> business = [];

  void getBusinessData()
  {
    emit(BussinessLoadingState());
      Diohelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country':'eg',
            'category':'business',
            'apikey':'516f95ceb7ae46b9a1f105cfdfd17313'
          },
      ).then((value)
      {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(BussinessSuccessState());
      }).catchError((error)
      {
        print(error.toString());

        emit(BussinessErroeState(error.toString()));
      });
  }

  List<dynamic> sports = [];

  void getSportsData()
  {
    emit(SportsLoadingState());
    if(sports.isEmpty)
    {
      Diohelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apikey':'516f95ceb7ae46b9a1f105cfdfd17313'
        },
      ).then((value)
      {
        sports = value.data['articles'];

        emit(SportsSuccessState());
      }).catchError((error)
      {
        print(error.toString());

        emit(SportsErroeState(error));
      });
    }else
    {
      emit(SportsSuccessState());
    }

  }

  List<dynamic> science = [];

  void getScienceData()
  {
    emit(ScienceLoadingState());
    if(science.isEmpty)
    {
      Diohelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apikey':'516f95ceb7ae46b9a1f105cfdfd17313'
        },
      ).then((value)
      {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(ScienceSuccessState());
      }).catchError((error)
      {
        print(error.toString());

        emit(ScienceErroeState(error.toString()));
      });
    }else
    {
      emit(ScienceSuccessState());
    }


  }


  List<dynamic> search = [];

  void getSearchData( String value)
  {
    emit(SearchLoadingState());
    Diohelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':value,
        'apikey':'516f95ceb7ae46b9a1f105cfdfd17313'
      },
    ).then((value)
    {
      search = value.data['articles'];
      print(science[0]['title']);
      emit(SearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());

      emit(SearchErroeState(error.toString()));
  });
    }
}