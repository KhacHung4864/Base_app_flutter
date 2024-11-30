import 'package:floor/floor.dart';

import '../../../models/article.dart';

@dao
abstract class AriticalDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getArticles();
}
