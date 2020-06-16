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
  Future<void> logAppOpen() async {
    analytics.logEvent('app_open', {});
  }

  @override
  Future<void> logSearch({String searchTerm, Map<String, dynamic> params}) async {
    await analytics.logEvent('search', {'searchTerm': searchTerm, ...params});
  }

  @override
  Future<void> logViewSearchResults({String searchTerm, Map<String, dynamic> params}) async {
    analytics.logEvent('view_search_results', {'searchTerm': searchTerm, ...params});
  }

  @override
  Future<void> logGenerateLead({String currency, double value, Map<String, dynamic> params}) async {
    return logEvent(
      name: 'generate_lead',
      parameters: {'currency': currency, 'value': value, ...params},
    );
  }
}
