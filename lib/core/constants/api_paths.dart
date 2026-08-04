/// REST paths used by the kiosk AI interview flow.
abstract final class ApiPaths {
  /// Gets cached interview state and validates a session key.
  static String interviewCache(String sessionKey) =>
      '/api/interview-sessions/cache/$sessionKey';

  /// Starts an interview after the device check.
  static String interviewStart(String sessionKey) =>
      '/api/v1/interview/start/$sessionKey';

  /// Submits an interview answer and receives the next question.
  static const interviewSubmit = '/api/v1/interview/submit';
}
