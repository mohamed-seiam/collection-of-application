// ignore_for_file: prefer_const_constructors
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/modules/archived_screen/archived_screen.dart';
import 'package:messanger/modules/done_screen/done_screen.dart';
import 'package:messanger/modules/tasks_screen/tasks_screen.dart';
import 'package:messanger/shared/cubit/appstates.dart';
import 'package:messanger/shared/network/local/cach_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentindex=0;
  List<Widget> scrrens =
  [
    TasksScreen(),
    DoneScreen(),
    ArchivedScreen(),
  ];
  List<String>Titles=
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeBotomNav(int index)
  {
    currentindex = index;
    emit(ChangeBottomNavState());
  }

  Database ? database;
  List<Map> ? tasks = [];
  List<Map> ? donetasks = [];
  List<Map> ? archivedtasks = [];
  void createDatabase()
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database,version)
      {
        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value)
        {
          print('table created');
        }).catchError((error)
        {
          print(error.toString());
        });
      },
      onOpen: (database)
      {
        getDataFromDataBse(database);
        print('data base opend');
      },
    ).then((value)
     {
       database = value;
       emit(AppCreateDataBaseState());
     });
  }
   insertDatbase({
    required String title,
    required String time,
    required String date,
  }) async
  {
    await database?.transaction((txn)
    async {
      txn.rawInsert('INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")'
      ).then((value)
      {
        print('$value inserted successfully');
        emit(AppInsertDataBaseState());
        getDataFromDataBse(database);

      }).catchError((error)
      {
        print('error when inserting new record ${error.toString()}');
      });
    });

  }

  void getDataFromDataBse(database)
  {
    tasks = [];
    donetasks = [];
    archivedtasks = [];
    emit(AppCreateDataBaseLoadingState());
     database!.rawQuery('SELECT * FROM tasks').then((value)
     {
       value?.forEach((element) {
         if(element['status']== 'new')
         {
           tasks?.add(element);
         }
         else if (element['status']== 'done')
         {
            donetasks?.add(element);
         }else
         {
           archivedtasks?.add(element);
         }
       });
       emit(AppGetDataBaseState());
     });
  }

  bool isShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheet ({
  required bool isBottomShown,
    required IconData icon,
})
  {
      isShown = isBottomShown;
      fabIcon = icon;
      emit(ChangeBottomSheetState());
  }

  void updateData({
    required String status,
    required int id,
}) async
  {
    database?.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [status, id]).then((value)
    {
      getDataFromDataBse(database);
      emit(AppUbdateDataBaseState());
    });
  }

  void deleteData({
    required int id,
  }) async
  {
    database?.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]).then((value)
    {
      getDataFromDataBse(database);
      emit(AppDeleteDataBaseState());
    });
  }
    ThemeMode appmode = ThemeMode.dark;
   bool isDark = false;
  void changeAppMode({bool ? fromShared}){
    if(fromShared!=null)
    {
      isDark = fromShared;
      emit(AppChangeTHemeMode());
    }
    else
    {
      isDark = !isDark;
      CachHelper.putBool(key: 'isDark', value:isDark);
      emit(AppChangeTHemeMode());
    }

  }
}