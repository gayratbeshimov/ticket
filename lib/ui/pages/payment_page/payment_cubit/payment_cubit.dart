import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/core/utils/app_logger_util.dart';

import '../../../../core/models/payment_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  static PaymentCubit get to => Modular.get<PaymentCubit>();

  PaymentCubit() : super(const PaymentState());

  Future<void> load() async {
    try {
      List<Payments> listPayment = const [
        Payments("assets/images/icons/click_logo.svg", "click"),
        Payments("assets/images/icons/payme_logo.svg", "payme"),
        Payments("assets/images/icons/uzum_logo.svg", "uzum")
      ];

      emit(state.copyWith(
        listPayment: listPayment,
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        hasError: true,
        loading: false,
      ));
      AppLoggerUtil.e("$e");
    }
  }

  void selectMethod({required Payments payment}) {
    emit(state.copyWith(selectPay: payment));
  }
}
