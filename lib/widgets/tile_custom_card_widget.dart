import 'package:flutter/material.dart';

class TileCustomCardWidget extends StatelessWidget {
  final String textline;
  final VoidCallback? onTap;
  TileCustomCardWidget({required this.textline, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        // elevation: 1,
        margin: EdgeInsets.all(0),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      textline,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward, size: 30, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
