import 'package:caribouni/screens/tabs/home_screen/ClubEvents/PaymentInfo.dart';
import 'package:caribouni/utils/app_export.dart';

class SelectTicket extends StatelessWidget {
  const SelectTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButtonWidget(),
        toolbarHeight: 70,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularWidget(firstNum: 1, secondNum: 2),
            const SizedBox(
              width: 6,
            ),
            Text(
              "Select Ticket",
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Music Event",
              style: GoogleFonts.poppins(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              'Premium Staycation Package at Pan Pacific',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/Group 16470.png',
              scale: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 0,
              color: ColorConstant.gainsboro,
              thickness: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 18,
                ),
                Text(
                  'Sun, Mar 22, 2023',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '8:30 PM - 10:00 PM',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: Colors.purple.shade100,
                ),
                Text(
                  'Barasti Opera House',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              'Barasti, Mina Siyahi, Marina',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 0,
              color: ColorConstant.gainsboro,
              thickness: 2.5,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Quantity',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const QuantityIncrement(),
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
              'Ticket Information',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '\u2022 Visit the display area\n\u2022 Experience traditional games\n\u2022 Does not include dining in the dining area\n\u2022 Enjoy traditional music repertoire\n\u2022 Bracelet, Light stick & accessories\n\u2022 Other Voucher ',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
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
                    'NEXT',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const PaymentInfo(),
                      withNavBar: false,
                    );
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
