import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/features/bag/ui/widgets/bag_choice.dart';
import 'package:sports_injury_app/features/bag/ui/widgets/bag_item.dart';

class BagExpandedWidget extends StatelessWidget {
  final String choice;
  final String icon;
  final List<String> detailsTitle;
  final List<String> detailsImage;

  const BagExpandedWidget({
    super.key,
    required this.choice,
    required this.icon,
    required this.detailsTitle,
    required this.detailsImage,
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
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: detailsTitle.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 210,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              return BagItem(
                  $imageUrl: detailsImage[index], $title: detailsTitle[index]);
            },
          ),
        ));
  }
}
