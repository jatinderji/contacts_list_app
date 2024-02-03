import 'package:contacts_app/data&models/lists.dart';
import 'package:contacts_app/provider/device_contact_provider.dart';
import 'package:contacts_app/widget/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceContacState extends StatefulWidget {
  const DeviceContacState({super.key});

  @override
  State<DeviceContacState> createState() => _DeviceContacStateState();
}

class _DeviceContacStateState extends State<DeviceContacState> {
@override
  void initState() {

    Provider.of<DeviceContactProvider>(context).getContactPermission();

    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {

    return  ListView.builder(
                      itemCount: DeviceContacts.length ,

                      itemBuilder: (context, index) => getRow(index, ctx,true),
                    );
  }
}