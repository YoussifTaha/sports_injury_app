import 'package:get_it/get_it.dart';
import 'package:sports_injury_app/features/account_type/data/repos/account_type_repo_impl.dart';
import 'package:sports_injury_app/features/home/data/repos/home_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/mechanism/mechanism_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/physical_examination/physical_examination_repo_impl.dart';
import 'package:sports_injury_app/features/possible_injuries/data/repo/injury_repo_impl.dart';
import 'package:sports_injury_app/features/signup/data/repos/signup_repo_impl.dart';
import '../../features/injury_details/data/repos/tests/tests_repo_impl.dart';
import '../../features/injury_details/data/repos/treatment/treatment_repo_impl.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<InjuriesRepoImpl>(InjuriesRepoImpl());
  locator.registerSingleton<MechanismRepoImpl>(MechanismRepoImpl());
  locator.registerSingleton<TestsRepoImpl>(TestsRepoImpl());
  locator.registerSingleton<PhysicalExaminationRepoImpl>(
      PhysicalExaminationRepoImpl());
  locator.registerSingleton<TreatmentRepoImpl>(TreatmentRepoImpl());
  locator.registerSingleton<SignUpRepoImpl>(SignUpRepoImpl());
  locator.registerSingleton<AccountTypeRepoImpl>(AccountTypeRepoImpl());
  locator.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
}
