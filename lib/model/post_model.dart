import 'package:equatable/equatable.dart';

import '../util/strings.dart';

class PostModel extends Equatable {
  const PostModel({
    required this.type,
    required this.title,
    required this.author,
    required this.dateTime,
    required this.image,
    this.tags,
    this.status,
  });

  //type = 0: university, type = 1: company
  final int type;
  final String title;
  final String author;
  final DateTime dateTime;
  final String image;
  final List<String>? tags;
  final String? status;


  @override
  List<Object?> get props => [
    type,
    title,
    author,
    dateTime,
    image,
    tags,
    status,
  ];
}

List<PostModel> allPostModelList = [
  PostModel(
    type: 0,
    title: 'Lựa chọn ngành Kỹ thuật năng lượng: Bước đệm trở thành công dân toàn cầu, nâng tầm sự nghiệp',
    author: 'Nhà trường',
    dateTime: DateTime.now(),
    image: 'assets/images/post_image.jpg',
    tags: const ['Ky thuat nang luong', 'Tri tue nhan tao'],
  ),
  PostModel(
    type: 1,
    title: 'Tuyển thực tập sinh Web Frontend',
    author: 'Công ty cổ phần FPT',
    dateTime: DateTime.now(),
    status: signUpString,
    image: 'assets/images/post_image.jpg',
  ),
  PostModel(
    type: 0,
    title: 'Lựa chọn ngành Kỹ thuật năng lượng: Bước đệm trở thành công dân toàn cầu, nâng tầm sự nghiệp',
    author: 'Nhà trường',
    dateTime: DateTime.now(),
    image: 'assets/images/post_image.jpg',
    tags: const ['Ky thuat nang luong', 'Tri tue nhan tao'],
  ),
  PostModel(
    type: 1,
    title: 'Tuyển thực tập sinh Web Frontend',
    author: 'Công ty cổ phần FPT',
    dateTime: DateTime.now(),
    status: signUpString,
    image: 'assets/images/post_image.jpg',
  ),
];

List<PostModel> universityPostModelList = [
  PostModel(
    type: 0,
    title: 'Lựa chọn ngành Kỹ thuật năng lượng: Bước đệm trở thành công dân toàn cầu, nâng tầm sự nghiệp',
    author: 'Nhà trường',
    dateTime: DateTime.now(),
    image: 'assets/images/post_image.jpg',
    tags: const ['Ky thuat nang luong', 'Tri tue nhan tao'],
  ),
  PostModel(
    type: 0,
    title: 'Lựa chọn ngành Kỹ thuật năng lượng: Bước đệm trở thành công dân toàn cầu, nâng tầm sự nghiệp',
    author: 'Nhà trường',
    dateTime: DateTime.now(),
    image: 'assets/images/post_image.jpg',
    tags: const ['Ky thuat nang luong', 'Tri tue nhan tao'],
  ),
];

List<PostModel> companyPostModelList = [
  PostModel(
    type: 1,
    title: 'Tuyển thực tập sinh Web Frontend',
    author: 'Công ty cổ phần FPT',
    dateTime: DateTime.now(),
    status: signUpString,
    image: 'assets/images/post_image.jpg',
  ),

  PostModel(
    type: 1,
    title: 'Tuyển thực tập sinh Web Frontend',
    author: 'Công ty cổ phần FPT',
    dateTime: DateTime.now(),
    status: signUpString,
    image: 'assets/images/post_image.jpg',
  ),
];