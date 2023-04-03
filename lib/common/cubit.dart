
abstract class CommonState {}

class Commoninitial extends CommonState {}

class Commonloading extends CommonState {}

class Commonsuccess<T> extends CommonState {
  T? data;

  Commonsuccess({this.data});
}

class Commonerror extends CommonState {
  final String message;

  Commonerror({required this.message});
}

class NumSubmitedstate extends CommonState {}

class OTPverifiedstate extends CommonState {}
