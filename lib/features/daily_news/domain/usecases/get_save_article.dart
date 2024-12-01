import 'package:base_app/core/usecases/usecase.dart';
import 'package:base_app/features/daily_news/domain/entities/article.dart';
import 'package:base_app/features/daily_news/domain/repository/article_repository.dart';

class GetSaveArticleUseCase implements Usecase<List<ArticleEntity>, void> {
  GetSaveArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
