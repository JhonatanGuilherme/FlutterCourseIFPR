import 'package:sqflite/sqflite.dart';
import 'package:contact_book/app/domain/entities/contact.dart';
import 'package:contact_book/app/domain/interfaces/contact_dao.dart';

import '../connection.dart';

class ContactDAOImpl implements ContactDAO {
  Database? _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('contacts');
    List<Contact> list = List.generate(result.length, (index) {
      var row = result[index];
      return Contact(row['id'], row['name'], row['phone_number'], row['email'],
          row['url_avatar']);
    });

    return list;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    String sql = 'DELETE FROM contacts WHERE id = ?';
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(Contact contact) async {
    _db = await Connection.get();
    String sql;
    if (contact.id == null) {
      sql =
          'INSERT INTO contacts (name, phone_number, email, url_avatar) VALUES (?, ?, ?, ?)';
      _db!.rawInsert(sql, [
        contact.name,
        contact.phoneNumber,
        contact.email,
        contact.urlAvatar
      ]);
    } else {
      sql =
          'UPDATE contacts SET name = ?, phone_number = ?, email = ?, url_avatar = ? WHERE id = ?';
      _db!.rawUpdate(sql, [
        contact.name,
        contact.phoneNumber,
        contact.email,
        contact.urlAvatar,
        contact.id
      ]);
    }
  }
}
