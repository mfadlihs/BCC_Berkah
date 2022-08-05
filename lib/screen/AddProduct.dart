import 'dart:io';

import 'package:bcc/api/baseUrl.dart';
import 'package:bcc/api/token.dart';
import 'package:bcc/components/Navbar.dart';
import 'package:bcc/layout/addProduct/AddProductHeader.dart';
import 'package:bcc/layout/addProduct/DefaultPhoto.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:dio/dio.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var dio = Dio();

  // TextEditingController? nama_barang, harga_barang, stok_barang, deskripsi;
  String nama_barang = " ";
  int harga_barang = 1;
  int stok_barang = 1;
  String deskripsi = " ";
  bool isAvailable = true;

  String? tipe_barang = "Recycling Trash";

  File? image;

  Future pickImage() async {
    try {
      final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pic == null) {
        return;
      }

      setState(() {
        this.image = File(pic.path);
        isAvailable = false;
      });
    } catch (e) {}
  }

  Future handleNewProduct(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token')!;

    print(token);

    try {
      var request =
          http.MultipartRequest('POST', Uri.https(baseUrl, "barang/add"));

      request.headers['Authorization'] = 'Bearer $token';

      request.fields['nama_barang'] = '$nama_barang';
      request.fields['harga_barang'] = '$harga_barang';
      request.fields['stok_barang'] = '$stok_barang';
      request.fields['tipe_barang'] = '$tipe_barang';
      request.fields['tipe_barang'] = tipe_barang!;
      request.fields['deskripsi'] = deskripsi;

      var picture = await http.MultipartFile.fromPath("file", image!.path);

      request.files.add(picture);

      var response = await request.send();

      var responsed = await http.Response.fromStream(response);

      final responseData = json.decode(responsed.body);

      if (responseData['success']) {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: "Produk berhasil ditambahkan",
          ),
        );
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: "salah berhasil ditambahkan",
          ),
        );
      }
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Mohon masukkan yang benar",
        ),
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddProductHeader(),
                SizedBox(height: 16),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: image == null
                          ? DefaultPhoto()
                          : Image.file(
                              image!,
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            side: BorderSide(
                              color: AppColor.primary,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            pickImage();
                          },
                          child: Text(
                            'Upload Photo',
                            style: AppText.subtitle(),
                          ),
                        ),
                        SizedBox(height: 8),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            side: BorderSide(
                              width: 1,
                              color: isAvailable
                                  ? AppColor.textSecondary
                                  : AppColor.primary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: image == null
                              ? null
                              : () {
                                  setState(() {
                                    image = null;
                                    isAvailable = true;
                                  });
                                },
                          child: Text(
                            'Delete Photo',
                            style: AppText.subtitle(
                              color: isAvailable
                                  ? AppColor.textSecondary
                                  : AppColor.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // nama
                Text(
                  "Product Name",
                  style: AppText.subtitle(),
                ),
                SizedBox(height: 8),
                TextField(
                  // controller: nama_barang,
                  onChanged: (String? val) {
                    setState(() {
                      nama_barang = val!;
                    });
                  },
                  decoration: styleInput("Botol Plastik"),
                ),
                SizedBox(height: 12),

                // category
                Text(
                  "Product Category",
                  style: AppText.subtitle(),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      width: 1,
                      color: AppColor.gray,
                    ),
                  ),
                  child: DropdownButton<String>(
                    hint: Text("Recycling Trash"),
                    isExpanded: true,
                    isDense: true,
                    elevation: 2,
                    autofocus: true,
                    value: tipe_barang,
                    items: [
                      DropdownMenuItem(
                        child: Text("Recycling Trash"),
                        value: 'Recycling Trash',
                      ),
                      DropdownMenuItem(
                        child: Text("Semi-Recycling Trash"),
                        value: "Semi-Recycling Trash",
                      ),
                      DropdownMenuItem(
                        child: Text("Non Recycling Trash"),
                        value: "Non Recycling Trash",
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        tipe_barang = value!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 12),

                // Harga
                Text(
                  "Price",
                  style: AppText.subtitle(),
                ),
                SizedBox(height: 8),
                TextField(
                  // controller: harga_barang,
                  onChanged: (String? val) {
                    setState(() {
                      harga_barang = int.parse(val!);
                    });
                  },
                  decoration: styleInput("Rp10.000"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),

                // Quantity
                Text(
                  "Quantity",
                  style: AppText.subtitle(),
                ),
                SizedBox(height: 8),
                TextField(
                  onChanged: (String? val) {
                    setState(() {
                      stok_barang = int.parse(val!);
                    });
                  },
                  decoration: styleInput("10"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),

                // Description
                Text(
                  "Deskripsi",
                  style: AppText.subtitle(),
                ),
                SizedBox(height: 8),
                TextField(
                  onChanged: (String? val) {
                    setState(() {
                      deskripsi = val!;
                    });
                  },
                  decoration: styleInput("Masukkan deskripsi"),
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                ),
                SizedBox(height: 12),

                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () async {
                      await handleNewProduct(context);
                      Navigator.pushNamed(context, "/");
                    },
                    child: Text(
                      'Tambah Produk',
                      style: AppText.title(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
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
