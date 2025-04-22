import 'package:dio/dio.dart';

class UpdateProfileReqParams {
  final String fullName;
  final String className;
  final DateTime? birthday;
  final String? imagePath;

  UpdateProfileReqParams({
    required this.fullName,
    required this.className,
    this.birthday,
    this.imagePath,
  });

  Future<FormData> toMap() async{
    final map = <String, dynamic>{
      "name": fullName,
      if (birthday != null) "birthday": birthday!.toIso8601String(),
      "className": className,
      if (imagePath != null) "avatar": await MultipartFile.fromFile(
        imagePath!,
        filename: imagePath!.split('/').last,
      ),
    };

    return FormData.fromMap(map);
  }

}