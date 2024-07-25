using {kaztakata as my} from '../db/schema';

service UserService {
    @readonly entity Books as projection on my.Books;
}
