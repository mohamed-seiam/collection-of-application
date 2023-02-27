// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/layout/news_app/cubit/cubit.dart';
import 'package:messanger/layout/news_app/cubit/states.dart';
import 'package:messanger/shared/component/component.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
var searchController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultformfield(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearchData(value!);
                  },
                  validate:(value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Search must not be empty';
                    }
                    return '';
                  },
                  icon:Icons.search_rounded,
                ),
              ),
              Expanded(child: articleBuilder(list,context,isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
