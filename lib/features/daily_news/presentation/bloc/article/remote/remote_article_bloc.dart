import 'package:base_app/core/resources/data_state.dart';
import 'package:base_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:base_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:base_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  final GetArticleUseCase _getArticleUseCase;

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleSuccess(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteArticleFailed(dataState.error!));
    }
  }
}
