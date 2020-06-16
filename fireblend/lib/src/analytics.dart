abstract class FireblendAnalytics {
  Future<void> logEvent({ String name, Map<String, dynamic> parameters});
  Future<void> setScreenName({ String screenName });
  Future<void> setUserId(String id);
  Future<void> logAppOpen(String id);
  Future<void> logSearch({String searchTerm, Map<String, dynamic> params});
  Future<void> logViewSearchResults({String searchTerm, Map<String, dynamic> params});
}