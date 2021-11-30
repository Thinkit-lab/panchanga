import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(String name, String gender, String dob, String birthTime, String birthPlace) async {
    return await userCollection.doc(uid).set({
      'gender': gender,
      'name': name,
      'dob': dob,
      'birthTime': birthTime,
      'birthPlace': birthPlace,

    });
  }

}