abstract class FireblendAnalytics {
  Future<void> logEvent({ String name, Map<String, dynamic> parameters});

}