class SignUpWithEmailAndPasswordResponseEntity {
  final String uid;

  SignUpWithEmailAndPasswordResponseEntity({
    required this.uid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUpWithEmailAndPasswordResponseEntity &&
          runtimeType == other.runtimeType &&
          uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}
