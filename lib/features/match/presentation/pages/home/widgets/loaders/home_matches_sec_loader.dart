import 'package:flutter/material.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/vertical_user_card_loader.dart';

class HomeMatchesSecLoader extends StatelessWidget {
  const HomeMatchesSecLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return VerticalUserCardLoader();
      },
    );
  }
}
