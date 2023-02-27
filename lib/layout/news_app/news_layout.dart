// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/layout/news_app/cubit/cubit.dart';
import 'package:messanger/layout/news_app/cubit/states.dart';
import 'package:messanger/modules/search_screen/search_screen.dart';
import 'package:messanger/shared/component/component.dart';
import 'package:messanger/shared/cubit/appcubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state)
      {
       return Scaffold(
            appBar: AppBar(
              titleSpacing: 20.0,
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(
                  icon: Icon(
                  Icons.search,
            ),
                  onPressed: ()
                  {
                      navigteTo(context,SearchScreen());
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },
                ),
              ],
            ),
            body: NewsCubit.get(context).screens[NewsCubit.get(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              items: NewsCubit.get(context).bottomitem,
              currentIndex: NewsCubit.get(context).currentindex,
              onTap: (index)
                    {
                        NewsCubit.get(context).changeBottomnavNews(index);
                    },
            ),
        );
      },
    );
  }
}
