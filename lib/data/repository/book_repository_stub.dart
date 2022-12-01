// import 'package:bookstore/domain/dto/author_response.dart';
// import 'package:bookstore/domain/dto/book_response.dart';
// import 'package:bookstore/domain/dto/genre_response.dart';
// import 'package:bookstore/domain/dto/media_response.dart';
// import 'package:bookstore/domain/repository/book_repository.dart';
// import 'package:dartz/dartz.dart';
// import 'package:bookstore/util/failure_helper.dart';

// class BookRepositoryStub implements BookRepository {
//   BookRepositoryStub._internal();

//   factory BookRepositoryStub() => _instance;

//   static final BookRepositoryStub _instance = BookRepositoryStub._internal();

//   @override
//   Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithLimit({
//     int limit = 10,
//     BookResponse? latestBook,
//   }) async {
//     return Right(
//       <BookResponse>[
//         BookResponse(
//           authors: const <AuthorResponse>[
//             AuthorResponse(
//               id: '1',
//               description: 'siapa ya',
//               name: 'arthur',
//             ),
//           ],
//           deletedAt: DateTime.now(),
//           genres: const <GenreResponse>[
//             GenreResponse(
//               id: '1',
//               name: 'gentle',
//             ),
//           ],
//           id: '1',
//           medias: const <MediaResponse>[
//             MediaResponse(
//                 id: '1',
//                 url: 'https://magdalene.co/storage/media/Doraemon3%20copy.jpg')
//           ],
//           overview: 'hahaha',
//           price: 100000000000,
//           promoId: '1',
//           releasedDate: DateTime.now(),
//           title: 'buku baru',
//         ),
//       ],
//     );
//   }

//   @override
//   Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithAnyPromo({
//     required List<String> promoIds,
//   }) async {
//     return Right(
//       <BookResponse>[
//         BookResponse(
//           authors: const <AuthorResponse>[
//             AuthorResponse(
//               id: '1',
//               description: 'siapa ya',
//               name: 'arthur',
//             ),
//           ],
//           deletedAt: DateTime.now(),
//           genres: const <GenreResponse>[
//             GenreResponse(
//               id: '1',
//               name: 'gentle',
//             ),
//           ],
//           id: '1',
//           medias: const <MediaResponse>[
//             MediaResponse(
//                 id: '1',
//                 url: 'https://magdalene.co/storage/media/Doraemon3%20copy.jpg')
//           ],
//           overview: 'hahaha',
//           price: 100000000000,
//           promoId: '1',
//           releasedDate: DateTime.now(),
//           title: 'buku baru',
//         ),
//       ],
//     );
//   }

//   @override
//   Future<Either<Failure, BookResponse>> fetchBook({
//     required String id,
//   }) async {
//     return Right(
//       BookResponse(
//         authors: const <AuthorResponse>[
//           AuthorResponse(
//             id: '1',
//             description: 'siapa ya',
//             name: 'arthur',
//           ),
//         ],
//         deletedAt: DateTime.now(),
//         genres: const <GenreResponse>[
//           GenreResponse(
//             id: '1',
//             name: 'gentle',
//           ),
//         ],
//         id: '1',
//         medias: const <MediaResponse>[
//           MediaResponse(
//               id: '1',
//               url: 'https://magdalene.co/storage/media/Doraemon3%20copy.jpg')
//         ],
//         overview: 'hahaha',
//         price: 100000000000,
//         promoId: '1',
//         releasedDate: DateTime.now(),
//         title: 'buku baru',
//       ),
//     );
//   }
// }
