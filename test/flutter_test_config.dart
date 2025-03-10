import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> testExecutable(Future<void> Function() testMain) async {
  await dotenv.load(fileName: ".env");
  await testMain();
}
