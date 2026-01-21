import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Uint8List? imageBytes;
  GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController dobController = TextEditingController();
  bool isLike1 = false;
  bool isLike2 = false;

  void imagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        imageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff675b5b),
      body: SingleChildScrollView(
        child: Form(
          key: formKeys,
          child: Column(
            children: [
              SizedBox(height: 160),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 590,
                  width: 320,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white, Colors.white70],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 4),
                      Text(
                        "Let's do this! 🚀",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          imagePicker();
                        },
                        child: imageBytes == null
                            ? Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1),
                                ),
                                child: Center(
                                  child: Icon(Icons.person, size: 55),
                                ),
                              )
                            : Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1),
                                  image: DecorationImage(
                                    image: MemoryImage(imageBytes!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 15),
                      myClass(
                        "Enter your Name",
                        TextInputType.name,
                        nameController,
                      ),
                      myClass(
                        "Enter your Dob",
                        TextInputType.datetime,
                        dobController,
                      ),
                      myClass(
                        "Enter your Email",
                        TextInputType.emailAddress,
                        emailController,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "password is required";
                            }
                            return null;
                          },
                          obscureText: isLike1,
                          controller: passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            hintText: "Enter your password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isLike1 = !isLike1;
                                });
                              },
                              icon: Icon(
                                isLike1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "confirmPassword is required";
                            }
                            return null;
                          },
                          obscureText: isLike2,
                          controller: confirmPassword,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            hintText: "Confirm password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isLike2 = !isLike2;
                                });
                              },
                              icon: Icon(
                                isLike2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 1),
                      ElevatedButton(
                        onPressed: () async {
                          if (!formKeys.currentState!.validate()) {
                            return;
                          }
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );

                            String uid = userCredential.user!.uid;
                            String? imageUrl;

                            if (imageBytes != null) {
                              final ref = FirebaseStorage.instance.ref().child(
                                "GameAppskiez_images/${DateTime.now().microsecondsSinceEpoch}.jpeg",
                              );
                              final uploadTask = await ref.putData(imageBytes!);
                              imageUrl = await ref.getDownloadURL();
                            }
                            await FirebaseFirestore.instance
                                .collection("gameApp")
                                .doc(uid)
                                .set({
                                  "name": nameController.text.trim(),
                                  "dob": dobController.text.trim(),
                                  "email": emailController.text.trim(),
                                  "password": passwordController.text.trim(),
                                  "confirmPassword": confirmPassword.text
                                      .trim(),
                                  "uid": uid,
                                  "image": imageUrl,
                                  "accountOpened": Timestamp.now(),
                                });
                            setState(() {
                              nameController.clear();
                              dobController.clear();
                              emailController.clear();
                              passwordController.clear();
                              confirmPassword.clear();
                              imageBytes = null;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Registered successfully"),
                              ),
                            );
                            print("User registered");
                          } on FirebaseAuthException catch (g) {
                            String errorMessage;

                            if (g.code == "email-already-in-use") {
                              errorMessage = "This already registered";
                            } else if (g.code == "weak-password") {
                              errorMessage =
                                  "Password should be atleast 8 characters";
                            } else if (g.code == "invalid-email") {
                              errorMessage = "Invalid email address";
                            } else {
                              errorMessage = "Error: ${g.message}";
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage)),
                            );
                            print("Error: ${g.code} - ${g.message}");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade400,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(style: BorderStyle.solid),
                          ),
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account"),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              " Log in",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myClass(
  String name,
  TextInputType type,
  TextEditingController controller,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.black54),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.black54),
        ),
        hintText: name,
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}
