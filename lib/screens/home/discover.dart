import 'package:Discere/components/class_panel.dart';
import 'package:Discere/models/discover_lives_notifier.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/date_now.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: SizeConfig.safeBlockVertical * 100,
        width: SizeConfig.safeBlockHorizontal * 100,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 21),
            child: Text(
              'Aulas disponivel',
              style: ThemeText.sign_up_option,
            ),
          ),
          _classesAvaible()
        ]),
      ),
    );
  }

  Widget _classesAvaible() {
    return Consumer<DiscoverLivesNotifier>(builder: (context, notifier, _) {
      return notifier.lives != null
          ? Container(
            height: SizeConfig.safeBlockVertical*80,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: notifier.lives.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClassPanel(
                    title: notifier.lives[index].title,
                    date: DateNow.getDDMMFromDate(notifier.lives[index].date),
                    hour: DateNow.getHHMMFromDate(notifier.lives[index].date),
                    cover: notifier.lives[index].cover,
                    channelName: notifier.lives[index].channelName,
                    channelToken: notifier.lives[index].channelToken,
                    description: notifier.lives[index].description,
                    id: notifier.lives[index].id,
                    live: true,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            )
          : Container();
    });
  }
}
