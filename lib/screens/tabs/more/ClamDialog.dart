import 'package:caribouni/utils/app_export.dart';

class ClaimDialog extends StatelessWidget {
  const ClaimDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            width: 1.5,
            color: Color(0xFFB37A2B),
          )),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.png'))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ElevatedButton(
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.white10),
                  elevation: MaterialStateProperty.all<double>(5),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white54),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 30)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/gift.png',
                    scale: 2.8,
                    color: Colors.purple,
                  ),
                  Text(
                    ' Earn Reward',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/girlcom.png',
                scale: 2,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.purple,
                          Color(0xFFB37A2B),
                        ])),
                child: Text(
                  '+5 Point Reward ',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Congratulations!',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'You get points for refer first friend!',
            style: GoogleFonts.roboto(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 500,
            height: 40,
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
                  'CLAIM',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ]),
      ),
    );
  }
}
