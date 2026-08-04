abstract final class RoutePaths {
  static const kioskEntry = '/';
  static const aiInterviewSession = '/session/:sessionKey';

  static String aiInterviewSessionPath(String sessionKey) =>
      '/session/${Uri.encodeComponent(sessionKey)}';
}
