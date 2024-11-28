import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Sampah Organik',
        iconPath: 'assets/icons/organic-waste.svg',
        boxColor: Color.fromRGBO(154, 182, 155, 1)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Sampah Anorganik',
        iconPath: 'assets/icons/plastic-waste.svg',
        boxColor: Color.fromRGBO(154, 182, 155, 1)
      )
    );

    return categories;
  }
}