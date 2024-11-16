import 'package:chronicle/cors/failure/failure.dart';
import 'package:chronicle/features/auth/data/data_source/auth_remote_datasource.dart';
import 'package:chronicle/features/auth/domain/model/user_model.dart';
import 'package:chronicle/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserModel>> loginWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the Google Sign-In authentication details
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential for Firebase
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      // Authenticate with Firebase using the credential
      final firebaseCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Convert Firebase User to your app's UserModel

      final firebaseToken = await firebaseCredential.user?.getIdToken();
      final request = await authRemoteDataSource.loginWithGoogle(firebaseToken!);


      return Right(request);
    }on FirebaseException catch (e) {
      // Handle exceptions
      return Left(AuthFailure(message: 'error while passing'));
    }
  }
}
