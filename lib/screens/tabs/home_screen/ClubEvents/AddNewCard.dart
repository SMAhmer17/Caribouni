// ignore_for_file: file_names

import 'package:caribouni/utils/app_export.dart';
import 'package:flutter/material.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarCustomWidget(
        title: 'Add New Card',
        elevation: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFFB37A2B), Colors.purple.shade700],
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 100, bottom: 11),
                height: MediaQuery.of(context).size.height * .68,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 11,
                        ),
                        const Icon(
                          Icons.add_outlined,
                          color: Color(0xFFB37A2B),
                          size: 26,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Add a new card",
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFB37A2B),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: ColorConstant.yellowOrange)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Card holder’s name",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                border: InputBorder.none,
                                hintText: 'Ayoub Hubert',
                                hintStyle: GoogleFonts.roboto(
                                    color: ColorConstant.grey3,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.roboto(
                                    color: ColorConstant.grey3,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                                suffixIcon: Image.asset(
                                  'assets/images/paypal.png',
                                  scale: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expiry Date",
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: '12 / 26',
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 15),
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.roboto(
                                              color: ColorConstant.grey3,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                          suffixIcon:
                                              const Icon(Icons.calendar_today)),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CVV",
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: '722',
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 15),
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.roboto(
                                              color: ColorConstant.grey3,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                          suffixIcon: const Icon(
                                            Icons.question_mark_outlined,
                                            color: Colors.blue,
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 500,
                      height: 50,
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
                            'Add Card'.toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: Scaffold(), withNavBar: false);
                          }),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 33,
                top: 110,
                child: Row(
                  children: [
                    Text(
                      "\u2022",
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 8, 241, 16),
                          fontWeight: FontWeight.normal,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Credit card",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * (1 - .8),
                child: Image.asset(
                  'assets/images/card.png',
                  scale: 2.2,
                  alignment: Alignment.bottomLeft,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
