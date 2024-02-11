// ignore_for_file: file_names

import 'package:caribouni/screens/tabs/home_screen/ClubEvents/ETicket.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TicketSuccessDialog extends StatelessWidget {
  const TicketSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: const EdgeInsets.all(022),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/Shape.png',
              height: 100,
              width: 100,
            ),
            Text(
              'Congratulations!',
              style: GoogleFonts.poppins(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              'Your ticket successfully booked.!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Container(
              width: 130,
              height: 50,
              margin: const EdgeInsets.symmetric(
                //  horizontal: 30,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFB37A2B),
                    Color(0xFFF8DA68),
                  ],
                ),
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(
                    'View Ticket',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: const ETicket(), withNavBar: false);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
