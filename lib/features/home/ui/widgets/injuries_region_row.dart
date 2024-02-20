import 'package:flutter/material.dart';

import '../../../../core/widgets/widgets.dart';
import 'injury_region_item.dart';

class InjuriesRegionRow extends StatelessWidget {
  final String firstRegionName;
  final String secondRegionName;
  const InjuriesRegionRow(
      {super.key,
      required this.firstRegionName,
      required this.secondRegionName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InjuryRegionItem(regionName: firstRegionName),
        ),
        myVerticalDivider(height: 80),
        Expanded(
          child: InjuryRegionItem(regionName: secondRegionName),
        ),
      ],
    );
  }
}
