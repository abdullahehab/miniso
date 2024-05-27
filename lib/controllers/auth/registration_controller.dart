import 'dart:convert';

import 'package:http/http.dart' as http;

 //  var emailController = TextEditingController();
 //  var firstNameController = TextEditingController();
 // var lastNameController = TextEditingController();
 // var phoneNumberController = TextEditingController();
 // var passwordController = TextEditingController();
 // var confirmPasswordController = TextEditingController();

  Future register() async {
    var headers = {'Accept': 'application/json'};
    var request =
    http.Request('POST', Uri.parse('http://miniso.website/api/register'));
    request.body = json.encode({
      "first_name":'hhhh',
      "last_name":'hhhh',
      "email":'hhhh@gmail.com',
      "phone":'1027854548',
      "password":'123456789',
      "password_confirmation":'123456789',
      // "first_name": firstNameController.text.toString(),
      // "last_name": lastNameController.text.toString(),
      // "email": emailController.text.toString(),
      // "phone": phoneNumberController.text.toString(),
      // "password": passwordController.text.toString(),
      // "password_confirmation": confirmPasswordController.text.toString()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print('Response status code: ${response.statusCode}');
      print('Response reason phrase: ${response.reasonPhrase}');
      print(response.reasonPhrase);
    }
  }

