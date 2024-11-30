import 'package:base_app/features/daily_news/data/data_sources/local/DAO/article_dao.dart';
import 'package:base_app/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  AriticalDao get articleDao;
}
