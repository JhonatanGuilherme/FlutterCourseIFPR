import 'package:contact_book/app/domain/entities/contact.dart';

abstract class ContactDAO {
  Future<List<Contact>> find();

  remove(int id);

  save(Contact contact);
}
