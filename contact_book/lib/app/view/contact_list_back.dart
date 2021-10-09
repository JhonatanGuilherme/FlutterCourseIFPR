import 'package:contact_book/app/domain/entities/contact.dart';
import 'package:contact_book/app/domain/services/contact_service.dart';
import 'package:contact_book/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  final _service = GetIt.I.get<ContactService>();

  @observable
  Future<List<Contact>>? list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Contact? contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.contactForm, arguments: contact)
        .then(refreshList());
  }

  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}

// Tirar dúvidas no fórum sobre o arquivo do MobX não ter sido gerado.
