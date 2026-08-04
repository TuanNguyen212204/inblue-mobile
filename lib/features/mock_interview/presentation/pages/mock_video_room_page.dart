import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inblue_mobile/core/router/route_paths.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/mock_interview/data/datasources/mock_interview_remote_datasource.dart';
import 'package:inblue_mobile/features/mock_interview/presentation/providers/mock_interview_providers.dart';
import 'package:inblue_mobile/shared/presentation/widgets/app_error_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MockVideoRoomPage extends ConsumerStatefulWidget {
  const MockVideoRoomPage({required this.sessionId, super.key});

  final int sessionId;

  @override
  ConsumerState<MockVideoRoomPage> createState() => _MockVideoRoomPageState();
}

class _MockVideoRoomPageState extends ConsumerState<MockVideoRoomPage> {
  WebViewController? _controller;
  bool _isMicMuted = false;
  bool _isCameraOff = false;

  void _toggleMic() {
    setState(() => _isMicMuted = !_isMicMuted);
    _controller?.runJavaScript('''
      if (window.DailyIframe) {
        const call = window.DailyIframe.getCallInstance();
        if (call) call.setLocalAudio(${!_isMicMuted});
      }
    ''');
  }

  void _toggleCamera() {
    setState(() => _isCameraOff = !_isCameraOff);
    _controller?.runJavaScript('''
      if (window.DailyIframe) {
        const call = window.DailyIframe.getCallInstance();
        if (call) call.setLocalVideo(${!_isCameraOff});
      }
    ''');
  }

  @override
  Widget build(BuildContext context) {
    final sessionAsync = ref.watch(mockSessionDetailProvider(widget.sessionId));

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _confirmLeave(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Phòng video'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => _confirmLeave(context),
              icon: const Icon(Icons.call_end, color: Colors.red),
            ),
          ],
        ),
        body: sessionAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => AppErrorView(
            message: e.toString(),
            onRetry: () =>
                ref.invalidate(mockSessionDetailProvider(widget.sessionId)),
          ),
          data: (session) {
            final url = normalizeRoomUrl(session.roomUrl);
            if (url.isEmpty) {
              return const AppErrorView(
                message: 'Phòng chưa sẵn sàng hoặc đã hết hạn',
              );
            }
            _controller ??= WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(url))
              ..setNavigationDelegate(
                NavigationDelegate(
                  onPageFinished: (_) => _onJoined(session.roomName),
                ),
              );

            return Stack(
              children: [
                WebViewWidget(controller: _controller!),
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 24,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: _toggleMic,
                          style: IconButton.styleFrom(
                            backgroundColor: _isMicMuted ? Colors.red.shade700 : Colors.white24,
                            foregroundColor: Colors.white,
                          ),
                          icon: Icon(_isMicMuted ? Icons.mic_off : Icons.mic),
                        ),
                        IconButton(
                          onPressed: _toggleCamera,
                          style: IconButton.styleFrom(
                            backgroundColor: _isCameraOff ? Colors.red.shade700 : Colors.white24,
                            foregroundColor: Colors.white,
                          ),
                          icon: Icon(_isCameraOff ? Icons.videocam_off : Icons.videocam),
                        ),
                        IconButton(
                          onPressed: () => _confirmLeave(context),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.call_end),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _onJoined(String? roomName) async {
    if (roomName == null || roomName.isEmpty) return;
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    try {
      await ref.read(mockInterviewRemoteProvider).joinSession(
            sessionName: roomName,
            userId: userId,
            participantId: 'mobile_${DateTime.now().millisecondsSinceEpoch}',
            isMentor: false,
          );
    } catch (_) {
      // Non-blocking — BE may accept alternate field names
    }
  }

  Future<void> _confirmLeave(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Rời phòng?'),
        content: const Text('Bạn có chắc muốn kết thúc buổi phỏng vấn?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Ở lại')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Rời phòng')),
        ],
      ),
    );
    if (ok == true && context.mounted) {
      context.go(RoutePaths.mockInterviewList);
    }
  }
}
