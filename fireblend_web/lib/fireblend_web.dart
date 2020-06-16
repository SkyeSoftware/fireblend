library fireblend_web;

export 'src/analytics.dart';
export 'src/authentication.dart';
export 'src/database.dart';
export 'src/messaging.dart';
export 'src/storage.dart';

import 'dart:async';

import 'package:firebase/firebase.dart' as fb;
import 'package:fireblend/fireblend.dart';

import 'src/analytics.dart';
import 'src/authentication.dart';
import 'src/database.dart';
import 'src/messaging.dart';
import 'src/storage.dart';

class FireblendWeb extends Fireblend{
  fb.App _app;

  FireblendWeb._internal(this._app);

  fb.App get app => _app;

  static Future<FireblendWeb> initialize([FireblendConfiguration config]) async {
    fb.App app;
    try {
      app = fb.app(config.projectId);
    } catch (e) {
      app = fb.initializeApp(
          appId: config.appId,
          apiKey: config.apiKey,
          measurementId: config.measurementId,
          authDomain: config.authDomain,
          databaseURL: config.databaseUrl,
          projectId: config.projectId,
          storageBucket: config.storageBucket,
          messagingSenderId: config.messageSenderId,
          name: config.projectId
      );
    }
    return FireblendWeb._internal(app);
  }

  @override
  FireblendAnalyticsWeb get analytics => FireblendAnalyticsWeb(_app);

  @override
  FireblendAuthWeb get auth => FireblendAuthWeb(_app);

  @override
  FireblendDatabaseWeb get database => FireblendDatabaseWeb(_app);

  @override
  FireblendMessagingWeb get messaging => FireblendMessagingWeb(_app);

  @override
  FireblendStorageWeb get storage => FireblendStorageWeb(_app);
}