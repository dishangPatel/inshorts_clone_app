import 'package:get_it/get_it.dart';
import 'package:inshorts_clone/viewModels/newsModel.dart';

  final GetIt locator = GetIt.instance;
  void setupLocator()
  {
    locator.registerLazySingleton<NewsModel>(()=>NewsModel());
  } 