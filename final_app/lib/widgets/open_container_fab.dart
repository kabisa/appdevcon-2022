import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

const double _fabDimension = 56.0;

class OpenContainerFab<T> extends StatelessWidget {
  final Widget child;
  final OpenContainerBuilder openContainerBuilder;
  final ClosedCallback<T?> onClosed;

  const OpenContainerFab({
    Key? key,
    required this.child,
    required this.openContainerBuilder,
    required this.onClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedColor: Theme.of(context).colorScheme.secondary,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_fabDimension / 2),
          ),
        ),
        onClosed: (result) {},
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: child,
          );
        },
        openBuilder: openContainerBuilder);
  }
}
