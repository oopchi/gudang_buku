import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/book_service.pbgrpc.dart';

class BookService {
  BookService._internal();
  static final BookService _instance = BookService._internal();

  factory BookService() => _instance;
  static BookService get instance => _instance;

  late BookServiceClient _bookServiceClient;

  Future<void> init(ClientChannel channel) async {
    _createChannel(channel);
  }

  BookServiceClient get bookServiceClient {
    return _bookServiceClient;
  }

  void _createChannel(ClientChannel channel) {
    _bookServiceClient = BookServiceClient(channel);
  }
}
