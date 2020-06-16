import 'dart:async';

import 'package:firebase/firebase.dart' as fb;
import 'package:fireblend/fireblend.dart';

class FireblendAnalyticsWeb extends FireblendAnalytics {
  fb.Analytics _analytics;

  FireblendAnalyticsWeb(fb.App app) : _analytics = fb.analytics(app);

  fb.Analytics get analytics => _analytics;

  @override
  Future<void> logEvent({String name, Map<String, dynamic> parameters}) async {
    _analytics.logEvent(name, parameters);
  }

  @override
  Future<void> setScreenName({String screenName}) async {
    _analytics.setCurrentScreen(screenName);
  }

  @override
  Future<void> setUserId(String id) async {
    _analytics.setUserId(id);
  }

  @override
  Future<void> logAppOpen(String id) async {
    _analytics.logEvent('app_open', {});
  }

  @override
  Future<void> logSearch(String searchTerm) async {
    await analytics.logEvent('search', {
      'searchTerm': searchTerm,
    });
  }

  @override
  Future<void> logViewSearchResults(String searchTerm) async {
    _analytics.logEvent('view_search_results', {
      'searchTerm': searchTerm,
    });
  }
}
