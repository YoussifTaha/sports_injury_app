import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String fullName;
  final String email;
  final String phone;
  final String uId;
  final String userType;
  final String? chiefComplain;
  final String? firstSessionDate;
  final String? age;
  final String? gender;
  final String? address;
  final String? occupation;
  final String? injuryRegion;
  final String? weekNumber;
  final String? myDoctorUid;
  final int? patientId;
  final bool? isPersonalInfoAdded;

  const UserModel(
      {required this.fullName,
      required this.email,
      required this.phone,
      required this.uId,
      required this.userType,
      this.chiefComplain,
      this.firstSessionDate,
      this.age,
      this.gender,
      this.address,
      this.occupation,
      this.injuryRegion,
      this.weekNumber,
      this.myDoctorUid,
      this.patientId,
      this.isPersonalInfoAdded});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone'],
        uId: json['uId'],
        userType: json['userType'],
        patientId: json['patientId'],
        isPersonalInfoAdded: json['isPersonalInfoAdded'] = false,
        chiefComplain: json['chiefComplain'] as String?,
        firstSessionDate: json['firstSessionDate'] as String?,
        age: json['age'] as String?,
        gender: json['gender'] as String?,
        address: json['address'] as String?,
        occupation: json['occupation'] as String?,
        injuryRegion: json['injuryRegion'] as String?,
        weekNumber: json['weekNumber'] as String?,
        myDoctorUid: json['myDoctorUid'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'uId': uId,
        'userType': userType,
        'patientId': patientId,
        'isPersonalInfoAdded': isPersonalInfoAdded,
        'chiefComplain': chiefComplain,
        'firstSessionDate': firstSessionDate,
        'age': age,
        'gender': gender,
        'address': address,
        'occupation': occupation,
        'injuryRegion': injuryRegion,
        'weekNumber': weekNumber,
        'myDoctorUid': myDoctorUid,
      };

  @override
  List<Object?> get props {
    return [
      fullName,
      email,
      phone,
      uId,
      userType,
      patientId,
      isPersonalInfoAdded,
      chiefComplain,
      firstSessionDate,
      age,
      gender,
      address,
      occupation,
      injuryRegion,
      weekNumber,
      myDoctorUid,
    ];
  }
}
