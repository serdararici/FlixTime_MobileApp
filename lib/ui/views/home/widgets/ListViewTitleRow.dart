import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/localization/localization_manager.dart';

class ListViewTitleRow extends StatelessWidget {
  const ListViewTitleRow({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final localeManager = Provider.of<LocaleManager>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style:Theme.of(context).textTheme.titleMedium!.apply(color: FColors.primary)),
        Row(
          children: [
            GestureDetector(
              onTap: (){

              },
              child: Text(
                localeManager.translate("all"),
                style: TextStyle(
                  color: FColors.primary,
                  fontSize: FSizes.fontSizeMd,
                ),
              ),
            ),
            SizedBox(width: FSizes.xs,),
            Icon(Icons.east,
              size: FSizes.iconMd,
              color: FColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}