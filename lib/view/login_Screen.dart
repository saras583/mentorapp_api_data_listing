import 'package:flutter/material.dart';
import 'package:list_app/provider/authu_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
      
      final emailController = TextEditingController();
      final passController = TextEditingController();

Future<void> handleLogin()async{
   
   final authuProvider = context.read<AuthuProvider>();
     

     final success =  await  authuProvider.login(emailController.text.trim(), passController.text.trim());
     if(!mounted)return;
     if(success){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> Scaffold(body: Center(child: Text('login successful'),),)));
     }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authuProvider.errorMessage?? 'login fail')));
     }


}
@override
  void dispose() {
    emailController.text.trim();
    passController.text.trim();
    super.dispose();
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
         
         body: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: emailController,
              decoration: InputDecoration(
                  hintText: 'email',
                   

              ),

            ),
            SizedBox(height: 10,)

            ,TextField(controller: passController,
              decoration: InputDecoration(hintText: 'pass',),
            ),
            ElevatedButton(onPressed: handleLogin, child: Text('login'))
          ],
         )),
    );
  }
}