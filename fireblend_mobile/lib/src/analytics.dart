import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fireblend/fireblend.dart';


class FireblendAnalyticsMobile extends FireblendAnalytics {
  FirebaseAnalytics _analytics;

  FireblendAnalyticsMobile() : _analytics = FirebaseAnalytics();

  FirebaseAnalytics get analytics => _analytics;

  @override
  Future<void> logEvent({ String name, Map<String, dynamic> parameters}) async {
    await analytics.logEvent(name: name, parameters: parameters);
  }

  @override
  Future<void> setScreenName({ String screenName }) async {
    await analytics.setCurrentScreen(screenName: screenName, screenClassOverride: screenName);
  }

  @override
  Future<void> setUserId(String id) async {
    await analytics.setUserId(id);
  }

  @override
  Future<void> logAppOpen() async {
    await analytics.logAppOpen();
  }

  @override
  Future<void> logSearch(String searchTerm) async {
    await analytics.logSearch(searchTerm: searchTerm);
  }

  @override
  Future<void> logViewSearchResults(String searchTerm) async {
    await analytics.logViewSearchResults(searchTerm: searchTerm, );
  }
}