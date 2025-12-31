using {
    cuid,
    managed,
    sap.common.Currencies
} from '@sap/cds/common';

namespace tutorial.db;

entity Books : cuid, managed {
    title       : String;
    author      : Association to Author;
    genre       : Association to Genres;
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(9, 2);
    currency    : Association to Currencies;
    stock       : Integer;
    status      : Association to BookStatus;
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity Genres{
    key code : Genre;
    description : String;
}

type Genre : String enum{
    Fiction = 'Fiction';
    Scirence = 'Science';
    Cooking = 'Cooking';
    Fantasy = 'Fantacy';
    Hobby = 'Hobby';
};

entity BookStatus {
    key code        : String(1) enum {
            Available = 'A';
            Low_stock = 'L';
            Unavailable = 'U';
        }
        criticality : Integer;
        displayText : String;
}

entity Author : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
    key book   : Association to Books;
        number : Integer;
        title  : String;
        Pages  : Integer;
}
