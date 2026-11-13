import 'package:flutter/material.dart';
import 'package:list_app/models/reviewmodel.dart';
import 'package:list_app/service/apiservice.dart';

class ReviewProvider extends ChangeNotifier{
 
 final Apiservice apiservice;

 ReviewProvider(this.apiservice);


 List<ReviewModel> reviews = [];

 bool isLoading = false;

 String? errorMessage;
 
 Future<void> fecthReview(String token)async{
    
    isLoading = true;
    errorMessage = null;
     try{
    final response = await apiservice.getReview(token);

    reviews = response.map((json)=> ReviewModel.fromJson(json)).toList();
     }
     catch(e){
      errorMessage = e.toString();
      notifyListeners();
     }
 }



}