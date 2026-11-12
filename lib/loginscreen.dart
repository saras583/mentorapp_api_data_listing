import 'package:flutter/material.dart';
import 'package:list_app/apiservece.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

    final email = TextEditingController();
    final password = TextEditingController();

    final apiservice = Apiservece();
    bool isloading = false;


    Future<void> loginFuction()async{
      
      setState(() {
        isloading = true;
      });

      try{
        final response = await apiservice.login(email.text.trim(), password.text.trim());
         
         //extractAccessToken
        final accessToken = response['acess_token'];

        if(assessToken == null || accessToken is! String){
          throw Exception('access token is not found');
        }
        
        //store token locally

        final pref = await SharedPreferences.getInstance();
        await pref.setString('access_token', accessToken);

        if(!mounted)return;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('login sucessfull')));
      }

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(controller: email,
          decoration: InputDecoration(hintText: 'login'),
        ),
        TextField(controller: password,
          decoration: InputDecoration(hintText: 'pass'),
        ),
        ElevatedButton(onPressed: (){}, child: Text('login'))
      ],)),
    );
  }
}