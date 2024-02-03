enum Department{
 Other, HR, Technology, Marketing 
}

class ContactModel {
  String name;
  String contact;
  String email;
  int depindex;
  ContactModel({required this.name, required this.contact, required this.email, required this.depindex});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json["name"],
        contact: json["contact"], email: json["email"], depindex: json["depindex"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "contact": contact,
        "email":email,
        "depindex":depindex
    };
    
}