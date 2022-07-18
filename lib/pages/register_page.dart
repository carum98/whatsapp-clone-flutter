import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';
import 'package:whatsapp_clone_flutter/widgets/input_text_filed.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', password = '', name = '', phone = '';
    File? image;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _AvatarPicker(
                onChanged: (value) => image = value,
              ),
              const SizedBox(height: 20),
              InputTextField(
                label: 'Name',
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 20),
              InputTextField(
                label: 'Email',
                onChanged: (value) => email = value,
              ),
              const SizedBox(height: 20),
              InputTextField(
                label: 'Phone',
                onChanged: (value) => phone = value,
              ),
              const SizedBox(height: 20),
              InputTextField(
                label: 'Password',
                onChanged: (value) => password = value,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthReposoitory>().register(
                        email: email,
                        password: password,
                        name: name,
                        phone: phone,
                        image: image,
                      );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarPicker extends StatefulWidget {
  final Function(File) onChanged;
  const _AvatarPicker({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<_AvatarPicker> createState() => __AvatarPickerState();
}

class __AvatarPickerState extends State<_AvatarPicker> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'gallery',
          child: Text('Gallery'),
        ),
        const PopupMenuItem(
          value: 'camera',
          child: Text('Camera'),
        ),
      ],
      onSelected: (value) async {
        if (value == 'gallery') {
          final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            setState(() => _image = File(pickedFile.path));

            final file = File(pickedFile.path);

            setState(() => _image = file);
            widget.onChanged(file);
          }
        } else if (value == 'camera') {
          final pickedFile = await _picker.pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            final file = File(pickedFile.path);

            setState(() => _image = file);
            widget.onChanged(file);
          }
        }
      },
      child: CircleAvatar(
        radius: 70,
        foregroundImage: _image != null ? FileImage(_image!) : null,
        child: const Icon(Icons.add, size: 70, color: Colors.white),
      ),
    );
  }
}
