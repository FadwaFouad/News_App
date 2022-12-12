import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/view/bloc/article_event.dart';
import 'package:news_app/features/articles/view/bloc/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleState()) {
    on<ArticleEvent>(_fetchArticles);
  }

  Future<void> _fetchArticles(
      ArticleEvent event, Emitter<ArticleState> emit) async {
    var listOfArticles = await state.getArticles();
    var newState = ArticleState(listOfArticles: listOfArticles);
    emit(newState);
  }
}
