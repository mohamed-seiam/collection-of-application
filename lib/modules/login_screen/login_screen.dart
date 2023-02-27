// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messanger/shared/component/component.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // const LogIn({super.key});
  var EmailAddress = TextEditingController();

  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 40),
                  defaultformfield(
                      controller:EmailAddress,
                      type: TextInputType.emailAddress,
                      label:'Email Address',
                      validate:(String? value)
                      {
                        if(value!.isEmpty)
                          {
                            return 'EmailAdress must not be empty';
                          }
                        return '';
                      },
                      icon:
                      Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                 defaultformfield(
                   suffix:isPassword ? Icons.visibility : Icons.visibility_off,
                     suufixpress:()
                     {
                        setState(() {
                          isPassword = !isPassword;
                        });
                     } ,
                     controller:password,
                     isPassword: isPassword,
                     type: TextInputType.visiblePassword,
                     label:'password',
                     validate:(value)
                     {
                       if(value!.isEmpty)
                       {
                         return 'password is too short';
                       }
                       return "";
                     },
                     icon:Icons.lock,
                 ),
                  const SizedBox(height: 20),
                 defaultButton(
                     width: double.infinity,
                     background:Colors.blue,
                     function:()
                     {
                       if(formKey.currentState!.validate())
                       {
                         print(EmailAddress.text);
                         print(password.text);
                       }
                     },
                     text:'Login',
                 ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don\'t Have Account ?"),
                      TextButton(onPressed: () {},
                        child: Text("Register Now"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
