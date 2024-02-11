import 'package:caribouni/screens/tabs/home_screen/ClubEvents/AddNewCard.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/TicketSuccessDialog.dart';
import 'package:caribouni/utils/app_export.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key});

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _adress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButtonWidget(),
        toolbarHeight: 70,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularWidget(firstNum: 2, secondNum: 2),
            const SizedBox(
              width: 6,
            ),
            Text(
              "Payment info",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ticket receiver",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
              ),
              TextFieldWidget(
                controller: _fname,
                hintText: 'First name',
              ),
              TextFieldWidget(
                controller: _lname,
                hintText: 'Last name',
              ),
              TextFieldWidget(
                controller: _email,
                hintText: 'Email',
              ),
              TextFieldWidget(
                controller: _number,
                hintText: 'Phone number',
              ),
              TextFieldWidget(
                controller: _adress,
                hintText: 'Adress',
              ),
              Divider(
                height: 0,
                color: ColorConstant.gainsboro,
                thickness: 2.5,
              ),
              Text(
                "Payment method",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pay with",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                    ),
                    ListTile(
                      dense: false,
                      minLeadingWidth: 1,
                      //  contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.credit_card_outlined),
                      title: Text(
                        "Debit card",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      trailing: GestureDetector(
                          onTap: () {
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
                                      height: 270,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                              width: 44,
                                              child: Divider(
                                                thickness: 2.5,
                                              )),
                                          Row(
                                            children: [
                                              Text(
                                                "\u2022",
                                                style: GoogleFonts.poppins(
                                                    color: const Color.fromARGB(
                                                        255, 8, 241, 16),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 30),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "Credit card",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.purple,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "Card Holder Name",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "Job Hubert",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Card(
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ListTile(
                                                dense: true,
                                                leading: Image.asset(
                                                  'assets/images/visa.png',
                                                  scale: 2,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                ),
                                                title: Text(
                                                  "\u2022\u2022\u2022\u2022 \u2022\u2022\u2022\u2022 \u2022\u2022\u2022\u2022 5040",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12),
                                                ),
                                                subtitle: Text(
                                                  "Expiration: 05/22 Card 1 (default)",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 9),
                                                ),
                                              )),
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
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                                  'Change Card'.toUpperCase(),
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  PersistentNavBarNavigator
                                                      .pushNewScreen(context,
                                                          screen: AddNewCard(),
                                                          withNavBar: false);
                                                }),
                                          ),
                                        ],
                                      ),
                                    ));
                          },
                          child: const Icon(Icons.add_circle_outline_outlined)),
                      subtitle: Text(
                        "Accepting Visa, Mastercard, etc",
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 12),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      //  contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.apple_outlined),
                      title: Text(
                        "Apple Pay",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.add_circle_outline_outlined)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: GoogleFonts.poppins(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "250 AED",
                    style: GoogleFonts.poppins(
                        color: Colors.orange.shade300,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '*Please check your order information above before proceeding',
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
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
                      'NEXT',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => TicketSuccessDialog());
                      // RouteTransition(
                      //     context: context,
                      //     child: Details_Ad_Rent(),
                      //     animation: AnimationType.fadeIn,
                      //     duration: Duration(milliseconds: 200),
                      //     repacement: true);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 42,
      child: TextFormField(
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade100),
                borderRadius: BorderRadius.circular(40)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade100),
                borderRadius: BorderRadius.circular(40)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade100),
                borderRadius: BorderRadius.circular(40))),
      ),
    );
  }
}

class QuantityIncrement extends StatefulWidget {
  const QuantityIncrement({super.key});

  @override
  State<QuantityIncrement> createState() => _QuantityIncrementState();
}

class _QuantityIncrementState extends State<QuantityIncrement> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              number = number - 1;
            });
          },
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.purple.shade100),
              child: const Icon(Icons.remove)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple.shade100),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            number.toString(),
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              number = number + 1;
            });
          },
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.purple.shade100),
              child: const Icon(Icons.add)),
        ),
      ],
    );
  }
}

class CircularWidget extends StatelessWidget {
  final int firstNum;
  final int secondNum;

  const CircularWidget(
      {super.key, required this.firstNum, required this.secondNum});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 15,
        child: CircleAvatar(
          radius: 14,
          backgroundColor: Colors.purple.shade50,
          child: Text(
            '$firstNum/$secondNum',
            style: GoogleFonts.poppins(
                color: Colors.purple,
                fontWeight: FontWeight.normal,
                fontSize: 12),
          ),
        ));
  }
}
