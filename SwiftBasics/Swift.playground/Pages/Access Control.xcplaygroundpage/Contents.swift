//: [Previous](@previous)
//: # Access control
import Foundation

struct Assignment {
    private var id: String
    internal var title: String
    fileprivate var description: String
    private(set) var completed: Bool
    
    init(id: String = "1234", title: String = "Title", description: String = "Long description", completed: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.completed = completed
    }
    
    mutating func complete() {
        self.completed = true
    }
}

//: ### Private
example(of: "Access Control") {
    // Initialize
    // Access id
    // Access completed
    // Modify completed
}

//: [Next](@next)
