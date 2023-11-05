import 'package:flutter/material.dart';

class ShortNumLabelIconButton extends StatelessWidget {
  const ShortNumLabelIconButton({
    required this.icon,
    required this.onClick,
    required this.count,
    super.key,
    this.color,
  });

  final IconData icon;
  final int count;
  final Color? color;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      customBorder: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              count.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: color),
            ),
            Transform.scale(scale: 0.7, child: Icon(icon, color: color)),
          ],
        ),
      ),
    );
  }
}
