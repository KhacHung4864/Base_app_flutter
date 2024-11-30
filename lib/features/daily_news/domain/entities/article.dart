import 'package:equatable/equatable.dart';

//cho phép so sánh các đối tượng ArticleEntity với nhau dựa trên giá trị của từng thuộc tính, chứ không phải dựa trên tham chiếu.
class ArticleEntity extends Equatable {
  final SourceEntity? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props {
    return [
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}

class SourceEntity extends Equatable {
  final String? id;
  final String? name;

  const SourceEntity({this.id, this.name});

  @override
  List<Object?> get props {
    return [id, name];
  }
}
