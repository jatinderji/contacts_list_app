import 'dart:convert';

import 'package:contacts_app/data&models/contact.dart';
import 'package:contacts_app/data&models/lists.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactProvider extends ChangeNotifier{
  late SharedPreferences sp;
  int selectedIndex = -1;


  int getlength(){
    return contacts.length;
  }
void update(int index,String name,String contact , String email,int depindex){
   contacts[index].name = name;
   contacts[index].contact = contact;
   contacts[index].email=email;
   contacts[index].depindex=depindex;
     saveIntoSp();                     
    notifyListeners();

}
void onsave(String name, String email,String phone, int depindex){

  contacts.add(ContactModel(name: name, contact: phone, email: email, depindex: depindex));
  saveIntoSp();
    notifyListeners();

}

void onremove(int index){
  contacts.removeAt(index);
}

getSharedPrefrences() async {
    sp = await SharedPreferences.getInstance();
    readFromSp();
        notifyListeners();

  }

  saveIntoSp() {
    //
    List<String> contactListString =
        contacts.map((contact) => jsonEncode(contact.toJson())).toList();
    sp.setStringList('myData', contactListString);
        notifyListeners();

  }

  readFromSp() {
    //
    List<String>? contactListString = sp.getStringList('myData');
    if (contactListString != null) {
      contacts = contactListString
          .map((contact) => ContactModel.fromJson(json.decode(contact)))
          .toList();
              notifyListeners();

    }
    //
  }
}