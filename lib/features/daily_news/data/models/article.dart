import 'package:base_app/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'articles', primaryKeys: [''])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    SourceModel? super.source,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> articleModelData) {
    var b = ArticleModel(
      source: SourceModel.fromJson(articleModelData['source']),
      title: articleModelData['title'] ?? "",
      author: articleModelData['author'] ?? "",
      description: articleModelData['description'] ?? "",
      url: articleModelData['url'] ?? "",
      urlToImage: articleModelData['urlToImage'] ?? "",
      publishedAt: articleModelData['publishedAt'] ?? "",
      content: articleModelData['content'] ?? "",
    );
    return b;
  }
}

class SourceModel extends SourceEntity {
  const SourceModel({super.id, super.name});

  factory SourceModel.fromJson(Map<String, dynamic> sourceModelData) {
    return SourceModel(
      id: sourceModelData['id'] ?? "",
      name: sourceModelData['name'] ?? "",
    );
  }
}
