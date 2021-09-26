import 'package:contact_book/app/database/sqlite/connection.dart';
import 'package:flutter/material.dart';
import 'package:contact_book/app/my_app.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> _searchData() async {
    var db = await Connection.get();

    return db?.query('contacts');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
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
                        backgroundImage: NetworkImage(contact?['url_avatar']));
                    return ListTile(
                      leading: avatar,
                      title: Text(contact?['name']),
                      subtitle: Text(contact?['phone_number']),
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
