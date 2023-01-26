import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/book_response.pb.dart';
import 'package:gudang_buku/domain/dto/book_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/discovery_request.pb.dart';
import 'package:gudang_buku/domain/dto/discovery_response.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/discovery_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/pagination_response.pb.dart';
import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:gudang_buku/domain/model/book_model.dart';
import 'package:gudang_buku/domain/model/discovery_model.dart';
import 'package:gudang_buku/domain/model/genre_model.dart';
import 'package:gudang_buku/service/discovery_service.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:gudang_buku/util/file_streamer.dart';

class DiscoveryServiceImpl implements DiscoveryService {
  const DiscoveryServiceImpl({
    required DiscoveryServiceClient discoveryServiceClient,
  }) : _discoveryServiceClient = discoveryServiceClient;

  final DiscoveryServiceClient _discoveryServiceClient;

  @override
  Future<Either<Failure, List<DiscoveryModel>>> getAllDiscoveries() async {
    try {
      final Map<int, DiscoveryResponse> discoveryMap =
          <int, DiscoveryResponse>{};

      final Map<int, Map<int, BookResponse>> bookMapMap =
          <int, Map<int, BookResponse>>{};

      final Map<int, PaginationResponse> paginationMap =
          <int, PaginationResponse>{};

      final ResponseStream<DiscoveryResponse> response =
          _discoveryServiceClient.listDiscoveries(ListDiscoveryRequest());

      await for (final DiscoveryResponse discovery in response) {
        final int key = discovery.id.toInt();
        discoveryMap[key] ??= DiscoveryResponse();

        switch (discovery.whichData()) {
          case DiscoveryResponse_Data.content:
            discoveryMap[key]?.content = discovery.content;
            break;
          case DiscoveryResponse_Data.imageData:
            final Either<Failure, void> res =
                discoveryMap[key]!.imageData.add(discovery.imageData);

            if (res.isLeft()) {
              return Left(res.asLeft());
            }
            break;
          case DiscoveryResponse_Data.book:
            bookMapMap[key] ??= <int, BookResponse>{};
            bookMapMap[key]![discovery.book.id.toInt()] ??= BookResponse();
            switch (discovery.book.whichData()) {
              case BookResponse_Data.imageData:
                final Either<Failure, void> res = discoveryMap[key]!
                    .book
                    .imageData
                    .add(discovery.book.imageData);
                if (res.isLeft()) {
                  return Left(res.asLeft());
                }
                break;
              case BookResponse_Data.content:
                bookMapMap[key]![discovery.book.id.toInt()]!.content =
                    discovery.book.content;
                break;
              case BookResponse_Data.pagination:
                paginationMap[key] = discovery.book.pagination;
                break;
              case BookResponse_Data.notSet:
                break;
            }
            break;
          case DiscoveryResponse_Data.notSet:
            break;
          default:
        }
      }

      final List<DiscoveryModel> discoveryModels =
          discoveryMap.entries.map((MapEntry<int, DiscoveryResponse> e) {
        final DateTime? updatedAt = e.value.content.hasUpdatedAt()
            ? e.value.content.updatedAt.toDateTime()
            : null;

        final List<BookModel> books = bookMapMap[e.value.id]?.entries.map((e) {
              final DateTime? updatedAt = e.value.content.hasUpdatedAt()
                  ? e.value.content.updatedAt.toDateTime()
                  : null;

              final List<AuthorModel> authors =
                  e.value.content.authors.asMap().entries.map(
                (e) {
                  final DateTime? updatedAt = e.value.hasUpdatedAt()
                      ? e.value.updatedAt.toDateTime()
                      : null;

                  return AuthorModel(
                    name: e.value.name,
                    id: e.value.id.toInt(),
                    createdAt: e.value.createdAt.toDateTime(),
                    updatedAt: updatedAt,
                  );
                },
              ).toList();

              final List<GenreModel> genres =
                  e.value.content.genres.asMap().entries.map(
                (e) {
                  final DateTime? updatedAt = e.value.hasUpdatedAt()
                      ? e.value.updatedAt.toDateTime()
                      : null;

                  return GenreModel(
                    name: e.value.name,
                    id: e.value.id.toInt(),
                    createdAt: e.value.createdAt.toDateTime(),
                    updatedAt: updatedAt,
                  );
                },
              ).toList();

              return BookModel(
                id: e.value.id.toInt(),
                title: e.value.content.title,
                averageRating: e.value.content.averageRating,
                createdAt: e.value.content.createdAt.toDateTime(),
                isRated: e.value.content.isRated,
                numOfBought: e.value.content.numOfBought.toInt(),
                numOfRating: e.value.content.numOfRating.toInt(),
                price: e.value.content.price,
                productStatus: e.value.content.productStatus,
                description: e.value.content.hasDescription()
                    ? e.value.content.description
                    : null,
                updatedAt: updatedAt,
                authors: authors,
                genres: genres,
                file: e.value.imageData,
                stock:
                    e.value.content.hasStock() ? e.value.content.stock : null,
                weight:
                    e.value.content.hasWeight() ? e.value.content.weight : null,
              );
            }).toList() ??
            [];

        return DiscoveryModel(
          id: e.value.id.toInt(),
          displayOrder: e.value.content.displayOrder,
          createdAt: e.value.content.createdAt.toDateTime(),
          updatedAt: updatedAt,
          file: e.value.imageData,
          books: books,
        );
      }).toList();

      return Right(discoveryModels);
    } on GrpcError catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      Left(ServerFailure(e.toString()));
    }

    return Left(ServerFailure('hi'));
  }
}
