import 'package:caribouni/utils/app_export.dart';

class ReferFriendDialog extends StatelessWidget {
  const ReferFriendDialog({super.key});

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFB37A2B),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/girl.png',
                    scale: 1.5,
                  ),
                  Text(
                    'Refer First Friend!',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'Share to your friend or family',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.white10),
                    elevation: MaterialStateProperty.all<double>(5),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(200, 30)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Share Link',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            Text(
              'Or use this code to invite your friend to register',
              style: GoogleFonts.roboto(
                fontSize: 14,
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.purple)),
              child: Row(
                children: [
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none),
                  )),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 0.5)),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade200,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    width: 80,
                    child: Text(
                      'Copy Code',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
