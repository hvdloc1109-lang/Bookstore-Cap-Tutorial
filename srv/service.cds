using { tutorial.db as db } from '../db/schema';

service BookstoreService {
    entity Books as projection on db.Books;
    entity Author as projection on db.Author;
    entity Chapters as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;
}