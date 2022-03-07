import Foundation

struct BibTeX {
    enum Types: String {
        case proceeding = "@inproceedings"
        case article = "@article"
    }
    
    let type: Types
    let id: String
    let author: [String]
    let title: String
    let bookTitle: String?
    let journal: String?
    let volume: UInt?
    let number: UInt?
    let pages: ClosedRange<UInt>?
    let year: UInt
    let doi: String?
    
    init(forProceeding id: String, author: [String], title: String, bookTitle: String, pages: ClosedRange<UInt>? = nil, year: UInt, doi: String? = nil) {
        self.type = .proceeding
        self.id = id
        self.author = author
        self.title = title
        self.bookTitle = bookTitle
        self.pages = pages
        self.year = year
        self.doi = doi
        
        self.journal = nil
        self.volume = nil
        self.number = nil
    }
    
    init(forArticle id: String, author: [String], title: String, journal: String, volume: UInt? = nil, number: UInt? = nil, pages: ClosedRange<UInt>?, year: UInt, doi: String? = nil) {
        self.type = .article
        self.id = id
        self.author = author
        self.title = title
        self.journal = journal
        self.volume = volume
        self.number = number
        self.pages = pages
        self.year = year
        self.doi = doi
        
        self.bookTitle = nil
    }
    
    func cite() -> String {
        let text: [String]
        
        switch type {
        case .proceeding:
            text = [
                "bookTitle={\(bookTitle!)}",
                pages == nil ? "" : "pages={\(pages!.lowerBound) -- \(pages!.upperBound)}",
                "year={\(year)}",
                doi == nil ? "" : "doi={\(doi!)}"
            ]
        case .article:
            text = [
                "journal={\(journal!)}",
                volume == nil ? "" : "volume={\(volume!)}",
                number == nil ? "" : "number={\(number!)}",
            ]
        }
        
        let unifiedText = [
            "title={{\(title)}}",
            "author={\(author.joined(separator: " and "))}",
            pages == nil ? "" : "pages={\(pages!.lowerBound) -- \(pages!.upperBound)}",
            "year={\(year)}",
            doi == nil ? "" : "doi={\(doi!)}"
        ]
        
        return "\(type.rawValue){\(id),\n\(text.filter { $0 != "" }.joined(separator: ",\n")),\n\(unifiedText.filter { $0 != "" }.joined(separator: ",\n")),\n}"
    }
}

