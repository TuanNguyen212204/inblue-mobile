/// Central route path constants for GoRouter.
abstract final class RoutePaths {
  static const splash = '/';
  static const login = '/login';

  static const dashboard = '/user';
  static const aiInterviewList = '/user/ai-interview';
  static const aiInterviewSetup = '/user/ai-interview/setup';
  static const aiInterviewSession = '/user/ai-interview/session/:sessionId';
  static const aiInterviewResult = '/user/ai-interview/result/:sessionId';

  static const mockInterviewList = '/user/mock-interview';
  static const mockInterviewSchedule = '/user/mock-interview/schedule';
  static const mockInterviewRoom = '/user/mock-interview/room/:sessionId';

  static const notifications = '/user/notifications';
  static const profile = '/user/profile';
}
