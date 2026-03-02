import 'dart:io';

import 'package:fruits_apps/core/entities/product_entity.dart';
import 'package:fruits_apps/core/models/review_model.dart';

class ProductModel {
  final String name;
  final num sellingCount;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmout;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.sellingCount,
    required this.code,
    required this.description,
    required this.isOrganic,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmout,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      sellingCount: json['sellingCount'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      image: File(json['image']),
      expirationMonths: json['expirationMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmout: json['unitAmout'],
      isOrganic: json['isOrganic'] ?? false,
      reviews: (json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)),
            )
          : []),
    );
  }

 ProductEntity toEntity(){
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      image: image,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      unitAmout: unitAmout,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmout': unitAmout,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
