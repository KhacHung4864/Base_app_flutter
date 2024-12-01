import 'package:base_app/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'articles', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> articleModelData) {
    return ArticleModel(
      id: articleModelData['id'] ?? 0,
      title: articleModelData['title'] ?? "",
      author: articleModelData['author'] ?? "",
      description: articleModelData['description'] ?? "",
      url: articleModelData['url'] ?? "",
      urlToImage: articleModelData['urlToImage'] ?? "",
      publishedAt: articleModelData['publishedAt'] ?? "",
      content: articleModelData['content'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity articleEntity) {
    return ArticleModel(
      id: articleEntity.id,
      author: articleEntity.author,
      title: articleEntity.title,
      description: articleEntity.description,
      url: articleEntity.url,
      urlToImage: articleEntity.urlToImage,
      publishedAt: articleEntity.publishedAt,
      content: articleEntity.content,
    );
  }
}
