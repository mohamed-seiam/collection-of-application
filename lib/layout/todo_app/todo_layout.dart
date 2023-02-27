// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:messanger/shared/component/component.dart';
import 'package:messanger/shared/component/constance.dart';
import 'package:messanger/shared/cubit/appcubit.dart';
import 'package:messanger/shared/cubit/appstates.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatelessWidget
{
  var titeController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child:BlocConsumer<AppCubit,AppStates>(
        listener: (context,state)
        {
          if(state is AppInsertDataBaseState)
          {
            Navigator.pop(context);
          }
        },
        builder: (context,state)
        {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.Titles[cubit.currentindex],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                if(cubit.isShown)
                {
                  cubit.insertDatbase(
                      title:titeController.text,
                      time:timeController.text,
                      date: dateController.text,
                  );
                  // insertDatbase(
                  //   title: titeController.text,
                  //   time: timeController.text,
                  //   date: dateController.text,
                  // ).then((value)
                  // {
                  //   Navigator.pop(context);
                  //   isShown = false;
                  //   // setState(() {
                  //   //   fabIcon = Icons.edit;
                  //   // });
                  // });
                }
                else
                {
                  scaffoldKey.currentState?.showBottomSheet((context) =>
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.grey[200],
                        ),
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultformfield(
                                controller:titeController,
                                type: TextInputType.text,
                                // onTap: ()
                                // {
                                //   titeController.text=titeController.;
                                // },
                                label: 'Title',
                                validate:(value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Title must not be empty';
                                  }
                                  return '';
                                },
                                icon: Icons.title,
                              ),
                              SizedBox(height: 15.0,),
                              defaultformfield(
                                controller:timeController,
                                type: TextInputType.datetime,
                                label: 'Time',
                                onTap: ()
                                {
                                  showTimePicker(context: context,
                                    initialTime:TimeOfDay.now(),
                                  ).then((value)
                                  {
                                    timeController.text = value!.format(context);
                                  });
                                },
                                validate:(value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Time must not be empty';
                                  }
                                  return '';
                                },
                                icon: Icons.watch_later_outlined,
                              ),
                              SizedBox(height: 15.0,),
                              defaultformfield(
                                controller:dateController,
                                type: TextInputType.datetime,
                                label: 'Time',
                                onTap: ()
                                {
                                  showDatePicker(
                                    context: context,
                                    initialDate:DateTime.now(),
                                    firstDate:DateTime.now(),
                                    lastDate:DateTime.parse('2023-12-01'),
                                  ).then((value)
                                  {
                                    dateController.text = DateFormat.yMMMd().format(value!);
                                  });
                                },
                                validate:(value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Date must not be empty';
                                  }
                                  return '';
                                },
                                icon: Icons.calendar_month,
                              ),
                            ],
                          ),
                        ),
                      ),
                    elevation: 20.0,
                  ).closed.then((value)
                  {
                    cubit.changeBottomSheet(isBottomShown: false, icon:Icons.edit);
                  });
                 cubit.changeBottomSheet(isBottomShown:true, icon:Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.currentindex,
              onTap: (index)
              {
                cubit.changeBotomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon:Icon(Icons.menu),
                  label:'Tasks',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.done),
                  label:'Done',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.archive),
                  label:'Archive',
                ),
              ],
            ),
            body:ConditionalBuilder(
              condition:state is! AppCreateDataBaseLoadingState,
              builder:(context)=> cubit.scrrens[cubit.currentindex],
              fallback:(context)=> Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }

}


