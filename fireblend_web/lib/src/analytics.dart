import 'dart:async';

import 'package:firebase/firebase.dart' as fb;

import 'package:fireblend/fireblend.dart';

class FireblendAnalyticsWeb extends FireblendAnalytics {
  fb.Analytics _analytics;

  FireblendAnalyticsWeb(fb.App app) : _analytics = fb.analytics(app);

  fb.Analytics get analytics => _analytics;

  @override
  Future<void> logEvent({ String name, Map<String, dynamic> parameters}) async {
    _analytics.logEvent(name, parameters);
  }

}