class Seat {
  final String id;
  final int row;
  final int column;
  SeatStatus status;

  Seat({
    required this.id,
    required this.row,
    required this.column,
    this.status = SeatStatus.available,
  });

  // Helper to create a copy with updated status
  Seat copyWith({SeatStatus? status}) {
    return Seat(
      id: id,
      row: row,
      column: column,
      status: status ?? this.status,
    );
  }
}
enum SeatStatus { available, taken, selected }