import 'package:dio/dio.dart';

class Apiservece {


final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://mentor-meter-backend.onrender.com/',
    headers: {
      'Content-Type': 'application/json' 
    }
  )
);

 Future<Map<String,dynamic>> login(
  String email,String password
)async{
  
  try{
    final response = await dio.post('/api/auth/login',
  data: {
    'email': email,
    'password': password
  }, );

   return Map<String,dynamic>.from(response.data);
  }catch(e){
     
     print('login error: $e');
     rethrow;
  }

}



}