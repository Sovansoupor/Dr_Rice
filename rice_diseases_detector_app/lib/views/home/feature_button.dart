import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget {
  final String icon;
  final String label;

  const FeatureButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: const Color(0xFFD4DCB7),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFF5B7A54), 
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 60, width: 60),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF4DB),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFF5B7A54), 
                width: 0.5,
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A5043),
              ),
            ),
          ),
        ],
      ),
    );
  }
}