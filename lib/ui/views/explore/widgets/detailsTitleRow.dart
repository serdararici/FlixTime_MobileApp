import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/localization/localization_manager.dart';
import '../../../../utils/theme/theme_manager.dart';

class DetailsTitleRow extends StatelessWidget {
  const DetailsTitleRow({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final localeManager = Provider.of<LocaleManager>(context);
    final themeManager = Provider.of<ThemeManager>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium,),
        GestureDetector(
          onTap: (){

          },
          child: Row(
            children: [
              Text(
                localeManager.translate("all"),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(width: FSizes.xs,),
              Icon(Icons.arrow_right,
                size: FSizes.iconMd,
                color: FColors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}