import 'package:inblue_mobile/core/errors/exceptions.dart';

/// Converts an exception caught in the presentation layer into
/// a user-facing Vietnamese string.
///
/// - [AppException] → uses the `message` field (already normalized by
///   [ErrorNormalizer] in the data layer).
/// - Any other [Object] → falls back to `.toString()` so we never lose
///   context during development.
extension ExceptionX on Object {
  String toUserMessage() =>
      this is AppException ? (this as AppException).message : toString();
}
