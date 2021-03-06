public class XmlStreamReaderDemo {
    public string xmlString{get;set;}
    public List<Book> books{get;set;}
    
    public XmlStreamReaderDemo(){
        books = new List<Book>();
        xmlString = '<books><book>My Book</book><book>Your Book</book></books>';
    }
    
    public pageReference doSome(){
        XmlStreamReader xsr = new XmlStreamReader(xmlString);
        books = parseBooks(xsr);
        system.debug('Books>>>'+books);
        return null;
    }
    
    // Create a class Book for processing
    public class Book {
        public String name{get;set;}
        public String author{get;set;}
        public String version{get;set;}
    }

    public List<Book> parseBooks(XmlStreamReader reader) {
        List<Book> books = new List<Book>();
        while(reader.hasNext()) {
            // Start at the beginning of the book and make sure that it is a book
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
                if('Book' == reader.getLocalName()) {
                    // Pass the book to the parseBook method (below) 
                    Book book = parseBook(reader);
                    books.add(book);
                }
            }
            reader.next();
        }
        return books;
    }

    // Parse through the XML, determine the characters
    Book parseBook(XmlStreamReader reader) {
        Book book = new Book();
        
        while(reader.hasNext()) {
            if(reader.getEventType() == XmlTag.END_ELEMENT) {
                break;
            }else if(reader.getEventType() == XmlTag.CHARACTERS) {
                book.name = reader.getText();
            }
            //system.debug('Local Name:::'+ reader.getLocalName());
            reader.next();
        }
        return book;
    }
}