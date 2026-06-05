import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:circle_progress_bar/src/circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('circle_progress_bar');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  testWidgets('renders progress circle behind the child', (tester) async {
    await tester.pumpWidget(
      const CircleProgressBar(
        foregroundColor: Color(0xff000000),
        value: 0.5,
        child: SizedBox(width: 200, height: 200),
      ),
    );

    final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));

    expect(customPaint.painter, isA<CircleProgressBarPainter>());
    expect(customPaint.foregroundPainter, isNull);
  });
}
