import 'package:bookstore/domain/controller/home_view_controller.dart';
import 'package:bookstore/domain/model/event_model.dart';
import 'package:bookstore/domain/model/promo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

import 'state.dart';

class HomeMobileCubit extends Cubit<HomeMobileState> {
  HomeMobileCubit({
    required HomeViewController homeViewController,
    required this.isMounted,
  })  : _homeViewController = homeViewController,
        super(const HomeMobileLoading());

  final HomeViewController _homeViewController;

  final bool Function() isMounted;

  Future<void> load() async {
    final Either<Failure, List<PromoModel>> promoRes =
        await _homeViewController.getAllPromoWithBooks();

    if (!isMounted()) return;
    promoRes.fold(
      (Failure l) => emit(
        HomeMobileFailure(
          message: l.message,
        ),
      ),
      (List<PromoModel> promos) async {
        final Either<Failure, List<EventModel>> eventRes =
            await _homeViewController.getAllEvents();

        if (!isMounted()) return;
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

            if (!isMounted()) return;
            emit(model);
          },
        );
      },
    );
  }

  Future<void> onRefresh({
    required VoidCallback onComplete,
  }) async {
    await load();

    if (isMounted()) onComplete();
  }
}
