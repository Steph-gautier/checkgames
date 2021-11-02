import 'package:checkgames/controllers/homeController.dart';
import 'package:flutter/material.dart';

void main() {
  //Use the MVC Pattern to Launch the view

  var controller = new HomeController();

  runApp(controller.view);
}
