import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User> signIn(String email, String password) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<User> createPerson(
      String name, String email, String interest, String password) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await firestore
        .collection("Person")
        .doc(user.user.uid)
        .set({'userName': name, 'email': email, 'interest': interest});

    return user.user;
  }

  Future<User> updatePerson(
      String name, String email, String interest, String password) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await firestore
        .collection("Person")
        .doc(user.user.uid)
        .update({'userName': name, 'email': email, 'interest': interest});

    return user.user;
  }
}
