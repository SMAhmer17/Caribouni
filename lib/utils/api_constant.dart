class ApiConstant {
  static String server = 'https://caribouni.com/api/v1';
  //-------------User------------------------------//
  static Uri loginApi = Uri.parse('$server/login');
  static Uri signUp = Uri.parse('$server/signup');
  static Uri updatename = Uri.parse('$server/updatename');
  static Uri updatephone = Uri.parse('$server/updatephone');
  static Uri updatepassword = Uri.parse('$server/updatepassword');

  //-------------Food------------------------------//
  static Uri createfood = Uri.parse('$server/createfood');
  static Uri updatefood = Uri.parse('$server/updatefood');
  static Uri foods = Uri.parse('$server/foods');
  static Uri editfood = Uri.parse('$server/editfood');
  static Uri deletefood = Uri.parse('$server/deletefood');
  static Uri myfoods = Uri.parse('$server/myfoods');

  //-------------Event------------------------------//
  static Uri createevent = Uri.parse('$server/createevent');
  static Uri updateevent = Uri.parse('$server/updateevent');
  static Uri events = Uri.parse('$server/events');
  static Uri editevent = Uri.parse('$server/editevent');
  static Uri deleteevent = Uri.parse('$server/deleteevent');
  static Uri myevents = Uri.parse('$server/myevents');

  //-------------Property------------------------------//
  static Uri createproperty = Uri.parse('$server/createproperty');
  static Uri updateproperty = Uri.parse('$server/updateproperty');
  static Uri properties = Uri.parse('$server/properties');
  static Uri editproperty = Uri.parse('$server/editproperty');
  static Uri deleteproperty = Uri.parse('$server/deleteproperty');
  static Uri myproperties = Uri.parse('$server/myproperties');
}
