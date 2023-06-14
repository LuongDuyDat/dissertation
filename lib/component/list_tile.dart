import 'package:flutter/material.dart';

import '../util/global.dart';
import '../util/strings.dart';
import '../util/theme.dart';

class RectListItemTile extends StatelessWidget {
  final Widget leadingAsset;
  final String title;
  final String? subtitle;
  final double large;
  final Function() onTap;
  const RectListItemTile({
    Key? key,
    required this.leadingAsset,
    required this.title,
    this.subtitle,
    this.large = 16,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        width: large,
        height: large,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: FittedBox(
          child: leadingAsset,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: subtitle != null ? Text(
        subtitle!,
        style: Theme.of(context).textTheme.titleSmall,
      ) : null,
      trailing: IconButton(
        icon: const Icon(Icons.more_horiz),
        onPressed: (){},
      ),
      onTap: onTap,
    );
  }
}

class CirListItemTile extends StatelessWidget {
  final Widget leadingAsset;
  final String title;
  final String? subtitle;
  final double large;
  final Color? backgroundColor;
  final Function() onTap;

  const CirListItemTile({
    super.key,
    required this.leadingAsset,
    required this.title,
    this.subtitle,
    required this.large,
    required this.onTap,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        radius: large,
        backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: leadingAsset,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: subtitle != null ? Text(
        subtitle!,
        style: Theme.of(context).textTheme.titleSmall,
      ) : null,
      trailing: IconButton(
        icon: const Icon(Icons.more_horiz),
        onPressed: (){},
      ),
      onTap: onTap,
    );
  }
}

class MoreListTile extends StatelessWidget {
  const MoreListTile({super.key, required this.title, required this.icon});

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, ),
            ),
            icon,
          ],
        ),
        SizedBox(height: 0.004 * screenHeight,),
        Divider(thickness: 1, color: textLightColor, height: 3,),
      ],
    );
  }

}

class ViewModuleListTile extends StatelessWidget {
  const ViewModuleListTile({super.key, required this.label, required this.creditNumber, this.suffixIcon});

  final String label;
  final int creditNumber;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                  children: [
                    TextSpan(text: '$label: ', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800, ),),
                    TextSpan(
                      text: '$creditNumber $creditString',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal, ),
                    ),
                  ]
              ),
            ),
            suffixIcon ?? const SizedBox()
          ],
        ),
        SizedBox(height: 0.004 * screenHeight,),
        Divider(thickness: 1, color: textLightColor, height: 3,),
      ],
    );
  }

}

class CompanyListTile extends StatelessWidget {
  const CompanyListTile({super.key, required this.name, required this.internArea, required this.status});

  final String name;
  final String internArea;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black45,
              radius: 0.027 * screenHeight,
              child: Center(
                child: Icon(Icons.apartment, size: 0.03 * screenHeight, color: Colors.white,),
              ),
            ),
            SizedBox(width: 0.0327 * screenWidth,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.bodyLarge,),
                SizedBox(height: 0.006 * screenHeight,),
                Text(internArea, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 0.1445 * screenWidth,
          child: Text(
            status,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

}