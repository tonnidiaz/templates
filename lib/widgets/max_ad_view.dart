import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:tu/tu.dart';
import '../utils/config.dart';
import '../utils/functions.dart';
import '/main.dart';

class TuMaxAdView extends StatefulWidget {
  final String? unitId;
  const TuMaxAdView({super.key, this.unitId});

  @override
  State<TuMaxAdView> createState() => _TuMaxAdViewState();
}

class _TuMaxAdViewState extends State<TuMaxAdView> {
  late String route;
  bool _ready = false;
  @override
  void initState() {
    super.initState();
    route = getRoute(context);
  }

  @override
  Widget build(BuildContext context) {
    final appCtrl = MainApp.appCtrl;
    return Obx(() {
      final shouldShow = appCtrl.isVisible && route == appCtrl.currentRoute;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: shouldShow && appCtrl.applovinReady,
            child: MaxAdView(
              visible: _ready,
              adUnitId: widget.unitId ?? appLovinBannerId,
              adFormat: AdFormat.banner,
              listener: AdViewAdListener(onAdLoadedCallback: (ad) {
                clog('BANNER READY');
                setState(() {
                  _ready = true;
                });
              }, onAdLoadFailedCallback: (adUnitId, error) {
                clog("Banner Failed");
                setState(() {
                  _ready = false;
                });
                clog(error);
              }, onAdClickedCallback: (ad) {
                clog("Banner clicked");
              }, onAdExpandedCallback: (ad) {
                clog("Banner expanded");
              }, onAdCollapsedCallback: (ad) {
                clog("Banner collapsed");
              }),
            ),
          ),
        ],
      );
    });
  }
}
