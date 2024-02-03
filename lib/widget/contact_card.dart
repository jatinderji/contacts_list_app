import 'package:contacts_app/data&models/contact.dart';
import 'package:contacts_app/data&models/lists.dart';
import 'package:contacts_app/provider/device_contact_provider.dart';
import 'package:contacts_app/screens/update_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget getRow(int index, BuildContext context, bool select) {
  bool ischecked= false;
  return InkWell(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => updateContact(index: index),
        )),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      height: 120,
      width: double.infinity,
      child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
            ),
            child: Center(
              child: Text(
                contacts[index].name[0].toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contacts[index].name.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.deepPurpleAccent
                            : Colors.purple,
                        borderRadius: BorderRadius.circular(4)),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      Department.values[contacts[index].depindex].name,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )),
                Text(contacts[index].contact),
                Text(contacts[index].email),
              ],
            ),
          ),
          trailing:
              select ? Consumer<DeviceContactProvider>(builder: 
            (context, value, child) => IconButton(onPressed: () {
              if(!contacts.contains(DeviceContacts[index])){
                value.onChecked(index);
                ischecked=true;
              }else{
                  value.unChecked(index);
                ischecked=false;
              }
                                

                 
                }, icon:Icon(ischecked? Icons.check_box: Icons.check_box_outline_blank) ),
              ) : null),
    ),
  );
}
