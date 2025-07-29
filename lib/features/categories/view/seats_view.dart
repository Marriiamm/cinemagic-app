// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_splashh/core/widgets/buttons.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constants.dart';
import '../cubit/seats/seat_selection_cubit.dart';
import '../cubit/seats/seat_selection_state.dart';
import '../data/seat_model.dart';

class SeatsView extends StatelessWidget {
  const SeatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Seats Selection', style: AppStyles.styleSemiBold18),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => SeatSelectionCubit()..fetchSeatData(),
        child: BlocBuilder<SeatSelectionCubit, SeatSelectionState>(
          builder: (context, state) {
            if (state is SeatSelectionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SeatSelectionError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppStyles.styleSemiBold18,
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is SeatSelectionLoaded) {
              final data = state.data;
              return Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.dates.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        bool isSelected = data.selectedDateIndex == index;
                        return GestureDetector(
                          onTap:
                              () => context
                                  .read<SeatSelectionCubit>()
                                  .selectDate(index),
                          child: Container(
                            width: 60,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: isSelected ? red : const Color(0xFF2C2C2E),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.dates[index]['day']!,
                                  style: AppStyles.styleSemiBold14.copyWith(
                                    color:
                                        isSelected
                                            ? Colors.black
                                            : Colors.white70,
                                  ),
                                ),
                                Text(
                                  data.dates[index]['date']!,
                                  style: AppStyles.styleSemiBold16.copyWith(
                                    color:
                                        isSelected
                                            ? Colors.black
                                            : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Time selection
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.times.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        bool isSelected = data.selectedTimeIndex == index;
                        return GestureDetector(
                          onTap:
                              () => context
                                  .read<SeatSelectionCubit>()
                                  .selectTime(index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: isSelected ? red : const Color(0xFF2C2C2E),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? red : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                data.times[index],
                                style: AppStyles.styleSemiBold14.copyWith(
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Cinema Screen Indicator
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Text('Screen', style: AppStyles.styleSemiBold16),
                        const SizedBox(height: 12),
                        Container(
                          height: 6,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                red.withOpacity(0.2),
                                red.withOpacity(0.8),
                                red.withOpacity(0.2),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: red.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Seat Layout
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children:
                              data.seats.map((rowSeats) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        rowSeats.map((seat) {
                                          Color seatColor;
                                          switch (seat.status) {
                                            case SeatStatus.available:
                                              seatColor = const Color(
                                                0xFF2C2C2E,
                                              );
                                              break;
                                            case SeatStatus.taken:
                                              seatColor = Colors.grey[700]!;
                                              break;
                                            case SeatStatus.selected:
                                              seatColor = red;
                                              break;
                                          }
                                          return GestureDetector(
                                            onTap:
                                                () => context
                                                    .read<SeatSelectionCubit>()
                                                    .toggleSeatStatus(seat),
                                            child: Container(
                                              width: 24,
                                              height: 24,
                                              margin: const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                color: seatColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      6,
                                                    ), // Rounded corners for seats
                                              ),
                                              child:
                                                  seat.status ==
                                                          SeatStatus.taken
                                                      ? const Icon(
                                                        Icons.close,
                                                        color: Colors.white54,
                                                        size: 16,
                                                      ) // X for taken seats
                                                      : null,
                                            ),
                                          );
                                        }).toList(),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildLegendItem(
                          context,
                          'Available',
                          const Color(0xFF2C2C2E),
                        ),
                        _buildLegendItem(context, 'Taken', Colors.grey[700]!),
                        _buildLegendItem(context, 'Selected', red),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SmartCinema Sky Park',
                          style: AppStyles.styleSemiBold16,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'street, 51, region, 21000',
                          style: AppStyles.styleSemiBold11,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            onTap: () {
                              final selectedSeats =
                                  data.seats
                                      .expand((row) => row)
                                      .where(
                                        (seat) =>
                                            seat.status == SeatStatus.selected,
                                      )
                                      .toList();

                              print(
                                'Selected seats: ${selectedSeats.map((s) => s.id).join(', ')}',
                              );
                              Navigator.pushNamed(context, Routes.paymentScreen);
                            },
                            buttonLabel: 'Buy ticket \$48.00',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, String text, Color color) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(text, style: AppStyles.styleSemiBold14White),
      ],
    );
  }
}
