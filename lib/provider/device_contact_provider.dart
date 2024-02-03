
import 'dart:js';

import 'package:contacts_app/data&models/contact.dart';
import 'package:contacts_app/data&models/lists.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class DeviceContactProvider extends ChangeNotifier{
 
 

void getContactPermission() async{
if( await Permission.contacts.isGranted){
   fetchContacts();
}else{
  Permission.contacts.request();
}
notifyListeners();
}

void fetchContacts() async{
DeviceContacts= await ContactsService.getContacts();
notifyListeners();
}
void onChecked(int index){
   contacts.add(ContactModel(name: DeviceContacts[index].givenName! , contact:DeviceContacts[index].emails!.first.toString() , email: DeviceContacts[index].phones!.first.toString(), depindex: 0));
   
  notifyListeners();


}

void unChecked(int index){
    contacts.remove(DeviceContacts[index]);
notifyListeners();
}



}