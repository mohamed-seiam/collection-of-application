// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/layout/news_app/cubit/cubit.dart';
import 'package:messanger/layout/news_app/cubit/states.dart';
import 'package:messanger/shared/component/component.dart';
class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return  BlocConsumer<NewsCubit,NewsState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state)
      {
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
          condition:list.isNotEmpty,
          builder:(context)=>ListView.separated(
            itemBuilder: (context,index)=>buildArticleItem(list[index],context),
            separatorBuilder:(context,index)=> mydivider(),
            itemCount: list.length,
          ),
          fallback:(context)=> Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
