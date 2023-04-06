import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/theme.dart';

class Post extends StatelessWidget {
  //type = 0: school post; type = 1: company post
  final int type;
  final List<String>? tags;
  final String? status;
  final String author;
  final DateTime date;
  final String image;
  final String title;

  const Post({super.key, required this.type, this.tags, required this.author, required this.date, this.status, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.13 * screenHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 0.35 * screenWidth,
            height: 0.13 * screenHeight,
            child: Image.asset(image, fit: BoxFit.cover,),
          ),
          SizedBox(width: 0.0234 * screenWidth,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.001 * screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                type == 0 ? ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 0.488 * screenWidth),
                  child: Wrap(
                    clipBehavior: Clip.hardEdge,
                    direction: Axis.vertical,
                    children: [
                      Row(
                        children: tags!.map((tag) {
                          return Text('$tag, ', style: Theme.of(context).textTheme.titleSmall,);
                        }).toList(),
                      ),
                    ]
                  ),
                ) : Text(
                  status!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 0.01 * screenHeight,),
                SizedBox(
                  width: 0.488 * screenWidth,
                  height: type == 0 ? 0.083 * screenHeight : 0.078 * screenHeight,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800),
                    maxLines: 4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(author, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: hintLightText2),),
                    SizedBox(width: 0.02 * screenWidth,),
                    Container(
                      width: 0.005 * screenHeight,
                      height: 0.005 * screenHeight,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 0.02 * screenWidth,),
                    Text(date.toString().substring(0, 10), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: hintLightText2),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}