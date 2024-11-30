import 'package:base_app/core/resources/data_state.dart';
import 'package:base_app/core/usecases/usecase.dart';
import 'package:base_app/features/daily_news/domain/entities/article.dart';
import 'package:base_app/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements Usecase<DataState<List<ArticleEntity>>, void> {
  GetArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
