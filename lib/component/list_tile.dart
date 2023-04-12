import 'package:flutter/material.dart';

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