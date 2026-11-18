import 'package:flutter/material.dart';
import 'package:list_app/provider/authu_provider.dart';
import 'package:list_app/provider/review_provider.dart';
import 'package:list_app/service/apiservice.dart';
import 'package:list_app/view/login_Screen.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(MultiProvider(providers: [
       
       ChangeNotifierProvider(create: (_)=> AuthuProvider(Apiservice())),

       ChangeNotifierProvider(create: (_)=> ReviewProvider((Apiservice())),),

  ],child: const Myapp() ));
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen(),);
  }
}