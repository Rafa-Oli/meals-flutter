import 'package:flutter/material.dart';
import 'package:meals/domain/entities/category_entity.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String? image;
  const Category({required this.id, required this.title, this.color = Colors.orange, this.image});

  CategoryEntity toEntity() => CategoryEntity(id: id, title: title, color: color, image: image);
}
