// ignore_for_file: file_names

import 'package:caribouni/modal/Property.dart';
import 'package:caribouni/utils/app_export.dart';

class PropertyTile extends StatelessWidget {
  final Property property;

  const PropertyTile({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              image: property.images.isEmpty
                  ? DecorationImage(
                      image: AssetImage(
                        'assets/images/homeScreen/154895324618404506245c53269e29dd2.png',
                      ),
                      fit: BoxFit.cover)
                  : DecorationImage(
                      image: NetworkImage(
                        property.images[0],
                      ),
                      fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: 20.h,
            width: 70.w,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
              ),
              padding: const EdgeInsets.all(2),
              margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              child: const Icon(
                Icons.favorite_border,
                color: Color(0XFF707070),
                size: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: Text(
              property.title,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 70.w,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: Text(
                property.descr,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: const Color(0XFF707070),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
