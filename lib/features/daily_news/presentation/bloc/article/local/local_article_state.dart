import 'package:base_app/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleState extends Equatable {
  const LocalArticleState({this.articles, this.error});

  final List<ArticleEntity>? articles;
  final DioException? error;

  @override
  List<Object?> get props => [articles, error];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();
}

class LocalArticleSuccess extends LocalArticleState {
  const LocalArticleSuccess(List<ArticleEntity> articles) : super(articles: articles);
}

class LocalArticleFailed extends LocalArticleState {
  const LocalArticleFailed(DioException error) : super(error: error);
}
