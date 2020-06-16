library fireblend_mobile;

export 'src/authentication.dart';
export 'src/database.dart';
export 'src/messaging.dart';
export 'src/storage.dart';
export 'src/analytics.dart';

import 'dart:async';
import 'dart:io' show Platform;
import 'package:firebase_core/firebase_core.dart';
import 'package:fireblend/fireblend.dart';
import 'package:fireblend_mobile/src/analytics.dart';

import 'src/authentication.dart';
import 'src/database.dart';
import 'src/messaging.dart';
import 'src/storage.dart';

class FireblendMobile extends Fireblend{
  FirebaseApp _app;

  FireblendMobile._internal(this._app);

  FirebaseApp get app => _app;

  static Future<FireblendMobile> initialize([FireblendConfiguration config]) async {
    FirebaseApp app = config == null ? FirebaseApp.instance
        : await FirebaseApp.appNamed(config.projectId);
    if (app == null) {
      var googleApiKey = Platform.isAndroid
          ? config.androidGoogleAppId
          : config.iosGoogleAppId;
      app = await FirebaseApp.configure(
        name: config.projectId,
        options: new FirebaseOptions(
          googleAppID: googleApiKey,
          gcmSenderID: config.messageSenderId,
          projectID: config.projectId,
          databaseURL: config.databaseUrl,
          storageBucket: config.storageBucket,
          apiKey: config.apiKey,
          bundleID: config.bundleId,
        ),
      );
    }
    return FireblendMobile._internal(app);
  }


  @override
  FireblendAnalyticsMobile get analytics => FireblendAnalyticsMobile();

  @override
  FireblendAuthMobile get auth => FireblendAuthMobile(_app);

  @override
  FireblendDatabaseMobile get database => FireblendDatabaseMobile(_app);

  @override
  FireblendMessagingMobile get messaging => FireblendMessagingMobile();

  @override
  FireblendStorageMobile get storage => FireblendStorageMobile(_app);
}