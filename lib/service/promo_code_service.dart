import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/model/list_pagination_model.dart';
import 'package:gudang_buku/domain/model/promo_code_model.dart';
import 'package:gudang_buku/util/failure_helper.dart';

abstract class PromoCodeService {
  Future<Either<Failure, ListPaginationModel<PromoCodeModel>>>
      getAllOngoingPromoCodes({
    int? pageID,
    int? pageSize,
  });
}
