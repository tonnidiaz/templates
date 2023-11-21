import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:tu/tu.dart';
import '../utils/config.dart';
import '/main.dart';

class TuMaxAdView extends StatefulWidget {
  final String? unitId;
  const TuMaxAdView({super.key, this.unitId});

  @override
  State<TuMaxAdView> createState() => _TuMaxAdViewState();
}

class _TuMaxAdViewState extends State<TuMaxAdView> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final routeName = ModalRoute.of(context)?.settings.name;
      final shouldShow = MainApp.appCtrl.isVisible &&
          routeName == MainApp.appCtrl.currentRoute;
      return !shouldShow
          ? none()
          : MaxAdView(
              visible: false,
              adUnitId: widget.unitId ?? appLovinBannerId,
              adFormat: AdFormat.banner,
              listener: AdViewAdListener(onAdLoadedCallback: (ad) {
                clog(
                    "Banner Loaded: isCurr ${ModalRoute.of(context)?.isCurrent}");
              }, onAdLoadFailedCallback: (adUnitId, error) {
                clog("Banner Failed");

                clog(error);
              }, onAdClickedCallback: (ad) {
                clog("Banner clicked");
              }, onAdExpandedCallback: (ad) {
                clog("Banner expanded");
              }, onAdCollapsedCallback: (ad) {
                clog("Banner collapsed");
              }),
            );
    });
  }
}
