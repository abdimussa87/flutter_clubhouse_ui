import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../size_config.dart';
import '../widgets/room_user_profile.dart';
import '../widgets/user_profile_image.dart';
import '../widgets/widgets.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key key, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            CupertinoIcons.chevron_down,
          ),
          label: const Text('All rooms'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.doc,
              size: 28,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10, 20, 10),
              child: UserProfileImage(
                imageUrl: currentUser.imageUrl,
                size: 36,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 5,
            vertical: SizeConfig.heightMultiplier * 2),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club}  🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline.copyWith(
                              fontWeight: FontWeight.w100,
                              fontSize: SizeConfig.textMultiplier * 1.5,
                              letterSpacing: 1,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(
                    '${room.name}',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: SizeConfig.textMultiplier * 1.9,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
              sliver: SliverGrid.count(
                childAspectRatio: 0.95,
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                children: room.speakers
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                        isMuted: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                child: Text(
                  'Followed by the speakers',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.textMultiplier * 1.6),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
              sliver: SliverGrid.count(
                childAspectRatio: 0.7,
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                children: room.followedBySpeakers
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                        isMuted: false,
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                child: Text(
                  'Others in the room',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.textMultiplier * 1.6),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
              sliver: SliverGrid.count(
                childAspectRatio: 0.7,
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                children: room.others
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                        isMuted: false,
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverPadding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 1.5),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5,
          vertical: SizeConfig.heightMultiplier * 1.3,
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 1.5,
                  vertical: SizeConfig.heightMultiplier * 1.3,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '✌🏾',
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2,
                        ),
                      ),
                      TextSpan(
                        text: ' Leave quietly ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.textMultiplier * 2,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(CupertinoIcons.add),
                    onPressed: () {},
                    iconSize: SizeConfig.widthMultiplier * 6.5,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2.5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(CupertinoIcons.hand_raised),
                    onPressed: () {},
                    iconSize: SizeConfig.widthMultiplier * 6.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
