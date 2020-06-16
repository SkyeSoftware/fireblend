import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fireblend/fireblend.dart';


class FireblendAnalyticsMobile extends FireblendAnalytics {
  FirebaseAnalytics _analytics;

  FireblendAnalyticsMobile(FirebaseApp app) : _analytics = FirebaseAnalytics();

  FirebaseAnalytics get analytics => _analytics;

  Future<void> logEvent({ String name, Map<String, dynamic> parameters}) async {
    await analytics.logEvent(name: name, parameters: parameters);
  }

}