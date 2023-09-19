import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:image_compare/image_compare.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  File? image1, image2;

  @override
  Widget build(BuildContext context) {
    double? assetsResult;

    void showResult() {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'difference ratio: ${(assetsResult! * 100).toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.purple,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 30),
          margin: const EdgeInsets.all(8),
        ),
      );
      setState(() {
        image1 = null;
        image2 = null;
      });
    }

    Future<File> pickImage() async {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      final image = File(pickedImage!.path);
      return image;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Information'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: image1 != null ? Colors.grey : null,
                ),
                child: image1 != null
                    ? Image.file(
                        image1!,
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          image1 = await pickImage();
                          setState(() {});
                        },
                        child: const Text('pick image'),
                      ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: image2 != null ? Colors.grey : null,
                ),
                child: image2 != null
                    ? Image.file(
                        image2!,
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          image2 = await pickImage();
                          setState(() {});
                        },
                        child: const Text('pick image'),
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () async {
              assetsResult = await compareImages(
                src1: image1,
                src2: image2,
              );
              showResult();
            },
            child: const Text('Compare'),
          ),
        ],
      ),
    );
  }
}
