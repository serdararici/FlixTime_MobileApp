import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class MoviesTitleRow extends StatelessWidget {
  const MoviesTitleRow({
    super.key, required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style:Theme.of(context).textTheme.titleMedium!.apply(color: FColors.primary)),
      ],
    );
  }
}