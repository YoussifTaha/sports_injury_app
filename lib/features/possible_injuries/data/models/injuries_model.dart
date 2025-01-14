import 'package:equatable/equatable.dart';

class InjuriesModel extends Equatable {
  final String? name;
  final String? image;
  final String? description;
  final String? treatmentDescription;

  const InjuriesModel({
    this.name,
    this.image,
    this.description,
    this.treatmentDescription,
  });

  factory InjuriesModel.fromJson(Map<String, dynamic> json) => InjuriesModel(
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        treatmentDescription: json['treatmentDescription'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'description': description,
        'treatmentDescription': treatmentDescription,
      };

  @override
  List<Object?> get props {
    return [
      name,
      image,
      description,
      treatmentDescription,
    ];
  }
}
