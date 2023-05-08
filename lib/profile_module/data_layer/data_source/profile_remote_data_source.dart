import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../../../authentication_module/data_layer/models/user_model.dart';

abstract class BaseProfileRemoteDataSource{
    Future<UserModel> getUserData();
  Future<void> updateProfileImage(String profileImage);
  Future<void> updateCoverImage(String coverImage);
    Future<void> editBio(String bio);
  Future<void> editUniversity(String university);
  Future<void> editSchool(String school);
  Future<void> editCurrentTwon(String currentTown);
  Future<void> editHomeTown(String homeTown);
  Future<void> editRelation(String relationship);
  Future<void> editWorkPlace(String workplace);
}

class ProfileRemoteDataSource implements BaseProfileRemoteDataSource{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;


   @override
  Future<UserModel> getUserData() async {
    try {
      final user = await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .get();
      debugPrint('user ${user.data()}');
      return UserModel.fromSnapShot(user);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateCoverImage(String coverImage) async {
    try {
      // var cover;

      firebaseFirestore.collection('user').doc(auth.currentUser!.uid).update({
        'cover': coverImage,
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateProfileImage(String profileImage) async {
    try {
      firebaseFirestore.collection('user').doc(auth.currentUser!.uid).update({
        'image': profileImage,
      });
      //});
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editBio(String bio) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update({
        'bio': bio,
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editCurrentTwon(String currentTown) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update({
        'currentTown': currentTown,
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editHomeTown(String homeTown) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update({
        'homeTown': homeTown,
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editRelation(String relationship) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update({
        'relationship': relationship,
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editSchool(String school) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update({
        'school': school,
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editUniversity(String university) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update({
        'university': university,
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editWorkPlace(String workplace) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update({
        'workplace': workplace,
      });
    } catch (error) {
      throw Exception(error);
    }
  }
}