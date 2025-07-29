import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/booking_model.dart';
import '../../data/seat_model.dart';
import 'seat_selection_state.dart';

class SeatSelectionCubit extends Cubit<SeatSelectionState> {
  SeatSelectionCubit() : super(SeatSelectionInitial());
  final List<Map<String, String>> dates = [
    {'day': 'Thu', 'date': '9'},
    {'day': 'Fri', 'date': '10'},
    {'day': 'Sat', 'date': '11'},
    {'day': 'Sun', 'date': '12'},
    {'day': 'Mon', 'date': '13'},
    {'day': 'Tue', 'date': '14'},
  ];

  final List<String> times = [
    '10:30 AM',
    '11:45 AM',
    '13:50 AM',
    '15:30 AM',
  ];

  List<List<Seat>> currentSeats = [];
  int currentSelectedDateIndex = 1; 
  int currentSelectedTimeIndex = 3; 

  Future<void> fetchSeatData() async {
    try {
      emit(SeatSelectionLoading());
      await Future.delayed(const Duration(seconds: 1));
      currentSeats = [];
      for (int r = 0; r < 4; r++) { 
        List<Seat> rowSeats = [];
        int seatsInRow = 5 + (r * 2); // Example: 6, 8, 10, 12, 14, 16, 18, 20
        if (r > 3) seatsInRow = 11; 

        for (int c = 0; c < seatsInRow; c++) {
          SeatStatus status = SeatStatus.available;
          if ((r == 0 && (c == 2 || c == 3)) ||
              (r == 1 && (c == 0 || c == 7)) ||
              (r == 3 && (c == 5 || c == 6))) {
            status = SeatStatus.taken;
          }
          rowSeats.add(Seat(id: 'R${r + 1}C${c + 1}', row: r + 1, column: c + 1, status: status));
        }
        currentSeats.add(rowSeats);
      }

      emit(SeatSelectionLoaded(SeatSelectionData(
        dates: dates,
        times: times,
        seats: currentSeats,
        selectedDateIndex: currentSelectedDateIndex,
        selectedTimeIndex: currentSelectedTimeIndex,
      )));
    } catch (e) {
      emit(SeatSelectionError('Failed to load seat data: $e'));
    }
  }

  void selectDate(int index) {
    if (state is SeatSelectionLoaded) {
      currentSelectedDateIndex = index;
      emit((state as SeatSelectionLoaded).data.copyWith(selectedDateIndex: index) as SeatSelectionState);
    }
  }

  void selectTime(int index) {
    if (state is SeatSelectionLoaded) {
      currentSelectedTimeIndex = index;
      emit((state as SeatSelectionLoaded).data.copyWith(selectedTimeIndex: index) as SeatSelectionState);
    }
  }

  void toggleSeatStatus(Seat tappedSeat) {
    if (state is SeatSelectionLoaded) {
      final currentData = (state as SeatSelectionLoaded).data;
      final updatedSeats = List<List<Seat>>.from(currentData.seats.map((row) => List<Seat>.from(row)));

      
      for (int r = 0; r < updatedSeats.length; r++) {
        for (int c = 0; c < updatedSeats[r].length; c++) {
          if (updatedSeats[r][c].id == tappedSeat.id) {
            if (updatedSeats[r][c].status == SeatStatus.available) {
              updatedSeats[r][c] = updatedSeats[r][c].copyWith(status: SeatStatus.selected);
            } else if (updatedSeats[r][c].status == SeatStatus.selected) {
              updatedSeats[r][c] = updatedSeats[r][c].copyWith(status: SeatStatus.available);
            }
            // If status is taken, do nothing
            break;
          }
        }
      }
      currentSeats = updatedSeats; // Update internal state
      emit(currentData.copyWith(seats: updatedSeats) as SeatSelectionState);
    }
  }
}