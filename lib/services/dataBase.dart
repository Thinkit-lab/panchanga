import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panchanga_pandit/models/usermodel.dart';


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

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.get('name'),
      gender: snapshot.get('gender'),
      dob: snapshot.get('dob')
      
    );
  }

  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}