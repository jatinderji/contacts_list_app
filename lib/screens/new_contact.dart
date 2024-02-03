import 'package:contacts_app/data&models/contact.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Department selDepartment = Department.Other;

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Contact Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: contactController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: const InputDecoration(
                hintText: 'Contact Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
                hintText: 'email Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ))),
          ),
          DropdownButton(
            value: selDepartment,
            items: Department.values
                .map((category) => DropdownMenuItem(
                    value: category, child: Text(category.name.toUpperCase())))
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                selDepartment = value as Department;
              });
            },
          ),
          const SizedBox(height: 10),
          Consumer<ContactProvider>(
            builder: (ctx, value, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      String email = emailController.text.trim();
                      int depindex = selDepartment.index;

                      value.onsave(name, email, contact, depindex);
                      Navigator.pop(context);
                    },
                    child: const Text('Save')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
