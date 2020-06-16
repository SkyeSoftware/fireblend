import 'dart:async';

import 'package:firebase/firebase.dart' as fb;
import 'package:fireblend/fireblend.dart';

class FireblendAnalyticsWeb extends FireblendAnalytics {
  fb.Analytics _analytics;

  FireblendAnalyticsWeb({fb.App app})
      : _analytics = app != null ? fb.analytics(app) : fb.analytics();

  fb.Analytics get analytics => _analytics;

  @override
  Future<void> logEvent({String name, Map<String, dynamic> parameters}) async {
    analytics.logEvent(name, parameters);
  }

  @override
  Future<void> setScreenName({String screenName}) async {
    analytics.setCurrentScreen(screenName);
  }

  @override
  Future<void> setUserId(String id) async {
    analytics.setUserId(id);
  }

  @override
  Future<void> logAppOpen(String id) async {
    analytics.logEvent('app_open', {});
  }

  @override
  Future<void> logSearch(String searchTerm) async {
    await analytics.logEvent('search', {
      'searchTerm': searchTerm,
    });
  }

  @override
  Future<void> logViewSearchResults(String searchTerm) async {
    analytics.logEvent('view_search_results', {
      'searchTerm': searchTerm,
    });
  }
}
