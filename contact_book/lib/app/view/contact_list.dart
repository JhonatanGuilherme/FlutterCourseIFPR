import 'package:flutter/material.dart';
import 'package:contact_book/app/my_app.dart';
import 'package:contact_book/app/view/contact_list_back.dart';
import 'package:contact_book/app/domain/entities/contact.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  ContactList({Key? key}) : super(key: key);

  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url) {
    try {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } catch (e) {
      return const CircleAvatar(child: Icon(Icons.person));
    }
  }

  Widget iconEditButton(Function() onPressed) {
    return IconButton(
        icon: const Icon(Icons.edit), color: Colors.blue, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function() onPressed) {
    return IconButton(
        icon: const Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Excluir'),
                    content: const Text('Confirma a exclusão?'),
                    actions: [
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: onPressed,
                      )
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Contatos'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(MyApp.contactForm);
                })
          ],
        ),
        body: Observer(builder: (contact) {
          return FutureBuilder<List<Contact>>(
              future: _back.list!,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  List<Contact>? contacts = snapshot.data;
                  return ListView.builder(
                      itemCount: contacts?.length,
                      itemBuilder: (context, i) {
                        Contact? contact = contacts?[i];
                        return ListTile(
                          leading: circleAvatar(contact!.urlAvatar!),
                          title: Text(contact.name!),
                          subtitle: Text(contact.phoneNumber!),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, contact);
                                }),
                                iconRemoveButton(context, () {
                                  _back.remove(contact.id!);
                                  Navigator.of(context).pop();
                                })
                              ],
                            ),
                          ),
                        );
                      });
                }
              });
        }));
  }
}
