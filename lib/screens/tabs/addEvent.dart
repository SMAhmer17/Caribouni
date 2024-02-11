// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, annotate_overrides, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:io';

import 'package:caribouni/modal/Event.dart';
import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/provider/EventData.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/add_rent.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/details_ad_rent.dart';
import 'package:caribouni/utils/MysnackBar.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:caribouni/utils/date_converter.dart';
import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

import '../../../../widgets/widgets.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
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
  TextEditingController title = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController deposit = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController descrp = TextEditingController();

  TextEditingController timeCont = TextEditingController();
  TextEditingController dateCont = TextEditingController();
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
  final key = GlobalKey<FormState>();
  XFile? image;

  void presentDatePicker() {
    FocusManager.instance.primaryFocus?.unfocus();
    showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    ).then((pickerDate) {
      if (pickerDate == null) {
        return;
      }

      setState(() {
        dateCont.text = DateConverter.yearMonthDate(pickerDate);
      });
    });
  }

  void _presentTimePicker() {
    FocusManager.instance.primaryFocus?.unfocus();
    showTimePicker(
      context: context,
      initialTime: time,
    ).then((pickerDate) {
      if (pickerDate == null) {
        return;
      }
      setState(() {
        timeCont.text = pickerDate.format(context);
      });
    });
  }

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
    title.dispose();
    price.dispose();
    address.dispose();
    deposit.dispose();
    phone.dispose();
    descrp.dispose();
    timeCont.dispose();
    dateCont.dispose();

    super.dispose();
  }

  Future<void> _submit() async {
    final isValid = key.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (image == null) {
      MySnackBar.errorSnackbar('Select Image', context);
      return;
    }
    final userId = Provider.of<Authentication>(context, listen: false)
        .currentUser!
        .data
        .id;
    final message = await Provider.of<EventData>(context, listen: false)
        .saveEvent(userId, title.text, address.text, price.text, deposit.text,
            phone.text, descrp.text, File(image!.path), date);
    if (message.contains('successfully')) {
      MySnackBar.successSnackbar(message, context);
      Navigator.of(context).pop();
      print('object');
      return;
    }
    if (message.contains('Validation Error')) {
      MySnackBar.errorSnackbar(message, context);

      return;
    }
    MySnackBar.errorSnackbar(
        'Somthing went wrong please check your internet', context);
  }

  Widget build(BuildContext context) {
    final auth =
        Provider.of<Authentication>(context, listen: false).currentUser;
    //   print(_items1.toString());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustomWidget(title: 'Add New Event'),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
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
                          auth!.data.name,
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
                    margin: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
// Pick an image.
                            final dum = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              image = dum;
                            });
                          },
                          child: Container(
                            height: 10.h,
                            width: 28.w,
                            margin: EdgeInsets.symmetric(
                              horizontal: 3.w,
                            ),
                            decoration: image != null
                                ? BoxDecoration(
                                    color: Color(0XFF712B8F).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20))
                                : BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/Rectangle.png',
                                        ),
                                        fit: BoxFit.contain),
                                  ),
                            //   padding: EdgeInsets.all(5),
                            child: image != null
                                ? Stack(
                                    fit: StackFit.expand,
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          File(image!.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                image = null;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ))
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        'Add cover',
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
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select type event',
                              style: GoogleFonts.roboto(
                                color: Colors.black54,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: size.width / 2.4,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black38),
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: CustomDropdown(
                                hintStyle: GoogleFonts.roboto(fontSize: 14.sp),
                                hintText: 'Type Event',
                                items: list1,
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
                    height: 1.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Text(
                          'Event name',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 70,
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        // padding: EdgeInsets.symmetric(horizontal: 4.w),
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     width: 1,
                        //     color: Color(0xFF7E0EBD),
                        //   ),
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(),
                            hintText: 'Create event name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please add name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: GoogleFonts.roboto(
                                color: Colors.black54,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(horizontal: 4.w),
                              width: size.width / 2.4,
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     width: 1,
                              //     color: Color(0xFF7E0EBD),
                              //   ),
                              //   borderRadius: BorderRadius.circular(15),
                              // ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.roboto(),
                                  hintText: 'AED',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Please add price';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact by WhatsApp',
                              style: GoogleFonts.roboto(
                                color: Colors.black54,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(horizontal: 4.w),
                              width: size.width / 2.4,
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     width: 1,
                              //     color: Color(0xFF7E0EBD),
                              //   ),
                              //   borderRadius: BorderRadius.circular(15),
                              // ),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.roboto(),
                                  hintText: 'Number phone WhatsApp',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xFF7E0EBD),
                                      )),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Please add contact number';
                                  }
                                  return null;
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Text(
                          'Address and location',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        // padding: EdgeInsets.symmetric(horizontal: 4.w),
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     width: 1,
                        //     color: Color(0xFF7E0EBD),
                        //   ),
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(),
                            hintText: 'Street Address',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please add Address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deposit',
                              style: GoogleFonts.roboto(
                                color: Colors.black54,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(horizontal: 4.w),
                              width: size.width / 2.4,
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     width: 1,
                              //     color: Color(0xFF7E0EBD),
                              //   ),
                              //   borderRadius: BorderRadius.circular(15),
                              // ),
                              child: GestureDetector(
                                onTap: () {
                                  // _presentTimePicker();
                                },
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: timeCont,
                                  // showCursor: false,
                                  // enabled: false,
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.roboto(),
                                    hintText: 'AED',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Please add Deposit';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Date',
                              style: GoogleFonts.roboto(
                                color: Colors.black54,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                presentDatePicker();
                              },
                              child: Container(
                                // padding: EdgeInsets.symmetric(horizontal: 4.w),
                                width: size.width / 2.4,
                                // decoration: BoxDecoration(
                                //   border: Border.all(
                                //     width: 1,
                                //     color: Color(0xFF7E0EBD),
                                //   ),
                                //   borderRadius: BorderRadius.circular(15),
                                // ),
                                child: TextFormField(
                                  controller: dateCont,
                                  showCursor: false,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.roboto(),
                                    hintText: 'Day/Month ',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF7E0EBD),
                                        )),
                                  ),
                                ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Text(
                          'Description',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        // padding: EdgeInsets.symmetric(horizontal: 4.w),
                        height: 20.h,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     width: 1,
                        //     color: Color(0xFF7E0EBD),
                        //   ),
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: TextFormField(
                          maxLines: 8,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(),
                            hintText: 'Add event description',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF7E0EBD),
                                )),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please add Description';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
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
                          'POST',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _submit();
                          // PersistentNavBarNavigator.pushNewScreen(
                          //   context,
                          //   screen: DetailsAdRent(),
                          //   withNavBar: false,
                          // );
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
