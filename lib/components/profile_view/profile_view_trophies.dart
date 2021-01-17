import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';

class ProfileViewTrophies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Troféus", style: ThemeText.font_bold_24_white,),
        Container(
          height: 100,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Image(image: AssetImage(ThemeAsset.trophy));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Padding(
              padding: EdgeInsets.only(right: 2),
            ),
          ),
        )
      ],
    ));
  }
}
