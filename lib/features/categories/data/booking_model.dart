import 'seat_model.dart';

class SeatSelectionData {
  final List<Map<String, String>> dates;
  final List<String> times;
  final List<List<Seat>> seats;
  final int selectedDateIndex;
  final int selectedTimeIndex;

  SeatSelectionData({
    required this.dates,
    required this.times,
    required this.seats,
    this.selectedDateIndex = 0,
    this.selectedTimeIndex = 0,
  });

  SeatSelectionData copyWith({
    List<Map<String, String>>? dates,
    List<String>? times,
    List<List<Seat>>? seats,
    int? selectedDateIndex,
    int? selectedTimeIndex,
  }) {
    return SeatSelectionData(
      dates: dates ?? this.dates,
      times: times ?? this.times,
      seats: seats ?? this.seats,
      selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
      selectedTimeIndex: selectedTimeIndex ?? this.selectedTimeIndex,
    );
  }
}