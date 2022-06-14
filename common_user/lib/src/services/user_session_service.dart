import 'package:common_deps/common_deps.dart';
import 'package:common_user/src/entities/user_entity.dart';

class UserSessionService {
  User? currentUser;

  Future<UserCredential> signIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);

    currentUser = userCredential.user;

    return userCredential;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}