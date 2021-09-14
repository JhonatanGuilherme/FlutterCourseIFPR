import 'package:contact_book/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Contatos"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.contactForm);
            },
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: ListView(),
    );
  }
}
