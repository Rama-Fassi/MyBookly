part of 'newset_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends NewestBooksState {}

class NewsetBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksSuccess(this.books);
}

class NewsetBooksFailure extends NewestBooksState {
  final String errMessage;

  const NewsetBooksFailure(this.errMessage);
}
