import 'package:contacts_app/provider/device_contact_provider.dart';
import 'package:contacts_app/screens/update_contact.dart';
import 'package:contacts_app/widget/contact_card.dart';
import 'package:contacts_app/data&models/lists.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:contacts_app/screens/new_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ContactProvider>().getSharedPrefrences();
        context.read<DeviceContactProvider>().getContactPermission();


    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts List'),
      ),
      bottomNavigationBar: const BottomAppBar(
        surfaceTintColor: Colors.white,
        elevation: 10,
        height: 50,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.blue,
        spaceBetweenChildren: 4,
        child: const Icon(Icons.add),
        activeChild: const Icon(FontAwesomeIcons.xmark),
        switchLabelPosition: true,
        children: [
          SpeedDialChild(
              shape: const CircleBorder(),
              labelWidget: const Text('Add Contact'),
              child: const Icon(
                Icons.person_2,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewContact()));
              }),
          SpeedDialChild(
              shape: const CircleBorder(),
              labelWidget: const Text('Import From Device'),
              child: const Icon(
                Icons.mobile_friendly,
                color: Colors.blue,
              )),
          SpeedDialChild(
            shape: const CircleBorder(),
            labelWidget: const Text('Import Contacts'),
            child: const Icon(
              Icons.file_copy,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: contacts.isEmpty
              ? const Center(
                  child: Text(
                    'No Contact yet..',
                    style: TextStyle(fontSize: 22),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount:
                        Provider.of<ContactProvider>(context).getlength(),
                    itemBuilder: (context, index) => InkWell(onTap: () => updateContact(index: index),child: getRow(index, ctx, false)),
                  ),
                )),
    );
  }
}
