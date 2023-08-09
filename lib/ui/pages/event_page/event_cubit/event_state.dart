part of 'event_cubit.dart';

class EventState extends Equatable {
  final bool loading;
  final bool hasError;
  final List<TicketModel> tickets;
  final List<TicketModel> concertsTickets;

  const EventState({
    this.loading = true,
    this.hasError = false,
    this.tickets = const [],
    this.concertsTickets = const [],
  });

  EventState copyWith({
    bool? loading,
    bool? hasError,
    List<TicketModel>? tickets,
    List<TicketModel>? concertsTickets,
  }) {
    return EventState(
      hasError: hasError ?? this.hasError,
      loading: loading ?? this.loading,
      tickets: tickets ?? this.tickets,
      concertsTickets: concertsTickets ?? this.concertsTickets,
    );
  }

  @override
  List<Object?> get props => [
        hasError,
        loading,
        tickets,
      ];
}
