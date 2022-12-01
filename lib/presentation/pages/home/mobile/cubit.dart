import 'package:bookstore/domain/controller/home_view_controller.dart';
import 'package:bookstore/domain/model/event_model.dart';
import 'package:bookstore/domain/model/promo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

import 'state.dart';

class HomeMobileCubit extends Cubit<HomeMobileState> {
  HomeMobileCubit({
    required HomeViewController homeViewController,
  })  : _homeViewController = homeViewController,
        super(const HomeMobileState().init());

  final HomeViewController _homeViewController;

  Future<void> load() async {
    emit(const HomeMobileLoading());

    final Either<Failure, List<PromoModel>> promoRes =
        await _homeViewController.getAllPromoWithBooks();

    promoRes.fold(
      (Failure l) => emit(
        HomeMobileFailure(
          message: l.message,
        ),
      ),
      (List<PromoModel> promos) async {
        final Either<Failure, List<EventModel>> eventRes =
            await _homeViewController.getAllEvents();

        eventRes.fold(
          (Failure l) => emit(
            HomeMobileFailure(
              message: l.message,
            ),
          ),
          (List<EventModel> events) {
            final HomeMobileLoaded model = HomeMobileLoaded(
              promos: promos,
              events: events,
            );

            emit(model);
          },
        );
      },
    );
  }
}
