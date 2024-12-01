import 'package:base_app/core/usecases/usecase.dart';
import 'package:base_app/features/daily_news/domain/entities/article.dart';
import 'package:base_app/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase implements Usecase<void, ArticleEntity> {
  SaveArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
