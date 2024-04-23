import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/features/bag/ui/widgets/bag_choice.dart';

class BagListWidget extends StatelessWidget {
  final String choice;
  final String icon;
  final List<String> detailsTitle;

  const BagListWidget({
    super.key,
    required this.choice,
    required this.icon,
    required this.detailsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
        initiallyExpanded: false,
        titleBuilder:
            (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
              onTap: () => toogleFunction(animated: true),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: BagChoice(
                      animationValue: animationValue,
                      choice: choice,
                      icon: icon,
                    ),
                  ),
                ],
              ));
        },
        content: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManger.lightBackground, width: 2),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
          ),
          padding: EdgeInsets.all(20),
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text('- ${detailsTitle[index]}');
              },
              separatorBuilder: (context, index) {
                return verticalSpace(5);
              },
              itemCount: detailsTitle.length),
        ));
  }
}
