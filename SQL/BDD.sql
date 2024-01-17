/* Create schema and all the tables - START */
/* Create schema */
CREATE SCHEMA eval03;
USE eval03;

/* Create table theaters */
CREATE TABLE theaters (
  theater_ID INT(11) NOT NULL AUTO_INCREMENT,
  theater_name VARCHAR(100) NOT NULL,
  theater_address VARCHAR(100) NOT NULL,
  theater_phone VARCHAR(14) NOT NULL,
  PRIMARY KEY (theater_ID)
) ENGINE=INNODB;

/* Create table rooms */
CREATE TABLE rooms (
  room_ID INT(11) NOT NULL AUTO_INCREMENT,
  room_name VARCHAR(30) NOT NULL,
  room_seat INT(4) NOT NULL,
  room_theater INT(11) NOT NULL,
  PRIMARY KEY (room_ID),
  FOREIGN KEY (room_theater)
    REFERENCES theaters(theater_ID)
    ON DELETE CASCADE
) ENGINE=INNODB;

/* Create table movies */
CREATE TABLE movies (
  movie_ID INT(11) NOT NULL AUTO_INCREMENT,
  movie_title VARCHAR(100) NOT NULL,
  movie_duration INT(3) NOT NULL,
  movie_type VARCHAR(30) NOT NULL,
  movie_synopsis TEXT(1000) NOT NULL,
  PRIMARY KEY (movie_ID)
) ENGINE=INNODB;

/* Create table sessions */
CREATE TABLE sessions (
  session_ID INT(11) NOT NULL AUTO_INCREMENT,
  session_entries INT(4) NOT NULL,
  session_date DATE NOT NULL,
  session_schedule TIME NOT NULL,
  session_room INT(11) NOT NULL,
  session_movie INT(11) NOT NULL,
  PRIMARY KEY (session_ID),
  FOREIGN KEY (session_room)
    REFERENCES rooms(room_ID)
    ON DELETE CASCADE,
  FOREIGN KEY (session_movie)
    REFERENCES movies(movie_ID)
    ON DELETE CASCADE
) ENGINE=INNODB;

/* Create table users */
CREATE TABLE users (
  user_ID VARCHAR(36) NOT NULL,
  user_email VARCHAR(254) NOT NULL,
  user_password VARCHAR(60) NOT NULL,
  user_role VARCHAR(11) NOT NULL,
  PRIMARY KEY (user_ID)
) ENGINE=INNODB;
/* Create schema and all the tables - END */


/* Fulfill the tables - START */
/* Fulfill the table theaters */
INSERT INTO theaters (theater_ID, theater_name, theater_address, theater_phone) VALUES
  (NULL, 'CGR', 'C. C. Roussillon Nord Littoral, 66600 Rivesaltes', '08 92 68 85 88'),
  (NULL, 'MegaCastillet', 'ZAC du rond point du mas Rouma, 66000 Perpignan', '08 92 68 75 35'),
  (NULL, 'Castillet', '1 bd Wilson, 66000 Perpignan', '04 30 82 15 60');

/* Fulfill the table rooms */
INSERT INTO rooms (room_ID, room_name, room_seat, room_theater) VALUES
  (NULL, 'A', 235, 1),
  (NULL, 'B', 212, 1),
  (NULL, 'C', 224, 1),
  (NULL, 'D', 185, 1),
  (NULL, '1', 240, 2),
  (NULL, '2', 230, 2),
  (NULL, '3', 220, 2),
  (NULL, '4', 210, 2),
  (NULL, 'Lumiere', 84, 3),
  (NULL, 'Camera', 75, 3);
  
/* Fulfill the table movies */
INSERT INTO movies (movie_ID, movie_title, movie_duration, movie_type, movie_synopsis) VALUES
  (NULL, "Harry Potter a l'ecole des sorciers", 152, 'Fantastique', "Harry Potter, un jeune orphelin, est élevé par son oncle et sa tante qui le détestent. Alors qu'il était haut comme trois pommes, ces derniers lui ont raconté que ses parents étaient morts dans un accident de voiture. Le jour de son onzième anniversaire, Harry reçoit la visite inattendue d'un homme gigantesque se nommant Rubeus Hagrid, et celui-ci lui révèle qu'il est en fait le fils de deux puissants magiciens et qu'il possède lui aussi d'extraordinaires pouvoirs."),
  (NULL, "Harry Potter et la chambre des secrets", 161, 'Fantastique', "Alors que l'oncle Vernon, la tante Pétunia et son cousin Dudley reçoivent d'importants invités à dîner, Harry Potter est contraint de passer la soirée dans sa chambre. Dobby, un elfe, fait alors son apparition. Il lui annonce que de terribles dangers menacent l'école de Poudlard et qu'il ne doit pas y retourner en septembre. Harry refuse de le croire. Mais sitôt la rentrée des classes effectuée, ce dernier entend une voix malveillante."),
  (NULL, "Harry Potter et le prisonnier d'Azkaban", 142, 'Fantastique', "Sirius Black, un dangereux sorcier criminel, s'échappe de la sombre prison d'Azkaban avec un seul et unique but : se venger d'Harry Potter, entré avec ses amis Ron et Hermione en troisième année à l'école de sorcellerie de Poudlard, où ils auront aussi à faire avec les terrifiants Détraqueurs."),
  (NULL, "Harry Potter et la coupe de feu", 157, 'Fantastique', "La quatrième année à l'école de Poudlard est marquée par le Tournoi des trois sorciers. Les participants sont choisis par la fameuse coupe de feu, qui est à l'origine d'un scandale. Elle sélectionne Harry Potter tandis qu'il n'a pas l'âge légal requis. Après avoir surmonté une série d'épreuves physiques de plus en plus difficiles, il est enfin confronté à Celui-Dont-On-Ne-Doit-Pas-Prononcer-Le-Nom."),
  (NULL, "Harry Potter et l'ordre du phenix", 138, 'Fantastique', "À sa cinquième année à l'école de sorcellerie de Poudlard, Harry Potter passe pour un illuminé, le ministre de la magie Cornelius Fudge ayant officiellement réfuté les révélations de l'adolescent et de son directeur, Dumbleore, disant que le terrifiant Lord Voldermort est de retour. Une nouvelle professeure à Poudlard refuse d'enseigner les techniques défensives magiques, et Harry crée donc un groupe de résistance clandestin, surnommé l'armée de Dumbledore, à l'image de l'Ordre du Phénix."),
  (NULL, "Harry Potter et le prince de sang mele", 153, 'Fantastique', "Cette sixième année scolaire de Harry Potter à l'école de sorciers commence par une dispute avec son ennemi juré Draco Malfoy, en qui les forces des ténèbres placent désormais leurs espoirs. Accaparés par les émois et les malentendus amoureux, Hermione et Ron remarquent à peine que Harry enquête à la demande de Dumbledore sur le passé du professeur Slughorn. Entré dans le cercle des intimes de l'enseignant sur la foi de bonnes notes grâce à un manuel scolaire annoté, Harry se rapproche du but."),
  (NULL, "Harry Potter et les reliques de la mort 1", 146, 'Fantastique', "Sans les conseils et la protection de leurs professeurs, Harry, Ron et Hermione ont pour mission de détruire les horcruxes, les origines de l'immortalité de Voldemort. Bien que plus que jamais ils doivent compter l'un sur l'autre, les forces du mal menacent de les désunir. Les Death Eaters de Voldemort ont pris le contrôle du ministère de la Magie et de Hogwarts et ils recherchent Harry. Aussi Harry et ses amis se préparent pour la dernière confrontation."),
  (NULL, "Harry Potter et les reliques de la mort 2", 130, 'Fantastique', "Dans la deuxième partie de cette finale épique, la bataille entre les forces du bien et celles du mal du monde des magiciens dégénère en une guerre tous azimuts. Les enjeux n'ont jamais été si grands et personne n'est en sécurité. Mais c'est peut-être Harry Potter qui pourrait être appelé à faire le sacrifice ultime alors qu'il se rapproche de la confrontation tant attendue avec Lord Voldemort. Tout se termine ici.");
  
/* Fulfill the table sessions */
INSERT INTO sessions (session_ID, session_entries, session_date, session_schedule, session_room, session_movie) VALUES
  /* CGR - 2024-01-17 */
  (NULL, 25, '2024-01-17', '17:00',1 , 1),
  (NULL, 35, '2024-01-17', '17:15',2 , 2),
  (NULL, 45, '2024-01-17', '17:30',3 , 3),
  (NULL, 55, '2024-01-17', '17:45',4 , 4),
  (NULL, 60, '2024-01-17', '20:00',1 , 5),
  (NULL, 70, '2024-01-17', '20:15',2 , 6),
  (NULL, 80, '2024-01-17', '20:30',3 , 7),
  (NULL, 90, '2024-01-17', '20:45',4 , 8),
  /* CGR - 2025-01-17 */
  (NULL, 5, '2025-01-17', '17:00',1 , 1),
  (NULL, 15, '2025-01-17', '17:15',2 , 2),
  (NULL, 25, '2025-01-17', '17:30',3 , 3),
  (NULL, 35, '2025-01-17', '17:45',4 , 4),
  (NULL, 40, '2025-01-17', '20:00',1 , 5),
  (NULL, 50, '2025-01-17', '20:15',2 , 6),
  (NULL, 60, '2025-01-17', '20:30',3 , 7),
  (NULL, 70, '2025-01-17', '20:45',4 , 8),
  /* MegaCastillet - 2024-01-17 */
  (NULL, 12, '2024-01-17', '17:00',5 , 1),
  (NULL, 42, '2024-01-17', '17:15',6 , 2),
  (NULL, 27, '2024-01-17', '17:30',7 , 3),
  (NULL, 38, '2024-01-17', '17:45',8 , 4),
  (NULL, 51, '2024-01-17', '20:00',5 , 5),
  (NULL, 64, '2024-01-17', '20:15',6 , 6),
  (NULL, 36, '2024-01-17', '20:30',7 , 7),
  (NULL, 28, '2024-01-17', '20:45',8 , 8),
  /* MegaCastillet - 2025-01-17 */
  (NULL, 7, '2025-01-17', '17:00',5 , 1),
  (NULL, 105, '2025-01-17', '17:15',6 , 2),
  (NULL, 66, '2025-01-17', '17:30',7 , 3),
  (NULL, 51, '2025-01-17', '17:45',8 , 4),
  (NULL, 93, '2025-01-17', '20:00',5 , 5),
  (NULL, 4, '2025-01-17', '20:15',6 , 6),
  (NULL, 27, '2025-01-17', '20:30',7 , 7),
  (NULL, 35, '2025-01-17', '20:45',8 , 8),
  /* Castillet - 2024-01-17 */
  (NULL, 16, '2024-01-17', '16:30',9 , 1),
  (NULL, 24, '2024-01-17', '17:00',10 , 2),
  /* Castillet - 2025-01-17 */
  (NULL, 37, '2025-01-17', '19:30',9 , 3),
  (NULL, 49, '2025-01-17', '20:00',10 , 4);

/* Fulfill the table users */
INSERT INTO users (user_ID, user_email, user_password, user_role) VALUES 
  (uuid(), 'harry.potter@poudlard.com', MD5('ginny'), 'user'),
  (uuid(), 'ronald.weasley@poudlard.com', MD5('ginny'), 'user'),
  (uuid(), 'luna.lovegood@poudlard.com', MD5('looney'), 'user'),
  (uuid(), 'hermione.granger@poudlard.com', MD5('library'), 'user'),
  (uuid(), 'minerva.mcgonagall@poudlard.com', MD5('cat'), 'superuser'),
  (uuid(), 'severus.rogue@poudlard.com', MD5('lily'), 'superuser'),
  (uuid(), 'albus.dumbledore@poudlard.com', MD5('gellert'), 'admin');
/* Fulfill the tables - END */