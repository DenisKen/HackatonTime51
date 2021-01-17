import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';

class ProfileViewBasicInfo extends StatelessWidget {
  final String role;
  final String name;
  final String age;
  final String location;

  final Color color;

  const ProfileViewBasicInfo(
      {Key key, this.role, this.name, this.age, this.location, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _avatarImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name',
                style: ThemeText.font_bold_15_white,
              ),
              Text('$age', style: ThemeText.font_bold_15_white),
              Text('$location', style: ThemeText.font_bold_15_white),
              Container(
                  width: 130,
                  decoration: BoxDecoration(
                      color: color != null ? color : ThemeColor.primary_color,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text('$role', style: ThemeText.font_bold_24_white),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _avatarImage() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
              width: 110,
              height: 110,
              decoration: new BoxDecoration(
                color: color != null ? color : ThemeColor.primary_color,
                shape: BoxShape.circle,
              )),
        ),
        Positioned.fill(
          top: 0,
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 50
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: new BoxDecoration(
              color: ThemeColor.black_grey,
              shape: BoxShape.circle,
            ),
            child: Align(alignment: Alignment.center, child: Text('1', style: ThemeText.font_bold_24_white,)),
          ),
        )
      ],
    );
  }
}
