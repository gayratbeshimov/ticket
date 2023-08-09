part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  final bool loading;
  final bool hasError;
  final List<Payments> listPayment;
  final Payments? selectPay;

  const PaymentState({
    this.loading = true,
    this.hasError = false,
    this.selectPay,
    this.listPayment = const [],
  });

  PaymentState copyWith({
    bool? loading,
    bool? hasError,
    List<Payments>? listPayment,
    Payments? selectPay,
  }) {
    return PaymentState(
      loading: loading ?? this.loading,
      hasError: hasError ?? this.hasError,
      selectPay: selectPay ?? this.selectPay,
      listPayment: listPayment ?? this.listPayment,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        selectPay,
        hasError,
        listPayment,
      ];
}


