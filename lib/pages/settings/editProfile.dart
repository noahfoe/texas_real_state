import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_texas_state/pages/settings/settings.dart';

class EditProfilePage extends StatefulWidget {
  late String email;
  late String firstName;
  late String lastName;
  EditProfilePage(
      {required this.email,
      required this.firstName,
      required this.lastName,
      Key? key})
      : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState(
      email: email, firstName: firstName, lastName: lastName);
}

class _EditProfilePageState extends State<EditProfilePage> {
  final picker = ImagePicker();
  late File? pickedImage;
  bool showPassword = false;
  late String email;
  late String firstName;
  late String lastName;
  _EditProfilePageState(
      {required this.email, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MySettingsPage(
                    email: email, firstName: firstName, lastName: lastName)));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("img/defaultPicture.jpg"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ElevatedButton(
                        onPressed: () {
                          _showPickedOptionsDialog(context);
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), primary: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "$firstName $lastName", false),
              buildTextField("E-mail", "$email", false),
              buildTextField("Password", "", true),
              buildTextField("Location", "San Marcos, Texas, USA", false),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new MySettingsPage(
                              email: email,
                              firstName: firstName,
                              lastName: lastName),
                        ),
                      );
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Info has been saved"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              Spacer(),
              Text("© 2021 Texas Real State"),
            ],
          ),
        ),
      ),
    );
  }

  void _showPickedOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text("Pick from Gallery"),
            onTap: () {
              _loadPicker(ImageSource.gallery);
            },
          ),
          ListTile(
            title: Text("Take a Picture"),
            onTap: () {
              _loadPicker(ImageSource.camera);
            },
          ),
        ],
      )),
    );
  }

  _loadPicker(ImageSource source) async {
    final picked = await picker.getImage(source: source);
    if (picked != null) {
      setState(() {
        pickedImage = File(picked.path);
      });
    }
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: showPassword
                        ? Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
