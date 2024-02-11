// ignore_for_file: file_names

import 'package:caribouni/screens/tabs/home_screen/ClubEvents/ReviewDialog.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:flutter/material.dart';

class ETicket extends StatelessWidget {
  const ETicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: 'E-Ticket',
        elevation: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 21, 1, 37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.music_note_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                '  Music Event',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset(
                            'assets/images/log.png',
                            scale: 2,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Premium Staycation Package at Pan Pacific',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            'Manzi Art Space and Cafe',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 13),
                          ),
                          Text(
                            'Barasti, Mina Siyahi, Marina',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                              Text(
                                '22 March',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                              Text(
                                '8:00 PM',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Image.asset(
                        'assets/images/bar.png',
                        scale: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
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
                      'Download ticket',
                      style: GoogleFonts.poppins(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          context: context,
                          builder: (context) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                height: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .height *
                                    0.75,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                        width: 44,
                                        child: Divider(
                                          thickness: 3.5,
                                        )),
                                    Text(
                                      "Leave a Review",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                    ),
                                    Text(
                                      "How was your experience with Caribouni ?",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                    ),
                                    Image.asset(
                                      'assets/images/star.png',
                                      scale: 2,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Write your review",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextFormField(
                                        maxLines: 5,
                                        decoration: const InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 135,
                                          height: 35,
                                          margin: const EdgeInsets.symmetric(
                                            /////  horizontal: 30,
                                            vertical: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(
                                              40,
                                            ),
                                          ),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                              child: Text(
                                                'May be Later',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.purple,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              }),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 135,
                                          height: 35,
                                          margin: const EdgeInsets.symmetric(
                                            /////  horizontal: 30,
                                            vertical: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius: BorderRadius.circular(
                                              40,
                                            ),
                                          ),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                              child: Text(
                                                'Submit',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () {}),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                    }),
              ),
              Container(
                width: 200,
                height: 40,
                margin: const EdgeInsets.symmetric(
                  /////  horizontal: 30,
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
                      'Go Back',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
