import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/size_config.dart';
import '../config/palette.dart';
import '../data.dart';
import '../data.dart';
import '../widgets/widgets.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.search),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.envelope_open),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.calendar),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: EdgeInsets.fromLTRB(
                20, 0, 20, SizeConfig.heightMultiplier * 10),
            children: [
              UpcommingRooms(
                upcommingRooms: upcomingRoomsList,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              ...roomsList.map((e) => RoomCard(room: e)),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  //! check linear gradient after restarting
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  // colors: [
                  //   Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                  //   Theme.of(context).scaffoldBackgroundColor,
                  // ],
                  // ),
                  ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.heightMultiplier * 3,
            child: Container(
              padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2.6),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                        size: SizeConfig.textMultiplier * 2.5,
                      ),
                    ),
                    TextSpan(
                      text: ' Start a room',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 2,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: SizeConfig.widthMultiplier * 10,
            bottom: SizeConfig.heightMultiplier * 4,
            child: Stack(
              children: [
                Icon(
                  CupertinoIcons.circle_grid_3x3_fill,
                  size: SizeConfig.widthMultiplier * 7,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.widthMultiplier * 1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
