// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:messanger/modules/web_view/web_view.dart';
import 'package:messanger/shared/cubit/appcubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double readuis = 0.0,
  required void Function() ? function,
  required String text,
})=>Container(
  width:width,
  height: 40.0,
  decoration: BoxDecoration
    (
    borderRadius: BorderRadius.circular(readuis),
    color:background,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
     isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(color: Colors.white),
    ),
  ),
);

Widget defaultformfield({
  required TextEditingController ? controller,
  required TextInputType type,
  required String label,
  required String ? Function(String?)? validate,
  required IconData icon,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onChanged,
  Function() ? onTap,
  IconData ? suffix,
  Function() ?suufixpress,
  bool isPassword = false,
})=> TextFormField(
  controller: controller,
  keyboardType:type,
  validator:validate,
  obscureText: isPassword,
  onTap: onTap,
  onChanged: onChanged,
  onFieldSubmitted: onSubmit,
  decoration:  InputDecoration(
  labelText: label,
  // labelStyle: TextStyle(color: Colors.white),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0))
  ),
  prefixIcon:Icon(icon,),
  suffixIcon: suffix !=null ? IconButton
    (
      onPressed: suufixpress,
      icon: Icon(suffix)):null,
),
);

Widget buildTaskItem(Map model,context)=> Dismissible(
  key:Key(model['id'].toString()),
  child:Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(

      children: [

        CircleAvatar(

          radius: 40.0,

          child: Text(

            '${model['time']}',

          ),

        ),

        SizedBox(width: 20.0,),

        Expanded(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisSize: MainAxisSize.min,

            children: [

              Text(

                '${model['title']}',

                style: TextStyle(

                    fontSize: 16.0,

                    fontWeight: FontWeight.bold

                ),

              ),

              Text(

                '${model['date']}',

                style: TextStyle(

                    color: Colors.grey

                ),

              ),

            ],

          ),

        ),

        SizedBox(width: 20,),

        IconButton(

            onPressed:(){

              AppCubit.get(context).updateData(

                  status:'done',

                  id:model['id'],

              );

            },

            icon:Icon(

              Icons.check_box,

              color: Colors.green,

            ),

        ),

        IconButton(

          onPressed:()

          {

            AppCubit.get(context).updateData(

                status:'archived',

                id:model['id'],

            );

          },

          icon:Icon(

            Icons.archive_outlined,

            color: Colors.black26,

          ),

        )

      ],

    ),

  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id:model['id']);
  },
);

Widget buildArticleItem(Map article,context){
  return ConditionalBuilder(
    condition:article['urlToImage']!=null,
    builder: (context)=>InkWell(
      onTap: ()
      {
        navigteTo(context,WebViewExample(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image:NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(width: 20.0,),
            Expanded(
              child: SizedBox(
                height: 140.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        article['title'],
                        style:Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      article['publishedAt'],
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    fallback: (context)=>Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image:NetworkImage('https://mediaaws.almasryalyoum.com/news/large/2022/10/16/1920260_0.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: SizedBox(
              height: 140.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article['title'],
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    article['publishedAt'],
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
}

Widget mydivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[500],
  ),
);

Widget defultTextButton({
  required Function()? function,
  required String text,
}) =>
    TextButton(onPressed: function, child: Text(text.toUpperCase()));

Widget articleBuilder(list,context,{isSearch =false})=> ConditionalBuilder(
  condition:list.isNotEmpty,
  builder:(context)=>ListView.separated(
    itemBuilder: (context,index)=>buildArticleItem(list[index],context),
    separatorBuilder:(context,index)=> mydivider(),
    itemCount: list.length,
  ),
  fallback:(context)=> isSearch? Center(child: CircularProgressIndicator()):Container(),
);

void navigteTo(context,widget)=>Navigator.
push(context,
    MaterialPageRoute(builder: (context)=>widget),
);


