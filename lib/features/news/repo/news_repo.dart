import 'package:dartz/dartz.dart';
import 'package:taskapp/core/helpers/failure.dart';
import 'package:taskapp/core/helpers/response_decoder.dart';
import 'package:taskapp/core/network/base_client.dart';
import 'package:taskapp/features/news/models/news_model.dart';

class NewsRepo {
  final NewsAppBaseClient _client;
  NewsRepo(this._client);

  //fetch news and handle response
  Future<Either<NewsModel, Failure>> fetchNews() async {
    final response = await _client.getRequest(path: "", shouldCache: true);
    return getResponseData(response)
        .fold((l) => Left(NewsModel.fromJson(l)), (r) => Right(r));
  }
}
