import 'package:base_app/features/daily_news/domain/usecases/get_save_article.dart';
import 'package:base_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:base_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_article_event.dart';
import 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSaveArticleUseCase _getSaveArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSaveArticleUseCase, this._saveArticleUseCase, this._removeArticleUseCase) : super(const LocalArticleLoading()) {
    on<GetSaveArticleEvent>(onGetSaveArticles);
    on<RemoveArticleEvent>(onRemoveArticle);
    on<SaveArticleEvent>(onSaveArticle);
  }

  void onGetSaveArticles(GetSaveArticleEvent event, Emitter<LocalArticleState> emit) async {
    final article = await _getSaveArticleUseCase();
    emit(LocalArticleSuccess(article));
  }

  void onRemoveArticle(RemoveArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: event.article);
    final articles = await _getSaveArticleUseCase();
    emit(LocalArticleSuccess(articles));
  }

  void onSaveArticle(SaveArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: event.article);
    final articles = await _getSaveArticleUseCase();
    emit(LocalArticleSuccess(articles));
  }
}
