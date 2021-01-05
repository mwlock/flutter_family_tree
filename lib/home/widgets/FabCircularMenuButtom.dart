import 'package:flutter/material.dart';

class FabCircularMenuButtom extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  FabCircularMenuButtom({
    @required this.icon,
    @required this.label,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        width: 75,
        height: 75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(icon),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
    );
  }
}