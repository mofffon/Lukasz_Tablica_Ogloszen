CREATE DATABASE IF NOT EXISTS Lukasz_Bulletin_Board;
USE Lukasz_Bulletin_Board;

CREATE TABLE IF NOT EXISTS users(
    id INT NOT NULL AUTO_INCREMENT,
    name varchar(255) DEFAULT NULL,
    email varchar(255) NOT NULL,
    about_me TEXT NOT NULL,
    password varchar(255) NOT NULL,
    city varchar(255) DEFAULT NULL,
    voivodship varchar(45) DEFAULT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    edited_at timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

INSERT INTO users VALUES
(null, 'Łukasz', 'lukasz@gmail.com', "Fajny ze mnie gość. Jestem za Zagłębiem Sosnowiec.",'Kanapa12!', 'Sosnowiec', 'Śląskie', null, null),
(null, 'Kamil', 'kamil@gmail.com', 'Lubię pływać. Gram w piłkę nożna i jeżdżę na rowerze. Lubię gitarę.','Kanapa12!', 'Bielsko Biała', 'Śląskie', null, null),
(NULL, 'Marta', 'marta@gmail.com','Nie jestem królową dramatu. Twardo stąpam po ziemi. Lubię czytać.','Kanapa12!', 'Wrocław', 'Dolnosląskie', NULL, NULL);


CREATE TABLE IF NOT EXISTS categories (
    id INT NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    icon VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO categories VALUES
(1, 'Jedzenie', 'fa-solid fa-ice-cream'),
(2, 'Noclegi', 'fa-solid fa-bed'),
(3, 'Motoryzacja', 'fa-solid fa-car-side'),
(4, 'Elektronika', 'fa-solid fa-calculator'),
(5, 'Nieruchmości', 'fa-solid fa-house'),
(6, 'Zdrowie i Uroda', 'fa-solid fa-prescription-bottle-medical'),
(7, 'Usługi', 'fa-solid fa-paint-roller'),
(8, 'Muzyka i Edukacja', 'fa-solid fa-music'),
(9, 'Sport i Hobby', 'fa-solid fa-volleyball'),
(10, ' Praca', 'fa-solid fa-building'),
(11, 'Inne', 'fa-solid fa-circle-question'),
(12, 'Za Darmo', 'fa-solid fa-gift');

CREATE TABLE IF NOT EXISTS status (
	id INT NOT NULL UNIQUE,
    name VARCHAR(255)
);

INSERT INTO status VALUES
(1, 'Nowe'),
(2, 'Używane'),
(3, "Odnowione");

CREATE TABLE IF NOT EXISTS adverts (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    short_description VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    status_id INT NOT NULL,
    price_in_zlotys FLOAT ,
    city VARCHAR(255) NOT NULL,
    voivodship VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	edited_at timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY foreign_key_user_id (user_id),
    KEY foreign_key_category_id (category_id),
    KEY foreign_key_status_id (status_id),
    CONSTRAINT foreign_key_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT foreign_key_category_id FOREIGN KEY (category_id) REFERENCES categories(id),
    CONSTRAINT foreign_key_status_id FOREIGN KEY (status_id) REFERENCES status (id)
);

INSERT INTO adverts VALUES
(
    NULL, 
    1, 
    'Toyota Auris 2013 r.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus doloribus cupiditate id necessitatibus voluptas quisquam aperiam illum vitae deserunt tenetur quas quam ducimus nesciunt quibusdam, debitis maiores repudiandae cumque sequi.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus doloribus cupiditate id necessitatibus voluptas quisquam aperiam illum vitae deserunt tenetur quas quam ducimus nesciunt quibusdam, debitis maiores repudiandae cumque sequi.</p><ad>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse, qui molestias at, illo dicta quam sed ullam quia animi eveniet aliquid laborum ut sapiente, quod molestiae vel neque beatae modi? Illum laboriosam porro qui veritatis nihil facilis accusamus suscipit quibusdam iusto quae dicta unde fuga ipsam, perferendis ad eligendi, laudantium minus dolores autem commodi fugiat vitae. Consequatur deserunt impedit quidem? Distinctio debitis explicabo consectetur in, exercitationem repellat, dolorum quos quam nostrum dignissimos voluptates et minima totam accusantium quae amet doloremque consequuntur autem assumenda? Voluptate magnam nostrum aliquam incidunt at beatae. Numquam provident, beatae quisquam laborum aliquid hic necessitatibus alias praesentium blanditiis? Sint explicabo, quasi enim necessitatibus ex, ipsa ad, illum </p><p>ratione natus nulla asperiores culpa animi quidem. Adipisci, fuga explicabo. Expedita quod sunt ipsam delectus quis omnis iusto perferendis blanditiis ipsum, repellendus in sapiente. Eligendi officia quam vel eius perferendis, ex temporibus rerum dolorum cum quae tenetur in autem. Porro. Est rerum labore laboriosam dolorum facere facilis consectetur ad eum. Unde reiciendis inventore ex voluptas eius voluptates nobis dolorum delectus iusto. Quae cupiditate ut velit adipisci est tempore deserunt esse. Aliquid consequatur hic maxime nulla ipsa libero, nemo sunt aspernatur a</p>',
    'Używana Toyota Auris w bardzo dobrym stanie. Polecam!',
    3,
    2,
    33000,
    'Warszawa',
    'Mazowieckie',
    NULL,
    NULL
)
,
(
    NULL,
    2,
    'Restauracja Stachowicka',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus doloribus cupiditate id necessitatibus voluptas quisquam aperiam illum vitae deserunt tenetur quas quam ducimus nesciunt quibusdam, debitis maiores repudiandae cumque sequi.</p><h3>Podstawowe menu:</h3><ul><li>Śniadania - 20 zł</li><li>Obiady - 40 zł</li><li>Kolacje - 30 zł</li><li>Alkohol - różnie :)</li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus doloribus cupiditate id necessitatibus voluptas quisquam aperiam illum vitae deserunt tenetur quas quam ducimus nesciunt quibusdam, debitis maiores repudiandae cumque sequi.</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse, qui molestias at, illo dicta quam sed ullam quia animi eveniet aliquid laborum ut sapiente, quod molestiae vel neque beatae modi? Illum laboriosam porro qui veritatis nihil facilis accusamus suscipit quibusdam iusto quae dicta unde fuga ipsam, perferendis</p><p>ad eligendi, laudantium minus dolores autem commodi fugiat vitae. Consequatur deserunt impedit quidem? Distinctio debitis explicabo consectetur in, exercitationem repellat, dolorum quos quam nostrum dignissimos voluptates et minima totam accusantium quae amet doloremque consequuntur autem assumenda? Voluptate magnam nostrum aliquam incidunt at beatae. Numquam provident, beatae quisquam laborum aliquid hic necessitatibus alias praesentium blanditiis? Sint explicabo, quasi enim necessitatibus ex, ipsa ad, illum</p><p>ratione natus nulla asperiores culpa animi quidem. Adipisci, fuga explicabo. Expedita quod sunt ipsam delectus quis omnis iusto perferendis blanditiis ipsum, repellendus in sapiente. Eligendi officia quam vel eius perferendis, ex temporibus rerum dolorum cum quae tenetur in autem. Porro. Est rerum labore laboriosam dolorum facere facilis consectetur ad eum. Unde reiciendis inventore ex voluptas eius voluptates nobis dolorum delectus iusto. Quae cupiditate ut velit adipisci est tempore deserunt esse. Aliquid consequatur hic maxime nulla ipsa libero, nemo sunt aspernatur a</p>',
    'Zapraszamy na śniadania, obiady i kolacje w przystępnych cenach. Również alkohol :)',
    1,
    1,
    NULL,
    'Rzeszów',
    'Podkarpackie',
    NULL,
    NULL
),
(
    NULL,
    3,
    'Playstatoion 3 Classic 60GB plus gry',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus doloribus cupiditate id necessitatibus voluptas quisquam aperiam illum vitae deserunt tenetur quas quam ducimus nesciunt quibusdam, debitis maiores repudiandae cumque sequi.</p><h3>Podstawowe menu:</h3><ul><li>Śniadania - 20 zł</li><li>Obiady - 40 zł</li><li>Kolacje - 30 zł</li><li>Alkohol - różnie :)</li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus doloribus cupiditate id necessitatibus voluptas quisquam aperiam illum vitae deserunt tenetur quas quam ducimus nesciunt quibusdam, debitis maiores repudiandae cumque sequi.</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse, qui molestias at, illo dicta quam sed ullam quia animi eveniet aliquid laborum ut sapiente, quod molestiae vel neque beatae modi? Illum laboriosam porro qui veritatis nihil facilis accusamus suscipit quibusdam iusto quae dicta unde fuga ipsam, perferendis</p><p>ad eligendi, laudantium minus dolores autem commodi fugiat vitae. Consequatur deserunt impedit quidem? Distinctio debitis explicabo consectetur in, exercitationem repellat, dolorum quos quam nostrum dignissimos voluptates et minima totam accusantium quae amet doloremque consequuntur autem assumenda? Voluptate magnam nostrum aliquam incidunt at beatae. Numquam provident, beatae quisquam laborum aliquid hic necessitatibus alias praesentium blanditiis? Sint explicabo, quasi enim necessitatibus ex, ipsa ad, illum</p>',
	'Świetna konsola do zabawy. Wspaniałe tytuły!',
    4,
    2,
    700,
    'Sosnowiec',
    'Śląskie',
    NULL,
    NULL
);

CREATE TABLE IF NOT EXISTS images
(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    value TEXT
);
