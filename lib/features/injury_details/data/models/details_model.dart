import 'package:equatable/equatable.dart';

class DetailsModel extends Equatable {
  final String? name;
  final List<dynamic>? goals;
  final String? videoUrl;
  final String? description;
  final String? image;

  const DetailsModel({
    this.name,
    this.goals,
    this.videoUrl,
    this.description,
    this.image,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        name: json['name'] as String?,
        goals: json['goals'] as List<dynamic>?,
        videoUrl: json['videoUrl'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'goals': goals,
        'videoUrl': videoUrl,
        'description': description,
        'image': image,
      };

  @override
  List<Object?> get props {
    return [
      name,
      goals,
      videoUrl,
      description,
      image,
    ];
  }
}
