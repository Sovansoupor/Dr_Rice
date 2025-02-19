import 'package:flutter/material.dart';
import 'package:my_app/models/diagnoses.dart';

class RecentDiagnoseCard extends StatelessWidget {
  final Diagnoses diagnose;

  const RecentDiagnoseCard({
    Key? key,
    required this.diagnose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4DB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF5B7A54), 
          width: 0.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Disease Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              diagnose.imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          
          // Title & Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  diagnose.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  diagnose.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),

          // Time & Options Icon
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // TODO: Implement menu actions
                },
                child: const Icon(Icons.more_vert, size: 17, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                diagnose.time,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
