import 'package:flutter_test/flutter_test.dart';
import 'package:comments/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CommentsServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
