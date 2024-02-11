// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, annotate_overrides, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/add_rent.dart';
import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

import '../../../../widgets/widgets.dart';
import 'details_ad_rent.dart';

class AddRent extends StatefulWidget {
  const AddRent({super.key});

  @override
  State<AddRent> createState() => _AddRentState();
}

class _AddRentState extends State<AddRent> {
  bool istrue = false;

  final jobRoleFormDropdownCtrl = TextEditingController();

  final _items1 = _options
      .map((option) => MultiSelectItem<Option1>(option, option.name))
      .toList();

  final _items2 = _options2
      .map((option) => MultiSelectItem<Option2>(option, option.name))
      .toList();
  final _items3 = _options3
      .map((option) => MultiSelectItem<Option3>(option, option.name))
      .toList();

  List<Option1> _selectedoptions1 = [];
  List<Option2> _selectedoptions2 = [];

  List<Option3> _selectedoptions3 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  @override
  void initState() {
    _selectedoptions1 = _options;
    _selectedoptions2 = _options2;

    _selectedoptions3 = _options3;
    super.initState();
  }

  void dispose() {
    jobRoleFormDropdownCtrl.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    //   print(_items1.toString());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 13.h,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/Group 164344.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 2.h,
                      ),
                      Image(
                        image: AssetImage('assets/images/btn_back.png'),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 6.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add New Property',
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'List in the market where renter are waiting!',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 6.w,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/Photo Profile.png'),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            'Name profile',
                            style: GoogleFonts.roboto(
                              color: Color(0XFFA3A3A3),
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: size.width,
                      height: 14.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: img.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return index == 0
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        istrue = !istrue;
                                      });
                                    },
                                    child: Container(
                                      height: 10.h,
                                      width: 28.w,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 3.w,
                                      ),
                                      decoration: istrue
                                          ? BoxDecoration(
                                              color: Color(0XFF712B8F)
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(30))
                                          : BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    img[index],
                                                  ),
                                                  fit: BoxFit.contain),
                                            ),
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle_rounded,
                                            color: istrue
                                                ? Color(0XFF712B8F)
                                                : Color(0XFFA3A3A3),
                                          ),
                                          Text(
                                            'Add photos',
                                            style: GoogleFonts.roboto(
                                              color: istrue
                                                  ? Color(0XFF712B8F)
                                                  : Color(0XFFA3A3A3),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 10.h,
                                    width: 28.w,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 3.w,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            img[index],
                                          ),
                                          fit: BoxFit.contain),
                                    ),
                                  );
                          }),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF7E0EBD),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.roboto(),
                          hintText: 'Property title',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width / 2.4,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: CustomDropdown(
                                  hintStyle:
                                      GoogleFonts.roboto(fontSize: 14.sp),
                                  hintText: 'Type of Rent',
                                  items: list1,
                                  controller: jobRoleFormDropdownCtrl,
                                  excludeSelected: false,
                                  listItemBuilder: (context, result) {
                                    return Text(result);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                                width: size.width / 2.4,
                                child: CustomDropdown(
                                  hintStyle:
                                      GoogleFonts.roboto(fontSize: 14.sp),
                                  hintText: 'Property Type',
                                  items: list2,
                                  controller: jobRoleFormDropdownCtrl,
                                  excludeSelected: false,
                                  listItemBuilder: (context, result) {
                                    return Text(result);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width / 2.4,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: CustomDropdown(
                                  hintStyle:
                                      GoogleFonts.roboto(fontSize: 14.sp),
                                  hintText: 'Type of Rent',
                                  items: list3,
                                  controller: jobRoleFormDropdownCtrl,
                                  excludeSelected: false,
                                  listItemBuilder: (context, result) {
                                    return Text(result);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                                width: size.width / 2.4,
                                child: CustomDropdown(
                                  hintStyle:
                                      GoogleFonts.roboto(fontSize: 14.sp),
                                  hintText: 'Property Type',
                                  items: list4,
                                  controller: jobRoleFormDropdownCtrl,
                                  excludeSelected: false,
                                  listItemBuilder: (context, result) {
                                    return Text(result);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF7E0EBD),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.roboto(),
                          hintText: 'Address and location',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            width: size.width / 2.4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0xFF7E0EBD),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.roboto(),
                                hintText: 'Price AED',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            width: size.width / 2.4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0xFF7E0EBD),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.roboto(),
                                hintText: 'Deposit AED',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF7E0EBD),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.roboto(),
                          hintText: 'Number Phone',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      height: 20.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF7E0EBD),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.roboto(),
                          hintText: 'Describe your property',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Divider(
                      thickness: 4,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: MultiSelectChipField(
                        scroll: false,
                        initialValue: [],
                        items: _items1,
                        searchTextStyle: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        title: Text(
                          'Select Amenities',
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        headerColor: Color(0xFF7E0EBD).withOpacity(0.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFF7E0EBD).withOpacity(0.0),
                              width: 1.8),
                        ),
                        textStyle: GoogleFonts.roboto(
                          color: Color(0xFFA3A3A3),
                        ),
                        selectedChipColor: Color(0xFF7E0EBD),
                        selectedTextStyle:
                            GoogleFonts.roboto(color: Colors.white),
                        onTap: (values) {},
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: MultiSelectChipField(
                        scroll: false,
                        items: _items2,
                        initialValue: [],
                        title: Text(
                          'Tenants Allowed',
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        headerColor: Color(0xFF7E0EBD).withOpacity(0.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFF7E0EBD).withOpacity(0.0),
                              width: 1.8),
                        ),
                        textStyle: GoogleFonts.roboto(
                          color: Color(0xFFA3A3A3),
                        ),
                        selectedChipColor: Color(0xFF7E0EBD),
                        selectedTextStyle:
                            GoogleFonts.roboto(color: Colors.white),
                        onTap: (values) {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: MultiSelectChipField(
                        scroll: false,
                        items: _items3,
                        initialValue: [],
                        title: Text(
                          'Room Type',
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        headerColor: Color(0xFF7E0EBD).withOpacity(0.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFF7E0EBD).withOpacity(0.0),
                              width: 1.8),
                        ),
                        textStyle: GoogleFonts.roboto(
                          color: Color(0xFFA3A3A3),
                        ),
                        selectedChipColor: Color(0xFF7E0EBD),
                        selectedTextStyle:
                            GoogleFonts.roboto(color: Colors.white),
                        onTap: (values) {},
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      width: 500,
                      height: 50,
                      margin: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
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
                            'Done',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: DetailsAdRent(),
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
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static List<Option1> _options = [
    Option1(id: 1, name: "Cleaning Including"),
    Option1(id: 2, name: "Dryer"),
    Option1(id: 3, name: "FreeWifi"),
    Option1(id: 4, name: "Gym"),
    Option1(id: 5, name: "Washer"),
    Option1(id: 6, name: "Kitchen Appliances"),
    Option1(id: 7, name: "Sauna"),
    Option1(id: 8, name: "Pool"),
    Option1(id: 9, name: "Free Parking"),
    Option1(id: 10, name: "Cale TV"),
  ];
  static List<Option2> _options2 = [
    Option2(id: 1, name: "Male"),
    Option2(id: 2, name: "Female"),
    Option2(id: 3, name: "Couple"),
    Option2(id: 4, name: "Couple"),
    Option2(id: 5, name: "Families"),
  ];
  static List<Option3> _options3 = [
    Option3(id: 1, name: "Balcony"),
    Option3(id: 2, name: "Window"),
    Option3(id: 3, name: "Attached Bathroom"),
  ];
}
