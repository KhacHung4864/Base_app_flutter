import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  const LocalArticleEvent({this.article});

  final ArticleEntity? article;

  @override
  List<Object?> get props => [article];
}

class SaveArticleEvent extends LocalArticleEvent {
  const SaveArticleEvent({required ArticleEntity article}) : super(article: article);
}

class RemoveArticleEvent extends LocalArticleEvent {
  const RemoveArticleEvent({required ArticleEntity article}) : super(article: article);
}

class GetSaveArticleEvent extends LocalArticleEvent {
  const GetSaveArticleEvent();
}
