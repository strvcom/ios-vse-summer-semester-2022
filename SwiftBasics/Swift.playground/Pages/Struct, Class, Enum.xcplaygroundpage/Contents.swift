//: [Previous](@previous)
//: # Structures, classes, enumerations
import Foundation
//: ## Structures and classes
//: ### Declaration
example(of: "Struct declaration") {
    struct Person {
        let firstName: String
        let lastName: String
    }
    
    let me = Person(firstName: "Jan", lastName: "Schwarz")
    print(me)
}

example(of: "Struct with explicit initializer") {
    struct Person {
        let firstName: String
        let lastName: String
        
        init(lastName: String) {
            self.firstName = "Jan"
            self.lastName = lastName
        }
    }
    
    let me = Person(lastName: "Schwarz")
    print(me)
}

example(of: "Class declaration") {
    class Person {
        let firstName: String
        let lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    let me = Person(firstName: "Jan", lastName: "Schwarz")
    print(me)
}

//: ### Value type vs. reference type
example(of: "Value type") {
    struct Person {
        var firstName: String
        var lastName: String
    }

    let me = Person(firstName: "Jan", lastName: "Schwarz")
    var secondMe = me
    
    secondMe.firstName = "Honza"
    
    print("Me: ", me)
    print("SecondMe: ", secondMe)
}

example(of: "Reference type") {
    class Person {
        var firstName: String
        var lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    let me = Person(firstName: "Jan", lastName: "Schwarz")
    let secondMe = me
    
    secondMe.firstName = "Honza"
    
    print("Me: ", me.firstName)
    print("SecondMe: ", secondMe.firstName)
}

//: ### Mutating
example(of: "Mutating structure") {
    struct Person1 {
        let firstName: String
        let lastName: String
    }

    var _ = Person1(firstName: "Jan", lastName: "Schwarz")
    // me.firstName = "Honza"
    
    struct Person2 {
        var firstName: String
        var lastName: String
        
        mutating func updateFirstName() {
            firstName = "Honza"
        }
    }
    
    var me2 = Person2(firstName: "Jan", lastName: "Schwarz")
    me2.firstName = "Honza"
    me2.updateFirstName()
    print(me2)
}

example(of: "Mutating class") {
    class Person1 {
        let firstName: String
        let lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    let _ = Person1(firstName: "Jan", lastName: "Schwarz")
    // me.firstName = "Honza"

    class Person2 {
        var firstName: String
        var lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }

        func updateFirstName() {
            firstName = "Honza"
        }
    }
    
    let me2 = Person2(firstName: "Jan", lastName: "Schwarz")
    me2.firstName = "Honza"
    me2.updateFirstName()
}

//: ### Inheritance
example(of: "Inheritance") {
    class Person {
        var firstName: String
        var lastName: String
        
        init() {
            self.firstName = "Jan"
            self.lastName = "Schwarz"
        }
    }
    
    class UppercasedPerson: Person {
        override init() {
            super.init()
            
            self.firstName = "JAN"
            self.lastName = "SCHWARZ"
        }
    }
    
    let me = Person()
    let secondMe = UppercasedPerson()
    
    print(me.firstName)
    print(secondMe.firstName)
}

example(of: "Struct inheritance") {
    struct Person {
        var firstName: String
        var lastName: String
    }

//    struct UppercasedPerson: Person {
//    }
    
    // Try to inherit
}

//: ## Enumerations
//: ### Declaration
example(of: "Enum declaration") {
    enum Languages {
        case swift
        case java
        case javascript
    }
    
    let language: Languages = .swift
    print(language)
    
    switch language {
    case .swift:
        print("Je tam swift")
    case .java:
        print("java")
    case .javascript:
        print("javascript")
    }
}

//: ### Enum with raw value
example(of: "Enum with raw value") {
    // Enum with iOS languages with raw value
    // Initialize with raw value
}

//: ### Enum with associated value
example(of: "Enum with associated value") {
    // Enum with languages
    // Enum with platforms
    // Assign to variable
}

//: [Next](@next)
