class Contact {
  String name;
  String contact;
  Contact({required this.name, required this.contact});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        contact: json["contact"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "contact": contact,
    };
    
}
