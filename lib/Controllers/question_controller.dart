import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward();

    super.onInit();
  }
}