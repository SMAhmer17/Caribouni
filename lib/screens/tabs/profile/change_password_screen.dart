// ignore_for_file: use_key_in_widget_constructors
import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/utils/MysnackBar.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_export.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var retypePasswordController = TextEditingController();
  var obscureCurrentPassword = true;
  var obscureNewPassword = true;
  var obscureRetypePassword = true;

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
          .updatePassword(
              currentPasswordController.text, newPasswordController.text);
      print(error);
      if (error.contains('Success')) {
        MySnackBar.successSnackbar('Password updated', context);
        Navigator.of(context).pop();
      }
      if (error.contains('Old password is not validated')) {
        MySnackBar.errorSnackbar('Old password is not validated', context);
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
    currentPasswordController.dispose();
    newPasswordController.dispose();
    retypePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(
        title: "${TextValue.edit} ${TextValue.password}",
        isBackShow: true,
      ),
      body: MainBackgroundWidget(
        horizontal: 40,
        sizes: sizes,
        child: Form(
          key: _form,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormFieldWidget(
                controller: currentPasswordController,
                labelText: "${TextValue.current} ${TextValue.password}",
                obscure: obscureCurrentPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureCurrentPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureCurrentPassword = !obscureCurrentPassword;
                    });
                  },
                ),
              ),
              TextFormFieldWidget(
                controller: newPasswordController,
                labelText: "${TextValue.newTxt} ${TextValue.password}",
                obscure: obscureNewPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureNewPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureNewPassword = !obscureNewPassword;
                    });
                  },
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter your password";
                  }
                  if (val.length < 6 || val.length > 12) {
                    return "Please enter 6 to 12 character";
                  }
                  return null;
                },
              ),
              TextFormFieldWidget(
                controller: retypePasswordController,
                labelText:
                    "${TextValue.reType} ${TextValue.newTxt} ${TextValue.password}",
                obscure: obscureRetypePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureRetypePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureRetypePassword = !obscureRetypePassword;
                    });
                  },
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please re-enter your password";
                  }
                  if (val != newPasswordController.text) {
                    return "The confirm-password and password must match";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultButtonWidget(
                buttonText: "${TextValue.change} ${TextValue.password}",
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
      ),
    );
  }
}
