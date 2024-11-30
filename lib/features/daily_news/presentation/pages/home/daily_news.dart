import 'package:base_app/features/daily_news/domain/entities/article.dart';
import 'package:base_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:base_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

_buildAppBar() {
  return AppBar(
    title: const Text(
      'Daily News',
      style: TextStyle(color: Colors.black),
    ),
  );
}

_buildBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(builder: (_, state) {
    if (state is RemoteArticleLoading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (state is RemoteArticleFailed) {
      return const Center(child: Icon(Icons.refresh));
    }
    if (state is RemoteArticleSuccess) {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: state.articles!.length,
        itemBuilder: (context, index) {
          final article = state.articles![index];
          return _buildItemArticle(article);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      );
    }
    return const SizedBox();
  });
}

Widget _buildItemArticle(ArticleEntity article) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        SizedBox(
          width: 110,
          height: 80,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              article.urlToImage ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, url, error) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            children: [
              Text(
                article.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                article.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
