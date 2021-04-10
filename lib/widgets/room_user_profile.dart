import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import 'widgets.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile(
      {Key key, this.imageUrl, this.name, this.isNew, this.isMuted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.widthMultiplier),
              child: UserProfileImage(
                imageUrl: imageUrl,
                size: SizeConfig.imageSizeMultiplier * 18,
              ),
            ),
            if (isNew)
              Positioned(
                left: SizeConfig.widthMultiplier * 0.6,
                bottom: SizeConfig.heightMultiplier * 0.2,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.widthMultiplier),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Text(
                    '🎉',
                    style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.8,
                    ),
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 2,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.widthMultiplier * 0.8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Icon(
                    CupertinoIcons.mic_slash_fill,
                    size: SizeConfig.textMultiplier * 2.6,
                  ),
                ),
              ),
          ],
        ),
        Text(
          name,
          style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.5),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
