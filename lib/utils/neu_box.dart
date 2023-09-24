import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final child;
  const NeuBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          // darker shadow on the bottom right
          BoxShadow(
            color: Color.fromARGB(255, 81, 81, 81),
            blurRadius: 15,
            offset: Offset(2, 2),
          ),

          // lighter shadow on the top left
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-2, -2),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
