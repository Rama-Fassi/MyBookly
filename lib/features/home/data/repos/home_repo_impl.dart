import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/core/errors/failuers.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      // return left(ServerFailure(errMessage: e.toString()));
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=computer science');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=computer science');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}


// featuredBooks = All Books