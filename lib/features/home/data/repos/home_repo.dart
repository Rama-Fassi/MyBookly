import 'package:dartz/dartz.dart';
import 'package:my_bookly/core/errors/failuers.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}


// Future<Either<Failure,List<BookModel>>> (this is the type for the method)

// Repo ? create an abstract class and define a methods , these methods tell us 
//what can this featured do (what is featured methods , actions (that will be execute , implement)),