import '../../data/booking_model.dart';

abstract class SeatSelectionState {}

class SeatSelectionInitial extends SeatSelectionState {}

class SeatSelectionLoading extends SeatSelectionState {}

class SeatSelectionLoaded extends SeatSelectionState {
  final SeatSelectionData data;
  SeatSelectionLoaded(this.data);
}

class SeatSelectionError extends SeatSelectionState {
  final String message;
  SeatSelectionError(this.message);
}
