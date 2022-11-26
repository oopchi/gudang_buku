import 'package:bookstore/domain/model/genre_response.dart';
import 'package:bookstore/domain/repository/genre_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

class GenreRepositoryFS implements GenreRepository {
  GenreRepositoryFS._internal();

  factory GenreRepositoryFS() => _instance;

  static final GenreRepositoryFS _instance = GenreRepositoryFS._internal();

  final CollectionReference genres =
      FirebaseFirestore.instance.collection('genres');

  @override
  Future<Either<Failure, List<GenreResponse>>> fetchAllGenres({
    GenreResponse? latestGenre,
  }) async {
    return await genres.limit(10).startAfter(<Object?>[latestGenre]).get().then(
          (QuerySnapshot<Object?> result) {
            return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
              final Map<String, dynamic> data =
                  e.data() as Map<String, dynamic>;

              data['id'] = e.reference.id;

              return GenreResponse.fromJson(data);
            }).toList());
          },
          onError: (e) => Left(DatabaseFailure(e.toString())),
        );
  }
}
