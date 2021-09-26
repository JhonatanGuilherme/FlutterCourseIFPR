const createTable = '''
  CREATE TABLE contacts(
    id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    phone_number CHAR(16) NOT NULL,
    email VARCHAR(150) NOT NULL,
    url_avatar VARCHAR(300) NOT NULL
  )
''';

const insertContact1 = '''
  INSERT INTO contacts (name, phone_number, email, url_avatar)
  VALUES ('Renato', '(83) 986672130', 'renato@email.com', 'https://pbs.twimg.com/media/BaUvJWJCMAAxeq8.jpg')
''';

const insertContact2 = '''
  INSERT INTO contacts (name, phone_number, email, url_avatar)
  VALUES ('Joana', '(83) 986672132', 'joana@email.com', 'https://img.estadao.com.br/thumbs/640/resources/jpg/3/6/1630261686763.jpg')
''';

const insertContact3 = '''
  INSERT INTO contacts (name, phone_number, email, url_avatar)
  VALUES ('Marcos', '(83) 986672131', 'marcos@email.com', 'https://img.discogs.com/1Th4of2Ywf_6Io8EOyAMgPlhXMg=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-79325-1514804836-6626.jpeg.jpg'
  )
''';
