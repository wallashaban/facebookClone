import '../../../core/utils/exports.dart';

class Users extends Equatable {
  final String uId;
  final String firstName;
  final String surName;
  final String email;
  final String birthDate;
  final String gender;
  final bool isEmailVerified;
  final String token;
  final String? image;
  final String? cover;
  final String? bio;
  final String? university;
  final String? school;
  final String? currentTown;
  final String? homeTown;
  final String? relationship;
  final String? workPlace;

  const Users({
    required this.uId,
    required this.firstName,
    required this.surName,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.isEmailVerified,
    required this.token,
    this.image =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsArWf2lZuLGqco6QoGM13keJb078XIgNWA&usqp=CAU',
    this.cover =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF30lJptOdDzf3DS9goNc0F-VUc7Hcf7ghlg&usqp=CAU',
    this.bio = 'Describe Yourself...',
    this.university,
    this.school,
    this.currentTown,
    this.homeTown,
    this.relationship,
    this.workPlace,
  });
  @override
  List<Object?> get props => [
        uId,
        firstName,
        surName,
        email,
        birthDate,
        gender,
        image,
        cover,
        bio,
        university,
        school,
        currentTown,
        homeTown,
        relationship,
        workPlace,
      ];
}
