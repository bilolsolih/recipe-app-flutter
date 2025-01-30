import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/data/models/top_chef_model_small.dart';

class TopChefItemHome extends StatelessWidget {
  const TopChefItemHome({
    super.key,
    required this.chef,
  });

  final TopChefModelSmall chef;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Image.asset(
            chef.image,
            width: 83 * AppSizes.wRatio,
            height: 74 * AppSizes.hRatio,
            fit: BoxFit.cover,
          ),
        ),
        Text(chef.firstName, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
