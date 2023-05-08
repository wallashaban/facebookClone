import '../../../core/utils/exports.dart';


class UserModel extends Users {
  const UserModel({
    required super.uId,
    required super.firstName,
    required super.surName,
    required super.email,
   required super.token,
    required super.birthDate,
    required super.gender,
    required super.isEmailVerified,
    super.image,
    super.cover,
    super.bio,
    super.university,
    super.school,
    super.currentTown,
    super.homeTown,
    super.relationship,
    super.workPlace,
  });

  factory UserModel.fromSnapShot(DocumentSnapshot< Map<String,dynamic>> snapshot) {
    return UserModel(
        uId: snapshot['uId'],
        firstName: snapshot['firstName'],
        surName: snapshot['surName'],
        email: snapshot['email'],
        token: snapshot['token'],
        birthDate: snapshot['birthDate'],
        gender: snapshot['gender'],
        isEmailVerified: snapshot['isEmailVerified'],
        image: snapshot['image'],
        cover: snapshot['cover'],
        bio: snapshot['bio'],
        currentTown: snapshot['currentTown'],
         homeTown: snapshot['homeTown'],
        relationship: snapshot['relationship'],
        school: snapshot['school'],
        university: snapshot['university'],
        workPlace: snapshot['workplace'], 
        );
  }


  Map<String, dynamic> toDocument() => {
        'uId': uId,
        'firstName': firstName,
        'surName': surName,
        'email': email,
        'birthDate': birthDate,
        'gender': gender,
        'isEmailVerified':isEmailVerified,
        'image':image,
        'cover':cover,
        'bio':bio,
        'university':university,
        'school':school,
        'currentTown':currentTown,
        'homeTown':homeTown,
        'relationship':relationship,
        'workplace':workPlace,
        'token':token,
      };
}
