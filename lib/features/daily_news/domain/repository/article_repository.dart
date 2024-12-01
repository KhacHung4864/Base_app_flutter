import 'package:base_app/core/resources/data_state.dart';
import 'package:base_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // APi methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticale(ArticleEntity article);
}
