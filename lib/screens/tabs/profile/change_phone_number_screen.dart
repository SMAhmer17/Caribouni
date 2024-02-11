// ignore_for_file: use_key_in_widget_constructors
import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/utils/MysnackBar.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_export.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  @override
  State<ChangePhoneNumberScreen> createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  var phoneNumberController = TextEditingController();

  final _form = GlobalKey<FormState>();
  Future<void> _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    FocusManager.instance.primaryFocus!.unfocus();
    print('submit');
    try {
      final error = await Provider.of<Authentication>(context, listen: false)
          .updatePhone(phoneNumberController.text);

      if (error.contains('Success')) {
        MySnackBar.successSnackbar('Phone number updated', context);
        Navigator.of(context).pop();
      }
    } catch (e) {
      // setState(() {
      //   _isLoading = false;
      // });
      MySnackBar.errorSnackbar(
          'Somthing went wrong please try again later', context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(
        title: "${TextValue.edit} ${TextValue.phoneNumber}",
        isBackShow: true,
      ),
      body: MainBackgroundWidget(
        horizontal: 40,
        sizes: sizes,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _form,
              child: TextFormFieldWidget(
                controller: phoneNumberController,
                labelText: "${TextValue.enter} ${TextValue.phoneNumber}",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please a valid phone';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultButtonWidget(
              buttonText: TextValue.sendVerificationOTP,
              onPressed: () {
                _submit();
              },
              singleColor: ColorConstant.darkGold,
            ),
            const Spacer(),
            Image.asset('assets/images/Icone_Caribouni-01.png'),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
