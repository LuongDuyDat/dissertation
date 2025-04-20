class ChangePassReqParams {
  final String oldPassword;
  final String newPassword;

  ChangePassReqParams({
    required this.oldPassword,
    required this.newPassword
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': oldPassword,
      'newPassword': newPassword,
    };
  }

}