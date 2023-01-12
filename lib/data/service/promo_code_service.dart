import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/promo_code_service.pbgrpc.dart';

class PromoCodeService {
  PromoCodeService._internal();
  static final PromoCodeService _instance = PromoCodeService._internal();

  factory PromoCodeService() => _instance;
  static PromoCodeService get instance => _instance;

  late PromoCodeServiceClient _promoCodeServiceClient;

  Future<void> init(ClientChannel channel) async {
    _createChannel(channel);
  }

  PromoCodeServiceClient get promoCodeServiceClient {
    return _promoCodeServiceClient;
  }

  void _createChannel(ClientChannel channel) {
    _promoCodeServiceClient = PromoCodeServiceClient(channel);
  }
}
