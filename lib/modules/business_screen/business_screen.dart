// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/layout/news_app/cubit/cubit.dart';
import 'package:messanger/layout/news_app/cubit/states.dart';
import 'package:messanger/shared/component/component.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! BussinessLoadingState,
          builder: (context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>buildArticleItem(list[index],context),
              separatorBuilder: (context,index)=>mydivider(),
              itemCount: list.length,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
