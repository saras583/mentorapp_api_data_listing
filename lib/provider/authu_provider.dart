import 'package:flutter/material.dart';
import 'package:list_app/service/apiservice.dart';

class AuthuProvider extends ChangeNotifier{
  
  final Apiservice apiservice;

  AuthuProvider(this.apiservice);

   bool isLoading = false;

       String? errorMessage ;
     
        String? accessToken;
        String? refreshToken;

        Future<bool> Login(String email,String password)async{
          isLoading = true;
          errorMessage = null;

          notifyListeners();

          try{

       final response = await apiservice.login(email, password);

             accessToken = response['access_token'];
             refreshToken = response['refres_token'];
              return true;
               
          }catch(e){
                
                errorMessage= e.toString();
                return false;

          }


   }


}