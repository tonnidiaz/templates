import 'dart:math';

import 'package:applovin_max/applovin_max.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tu/utils/functions.dart';
import 'package:tuned/main.dart';

import 'constants.dart';

const appLovinBannerId = "";

class TuAppLovin {
  static Future config() async {
    try {
      await AppLovinMAX.initialize(
          "1tu7Mkwbm9nZmmC2Rtkh2bnxPBLl5VdRbHC3Uvx1NV_XazIn42DeRH0iS7VpkoJZTLaz_T4BzmT1m4VWRFJSDh");
      MainApp.appCtrl.applovinReady = true;
    } catch (e) {
      clog('Failed to init AppLovin');
      clog(e);
    }
  }

  static String interstitialId = "25ef0c5769b8a0b0";

  static initializeInterstitialAds() {
    var interstitialRetryAttempt = 0;
    AppLovinMAX.setInterstitialListener(
        InterstitialListener(onAdLoadedCallback: (ad) {
      // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialReady(_interstitialId) will now return 'true'
      clog('Interstitial ad loaded from ${ad.networkName}');

      // Reset retry attempt
      interstitialRetryAttempt = 0;
    }, onAdLoadFailedCallback: (adUnitId, error) {
      // Interstitial ad failed to load
      // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
      interstitialRetryAttempt = interstitialRetryAttempt + 1;

      int retryDelay = pow(2, min(6, interstitialRetryAttempt)).toInt();

      clog(
          'Interstitial ad failed to load with code ${error.code} - retrying in ${retryDelay}s');

      Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
        AppLovinMAX.loadInterstitial(interstitialId);
      });
    }, onAdDisplayedCallback: (ad) {
      clog("Ad Displayed");
    }, onAdDisplayFailedCallback: (adUnitId, error) {
      clog("Ad Failed");
      clog(error);
    }, onAdClickedCallback: (ad) {
      clog("Ad clicked");
    }, onAdHiddenCallback: (ad) {
      clog("Ad hidden");
    }, onAdRevenuePaidCallback: (ad) {
      clog("Revenue paid");
    }));

    // Load the first interstitial
    AppLovinMAX.loadInterstitial(interstitialId);
  }
}
