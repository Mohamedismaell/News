import 'package:get_it/get_it.dart';
import 'package:news_app/core/injection/common_di.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await CommonDi.init();
  // HomeDi.init();
}
