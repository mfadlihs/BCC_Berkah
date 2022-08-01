import 'dart:convert';
import 'dart:io';

import 'package:bcc/api/baseUrl.dart';
import 'package:bcc/api/token.dart';
import 'package:bcc/components/Navbar.dart';
import 'package:bcc/components/showNotif.dart';
import 'package:bcc/layout/editProfile/ChangePassword.dart';
import 'package:bcc/layout/editProfile/EditPhoto.dart';
import 'package:bcc/layout/editProfile/EditProfileHeader.dart';
import 'package:bcc/providers/editProfile/ProviderEdit.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // TextEditingController? name, storeName, storeLocation;
  String name = "", storeName = "", storeLocation = "", address = "";
  TextEditingController date = TextEditingController();

  String? gender = "Laki Laki";
  String email = "budihasan@gmail.com";

  handleNewUser(File? image, BuildContext context) async {
    if (!checkComplete(image)) {
      // showNotif("", context);
      showNotif(
          "${name == '' ? 'Nama,' : ''} ${address == '' ? 'Alamat,' : ''} ${date.text == '' ? 'Tanggal lahir,' : ''} ${image == null ? 'Foto Profil,' : ''} masih kosong",
          context);
      return;
    }

    var token = await getToken();

    try {
      var request = await http.MultipartRequest(
          'POST', Uri.https(baseUrl, "user/newuser"));

      request.headers['Authorization'] = 'Bearer $token';
      request.fields['name'] = name;
      request.fields['tanggal_lahir'] = date.text;
      request.fields['gender'] = gender!;
      request.fields['alamat'] = address;

      var picture = await http.MultipartFile.fromPath("file", image!.path);

      request.files.add(picture);

      var response = await request.send();
      var responsed = await http.Response.fromStream(response);

      final responseData = json.decode(responsed.body);
    } catch (e) {
      print("error");
      print(e);
    }
  }

  handleNewToko(BuildContext context) async {
    if (!checkToko()) {
      showNotif("Nama toko atau lokasi masih kosong", context);
      return;
    }

    var token = await getToken();

    try {
      var request = await http.post(
        Uri.https(baseUrl, "toko_sampah/newtokosampah"),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          <String, String>{
            "nama_toko": storeName,
            "alamat_toko": storeLocation,
          },
        ),
      );

      var response = await json.decode(request.body);

      print(response);
    } catch (err) {
      print('error');
      print(err);
    }
  }

  checkToko() {
    bool _storeName = storeName == "" ? false : true;
    bool _storeLocation = storeLocation == "" ? false : true;

    return _storeName && _storeLocation;
  }

  checkComplete(File? image) {
    bool _name = name == "" ? false : true;
    bool _date = date.text == "" ? false : true;
    bool _image = image == null ? false : true;
    bool _address = address == "" ? false : true;

    return _name && _date && _image && _address && image != null;
  }

  @override
  Widget build(BuildContext context) {
    var profilePhoto = Provider.of<EditProfileState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditProfileHeader(),
                    SizedBox(height: 16),
                    EditPhoto(),
                    SizedBox(height: 16),
                    Text(
                      "Name",
                      style: AppText.subtitle(),
                    ),
                    SizedBox(height: 8),

                    // nama
                    TextField(
                      onChanged: (String value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: styleInput("Budi Hasan"),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Date of Birth",
                      style: AppText.subtitle(),
                    ),
                    SizedBox(height: 8),

                    // birthday
                    TextField(
                      controller: date,
                      decoration: styleInput("1 Januari 1990"),
                      onTap: () async {
                        DateTime? pickerDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        print(pickerDate);
                        setState(() {
                          date.text =
                              DateFormat('dd-MM-yyyy').format(pickerDate!);
                        });
                      },
                    ),
                    SizedBox(height: 12),

                    // Gender
                    Text(
                      "Gender",
                      style: AppText.subtitle(),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          width: 1,
                          color: AppColor.gray,
                        ),
                      ),
                      child: DropdownButton<String>(
                        hint: Text("Laki Laki"),
                        isExpanded: true,
                        isDense: true,
                        elevation: 2,
                        autofocus: true,
                        value: gender,
                        items: [
                          DropdownMenuItem(
                            child: Text("Laki Laki"),
                            value: 'Laki Laki',
                          ),
                          DropdownMenuItem(
                            child: Text("Perempuan"),
                            value: "Perempuan",
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 12),

                    // Address
                    Text(
                      "Address",
                      style: AppText.subtitle(),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      onChanged: (String value) {
                        setState(() {
                          address = value;
                        });
                      },
                      decoration: styleInput("Alamat anda"),
                    ),
                    SizedBox(height: 12),

                    // Email
                    Text(
                      "Email",
                      style: AppText.subtitle(),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: styleInput("budi@gmail.com"),
                      readOnly: true,
                    ),
                    SizedBox(height: 12),

                    // Store name
                    // Text(
                    //   "Store Name",
                    //   style: AppText.subtitle(),
                    // ),
                    // SizedBox(height: 8),
                    // TextField(
                    //   onChanged: (String value) {
                    //     setState(() {
                    //       storeName = value;
                    //     });
                    //   },
                    //   decoration: styleInput("Toko Botol Plastik"),
                    // ),
                    // SizedBox(height: 12),

                    // Store Location
                    // Text(
                    //   "Store Location",
                    //   style: AppText.subtitle(),
                    // ),
                    // SizedBox(height: 8),
                    // TextField(
                    //   onChanged: (String value) {
                    //     setState(() {
                    //       storeLocation = value;
                    //     });
                    //   },
                    //   decoration: styleInput("Surabaya"),
                    // ),
                    // SizedBox(height: 12),
                  ],
                ),
              ),
              Divider(
                thickness: 1.25,
                color: AppColor.primary,
              ),
              ChangePassword(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        // handleNewUser(profilePhoto.image, context);
                        handleNewToko(context);
                      },
                      child: Text(
                        "Save",
                        style: AppText.title(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(
        index: 4,
      ),
    );
  }

  styleInput(String hintText) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
          width: 1,
          color: AppColor.primary,
        ),
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
          color: AppColor.gray,
          width: 1,
        ),
      ),
      hintStyle: AppText.subtitle(
        color: AppColor.textSecondary,
      ),
      hintText: hintText,
    );
  }
}
