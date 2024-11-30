import 'package:base_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:base_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:base_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> intializeInjectionContainer() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // Use cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Blocs
  sl.registerSingleton<RemoteArticleBloc>(RemoteArticleBloc(sl()));
}
