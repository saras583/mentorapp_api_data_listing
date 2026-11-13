import 'package:flutter/foundation.dart';

class ReviewModel {
  final String id;
  final String mentorName;
  final String internName;
  final String reviewDate;
  final String reviewTopic;
  final int reviewScore;

  ReviewModel({
    required this.id,
    required this.mentorName,
    required this.internName,
    required this.reviewDate,
    required this.reviewTopic,
    required this.reviewScore,
  });
   
   factory ReviewModel.fromJson(Map<String,dynamic> json){

     return ReviewModel(id: json['id']??'', mentorName: json['menterName']??'', internName: json['internName']??'', reviewDate: json['reviewDate']??'', reviewTopic: json['reviewTopic']??'', reviewScore: json['reviewScore']??'');
   }

   Map<String,dynamic> toJson(){
    return {
      'id': id,
      'mentorName': mentorName,
      'interName': internName,
      'reviewDate': reviewDate,
      'reviewTopic': reviewTopic,
      'reviewScore': reviewScore
    };
   }

}

