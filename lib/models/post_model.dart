import 'package:flutter/material.dart';

class PostModel extends ChangeNotifier {
  String? UserId;
  String? UserName;
  String? UserImage;
  String? Discription;
  String? PostTitle;
  PostModel({
    this.UserId,
    this.UserImage,
    this.UserName,
    this.Discription,
    this.PostTitle,
  });
  PostModel.fromJson(json, id) {
    this.UserId = id;
    this.UserImage = json['UserImage'];
    this.UserName = json['UserName'];
    this.Discription = json['Discription'] ?? '';
    this.PostTitle = json['PostTitle'];
  }
  toJson() {
    return {
      'UserId': this.UserId,
      'UserImage': this.UserImage,
      'UserName': this.UserName,
      'Discription': this.Discription,
      'PostTitle': this.PostTitle,
    };
  }
}
