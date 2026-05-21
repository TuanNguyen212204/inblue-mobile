abstract final class RoutePaths {
  static const splash = '/';
  static const login = '/login';

  static const dashboard = '/user';
  static const aiInterviewList = '/user/ai-interview';
  static const aiInterviewSetup = '/user/ai-interview/setup';
  static const aiInterviewSession = '/user/ai-interview/session/:sessionKey';
  static const aiInterviewResult = '/user/ai-interview/result/:sessionId';

  static const mockInterviewList = '/user/mock-interview';
  static const mockInterviewSchedule = '/user/mock-interview/schedule';
  static const mockInterviewBookingSuccess =
      '/user/mock-interview/booking-success';
  static const mockInterviewHistory = '/user/mock-interview/history/:sessionId';
  static const mockInterviewRoom = '/user/mock-interview/room/:sessionId';
  static const mockInterviewFeedback =
      '/user/mock-interview/history/:sessionId/feedback';

  static const notifications = '/user/notifications';
  static const profile = '/user/profile';

  static String aiInterviewSessionPath(String sessionKey) =>
      '/user/ai-interview/session/$sessionKey';

  static String aiInterviewResultPath(int sessionId) =>
      '/user/ai-interview/result/$sessionId';

  static String mockInterviewHistoryPath(int sessionId) =>
      '/user/mock-interview/history/$sessionId';

  static String mockInterviewRoomPath(int sessionId) =>
      '/user/mock-interview/room/$sessionId';

  static String mockInterviewFeedbackPath(int sessionId) =>
      '/user/mock-interview/history/$sessionId/feedback';
}
