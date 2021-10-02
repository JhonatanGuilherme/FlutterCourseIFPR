import 'package:flutter/material.dart';
import 'view/contact_form.dart';
import 'view/contact_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const home = '/';
  static const contactForm = 'contact-form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        home: (context) => const ContactList(),
        contactForm: (context) => const ContactForm()
      },
    );
  }
}
