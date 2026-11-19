import 'package:dio/dio.dart';

class Apiservice {
  
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://mentor-meter-backend.onrender.com/',
      connectTimeout: Duration(milliseconds: 2),
      receiveTimeout: Duration(microseconds: 2),
      headers: {
        'Content-Type' : 'application/json'
      }
      
    )
  );

  Future<Map<String,dynamic>> login( String email, String password)async{
       
       final response = await dio.post('/api/auth/login',data :{ 'email': email,'password': password});

       return Map<String,dynamic>.from(response.data);
     


  }

  //get review Api

  Future<List<dynamic>> getReview(String token)async{
  
      final response = await dio.get('/api/auth/login',options: Options(headers: {
        'Authorization': 'Bearer $token',
      }));

      return response.data as List<dynamic>;
      
  }
  

}