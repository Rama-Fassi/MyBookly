import 'package:dartz/dartz.dart';
import 'package:my_bookly/core/errors/failuers.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchResultBooks(
      {required String category});
}
