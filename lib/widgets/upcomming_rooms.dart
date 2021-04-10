import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/size_config.dart';

import '../config/palette.dart';
import '../data.dart';

class UpcommingRooms extends StatelessWidget {
  final List<Room> upcommingRooms;

  const UpcommingRooms({Key key, this.upcommingRooms}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
        color: Palette.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.widthMultiplier * 10,
          top: SizeConfig.heightMultiplier,
          bottom: SizeConfig.heightMultiplier,
        ),
        child: Column(
          children: upcommingRooms
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.time,
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.6,
                          ),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 6),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (e.club.isNotEmpty)
                                Text(
                                  '${e.club}  🏠'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.3,
                                        letterSpacing: 1,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              Text(
                                '${e.name}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
