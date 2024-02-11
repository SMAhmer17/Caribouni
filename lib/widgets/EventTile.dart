import 'package:caribouni/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EventTile extends StatelessWidget {
  final int index;
  String? eventName;
  EventTile(
      {super.key, required this.sizes, required this.index, this.eventName});

  final Size sizes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          imgList[index],
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
                height: 20.h,
                width: sizes.width,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  padding: const EdgeInsets.all(2),
                  margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Color(0XFF712B8F),
                    size: 20,
                  ),
                ),
              ),
              eventName != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 0.5.h),
                      child: Text(
                        eventName.toString(),
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: const Color(0XFF712B8F).withOpacity(1),
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                child: Text(
                  'Tomorrow at 10:00 - 12:00 AM',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                child: Text(
                  'The Romanian – Solo Exhibition',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 70.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0XFF707070),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Vicas Art Studio',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Color(0XFF707070),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ),
      ],
    );
  }
}
