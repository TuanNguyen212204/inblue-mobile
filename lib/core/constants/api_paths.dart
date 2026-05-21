/// REST path constants — parity with web `api.config.ts`.
abstract final class ApiPaths {
  static const authLogin = '/api/auth/login';
  static const authLoginGoogle = '/api/auth/login-with-google';

  static const notifications = '/api/notifications';
  static String notificationMarkRead(String id) =>
      '/api/notifications/check-read/$id';

  // AI Interview — extend per OpenAPI / INBLUE_MOBILE_GUIDE.md
  static const aiInterviewSessions = '/api/interview-sessions';

  // Mock Interview
  static const mockSessions = '/api/sessions';
}
