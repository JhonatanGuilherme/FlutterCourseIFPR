import 'package:flutter/material.dart';

import 'package:contact_book/app/my_app.dart';

class ContactList extends StatelessWidget {
  ContactList({Key? key}) : super(key: key);

  final list = [
    {
      'name': 'Renato',
      'phone number': '(83) 986672130',
      'avatar': 'https://pbs.twimg.com/media/BaUvJWJCMAAxeq8.jpg'
    },
    {
      'name': 'Joana',
      'phone number': '(83) 986672132',
      'avatar':
          'https://img.estadao.com.br/thumbs/640/resources/jpg/3/6/1630261686763.jpg'
    },
    {
      'name': 'Marcos',
      'phone number': '(83) 986672131',
      'avatar':
          'https://img.discogs.com/1Th4of2Ywf_6Io8EOyAMgPlhXMg=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-79325-1514804836-6626.jpeg.jpg'
    }
  ];

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
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            var contact = list[i];
            var avatar =
                CircleAvatar(backgroundImage: NetworkImage(contact['avatar']!));
            return ListTile(
              leading: avatar,
              title: Text(contact['name']!),
              subtitle: Text(contact['phone number']!),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
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
  }
}
