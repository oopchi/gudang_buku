import 'dart:io';

import 'package:gudang_buku/domain/dto/newsletter_response.dart';
import 'package:gudang_buku/domain/dto/transaction_response.dart';
import 'package:gudang_buku/domain/repository/newsletter_repository.dart';
import 'package:gudang_buku/domain/repository/transaction_repository.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class NewsletterRepositoryFS implements NewsletterRepository {
  NewsletterRepositoryFS._internal();

  factory NewsletterRepositoryFS() => _instance;

  static final NewsletterRepositoryFS _instance =
      NewsletterRepositoryFS._internal();

  final CollectionReference newsletters =
      FirebaseFirestore.instance.collection('newsletters');

  @override
  Future<Either<Failure, List<NewsletterResponse>>>
      fetchAllNewsletters() async {
    try {
      return await newsletters.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return NewsletterResponse.fromJson(data);
          }).toList());
        },
        onError: (e) => Left(DatabaseFailure(e.toString())),
      );
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> addNewsletterSubscriber({
    required String email,
  }) async {
    try {
      return await newsletters
          .where(
            'email',
            isEqualTo: email,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) async {
          final List<QueryDocumentSnapshot<Object?>> docs = result.docs;

          if (docs.isNotEmpty) return Right(docs[0].id);

          final NewsletterResponse newsletterResponse = NewsletterResponse(
            email: email,
          );

          return await newsletters
              .add(newsletterResponse.toJson())
              .then((DocumentReference<Object?> value) => Right(value.id));
        },
        onError: (e) => Left(DatabaseFailure(e.toString())),
      );
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
