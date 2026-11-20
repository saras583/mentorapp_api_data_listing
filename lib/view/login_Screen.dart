import 'package:flutter/material.dart';
import 'package:list_app/provider/authu_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

     final email = TextEditingController();
     final password = TextEditingController();

     Future<void> handleLogin()async{
         
      final authuprovider =  context.read<AuthuProvider>();

          final success = await authuprovider.Login(email.text.trim(), password.text.trim());

          if(!mounted)return;

          if(success){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> Center(child:  Text('login success'))));
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authuprovider.errorMessage?? 'login fail')));
          }

     }



  @override
  Widget build(BuildContext context) {
      return  Scaffold(
             appBar: AppBar(),
             body: Consumer<AuthuProvider>(builder:(context,auth,child){
              return Padding(padding: EdgeInsetsGeometry.all(20)
                 , child: Column(
                         children: [

                          TextField(decoration: InputDecoration(hintText: 'login'),controller: email,),
                                                    TextField(decoration: InputDecoration(hintText: 'login'),controller: password,),
                           ElevatedButton(onPressed: auth.isLoading? null : handleLogin, child: Text('login'))
                         ],
                  ),
              );
             } ),
        
            
      );
    
}}