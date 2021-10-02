import 'package:get_it/get_it.dart';
import 'package:contact_book/app/domain/entities/contact.dart';
import 'package:contact_book/app/domain/interfaces/contact_dao.dart';
import 'package:contact_book/app/domain/exception/domain_layer_exception.dart';

class ContactService {
  final _dao = GetIt.I.get<ContactDAO>();

  save(Contact contact) {
    validateName(contact.name);
    validateEmail(contact.email);
    _dao.save(contact);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validateName(String? name) {
    const min = 3, max = 50;

    if (name == null) {
      throw DomainLayerException('O campo Nome é obrigatório!');
    } else if (name.length < min) {
      throw DomainLayerException(
          'O Nome deve possuir pelo menos $min caracteres!');
    } else if (name.length > max) {
      throw DomainLayerException(
          'O Nome deve possuir no máximo $max caracteres!');
    }
  }

  validateEmail(String? email) {
    if (email == null) {
      throw DomainLayerException('O campo Email é obrigatório!');
    } else if (!email.contains('@')) {
      throw DomainLayerException('O Email deve possuir @!');
    }
  }

  validatePhoneNumber(String? phoneNumber) {
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');

    if (phoneNumber == null) {
      throw DomainLayerException('O campo Número é obrigatório!');
    } else if (!format.hasMatch(phoneNumber)) {
      throw DomainLayerException('O Telefone inserido é inválido!');
    }
  }
}
