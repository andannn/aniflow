import 'package:flutter/material.dart';

class PopupMenuAnchor<T> extends StatelessWidget {
  const PopupMenuAnchor({
    required this.menuItems,
    required this.builder,
    required this.menuItemBuilder,
    super.key,
  });

  final List<T> menuItems;
  final MenuAnchorChildBuilder builder;
  final Widget Function(BuildContext context, T item) menuItemBuilder;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: builder,
      menuChildren: menuItems
          .map(
            (e) => menuItemBuilder(context, e),
      )
          .toList(),
    );
  }
}
