import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/size_config.dart';

import '../data.dart';
import '../screens/room_screen.dart';
import 'user_profile_image.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key key, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomScreen(
            room: room,
          ),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 0.5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.heightMultiplier * 2,
              left: SizeConfig.widthMultiplier * 5,
              right: SizeConfig.widthMultiplier * 5,
              bottom: SizeConfig.heightMultiplier * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (room.club.isNotEmpty)
                  Text(
                    '${room.club}  🏠'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline.copyWith(
                          fontWeight: FontWeight.w100,
                          fontSize: SizeConfig.textMultiplier * 1.5,
                          letterSpacing: 1,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                Text(
                  '${room.name}',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: SizeConfig.textMultiplier * 1.9,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: SizeConfig.heightMultiplier * 10,
                        child: Stack(
                          children: [
                            Positioned(
                              left: SizeConfig.widthMultiplier * 8,
                              top: SizeConfig.heightMultiplier * 2,
                              child: UserProfileImage(
                                imageUrl: room.speakers[1].imageUrl,
                                size: SizeConfig.imageSizeMultiplier * 10,
                              ),
                            ),
                            UserProfileImage(
                              imageUrl: room.speakers[0].imageUrl,
                              size: SizeConfig.imageSizeMultiplier * 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map(
                            (e) => Text(
                              '${e.givenName} ${e.familyName} 💬',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                  ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 0.8),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${room.speakers.length + room.followedBySpeakers.length + room.others.length}',
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: SizeConfig.widthMultiplier * 4.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(text: ' /${room.speakers.length} '),
                                WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: SizeConfig.widthMultiplier * 4.5,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: SizeConfig.widthMultiplier * 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
