import 'package:get_it/get_it.dart';
import 'package:sports_injury_app/features/possible_injuries/data/repo/injury_repo_impl.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<InjuriesRepoImpl>(InjuriesRepoImpl());
}
