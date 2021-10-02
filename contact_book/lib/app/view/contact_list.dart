import 'package:flutter/material.dart';
import 'package:contact_book/app/my_app.dart';
import 'package:contact_book/app/domain/entities/contact.dart';
import 'package:contact_book/app/database/sqlite/dao/contact_dao_impl.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  Future<List<Contact>> _searchData() async {
    return ContactDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
        future: _searchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var contacts = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Lista de Contatos'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyApp.contactForm);
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
              body: ListView.builder(
                  itemCount: contacts?.length,
                  itemBuilder: (context, i) {
                    var contact = contacts?[i];
                    var avatar = CircleAvatar(
                        backgroundImage: NetworkImage(contact!.urlAvatar!));
                    return ListTile(
                      leading: avatar,
                      title: Text(contact.name!),
                      subtitle: Text(contact.phoneNumber!),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Scaffold();
          }
        });
  }
}
