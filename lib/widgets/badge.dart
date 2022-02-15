import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final int value;
  final Color? color;

  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 6,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color != null
                  ? color
                  : Theme.of(context).colorScheme.secondary,
            ),
            padding: EdgeInsets.all(2),
            child: Text(
              '${value}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
            constraints: BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
          ),
        )
      ],
    );
  }
}
