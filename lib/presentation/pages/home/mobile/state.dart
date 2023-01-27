import 'package:gudang_buku/domain/model/event_model.dart';
import 'package:gudang_buku/domain/model/promo_code_model.dart';
import 'package:equatable/equatable.dart';

class HomeMobileState extends Equatable {
  const HomeMobileState();

  HomeMobileState init() {
    return const HomeMobileState();
  }

  HomeMobileState clone() {
    return const HomeMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class HomeMobileLoading extends HomeMobileState {
  const HomeMobileLoading();
}

class HomeMobileFailure extends HomeMobileState {
  const HomeMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[];
}

class HomeMobileLoaded extends HomeMobileState {
  const HomeMobileLoaded({
    required this.promos,
    required this.events,
  });

  final List<PromoModel> promos;
  final List<EventModel> events;

  @override
  List<Object?> get props => <Object?>[
        promos,
        events,
      ];
}
