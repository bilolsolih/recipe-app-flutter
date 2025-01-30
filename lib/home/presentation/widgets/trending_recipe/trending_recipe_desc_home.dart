import 'package:flutter/material.dart';

class TrendingRecipeDescHome extends StatelessWidget {
  const TrendingRecipeDescHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      child: Text(
        "This is a quick overview of the ingredients for the recipe",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13, fontFamily: "League Spartan"),
      ),
    );
  }
}
