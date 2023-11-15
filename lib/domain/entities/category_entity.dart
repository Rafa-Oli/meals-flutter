import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String title;
  final Color color;
  final String? image;
  const CategoryEntity({required this.id, required this.title, this.color = Colors.orange, this.image});

  @override
  List<Object?> get props => [id, title, color, image];
}
