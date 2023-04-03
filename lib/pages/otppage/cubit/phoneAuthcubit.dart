import 'package:city_ride/common/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<CommonState> {
  AuthCubit() : super(Commoninitial());

  String? _verificationId;

  Future<void> phoneAuth({required String phoneNumber}) async {
    emit(Commonloading());
    print(phoneNumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print("Verification completed");
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException e) {
    print("verificationFailed: ${e.toString()}");
    emit(Commonerror(message: e.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print("Code sent");
    _verificationId = verificationId;
    emit(NumSubmitedstate());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
    print("Time out");
  }

  Future<void> submitOTP(String otpcode) async {
    if(_verificationId != null){
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otpcode);
    await signIn(credential);
    }
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
         await FirebaseAuth.instance.signInWithCredential(credential);
        
        emit(OTPverifiedstate());
        
     
    } catch (e) {
      emit(Commonerror(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLogedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}
