import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  final String chiefComplain;
  final String age;
  final String gender;
  final String position;
  final String injuryRegion;
  final String suspectedInjury;
  final String sessionDate;
  final List<String>? radiologyImages;

  const UserInfoModel({
    required this.chiefComplain,
    required this.age,
    required this.gender,
    required this.position,
    required this.injuryRegion,
    required this.suspectedInjury,
    required this.sessionDate,
    this.radiologyImages,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        chiefComplain: json['chiefComplain'],
        age: json['age'],
        gender: json['gender'],
        position: json['position'],
        injuryRegion: json['injuryRegion'],
        suspectedInjury: json['suspectedInjury'],
        sessionDate: json['sessionDate'],
        radiologyImages: json['radiologyImages'],
      );

  Map<String, dynamic> toJson() => {
        'chiefComplain': chiefComplain,
        'age': age,
        'gender': gender,
        'position': position,
        'injuryRegion': injuryRegion,
        'suspectedInjury': suspectedInjury,
        'sessionDate': sessionDate,
        'radiologyImages': radiologyImages,
      };

  @override
  List<Object?> get props {
    return [
      chiefComplain,
      age,
      gender,
      position,
      injuryRegion,
      suspectedInjury,
      sessionDate,
      radiologyImages,
    ];
  }
}
