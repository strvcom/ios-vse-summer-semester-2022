//: [Previous](@previous)

//: # Protocols Protocol inheritance

import Foundation

//: ### Protocol inheritance

/// Protocol definitions heirarchy
protocol Identifiable {
    var id: String { get }
    func identify()
}

protocol NamedIdentifiable: Identifiable {
    var name: String { get }
}

protocol DatedIdentifiable: Identifiable {
    var date: Date { get }
}

/// compose by inheritance of all protocols above
protocol NamedDatedIdetifiable: NamedIdentifiable, DatedIdentifiable {}

struct Person: NamedDatedIdetifiable {
    var name: String
    var date: Date
    var id: String

    func identify() {

    }
}

//: ### Default implementation

/// default implementation of blueprint
extension Identifiable {
    var id: String {
        UUID().uuidString
    }
    
    func identify() {
        print("Protocol id \(id)")
    }
}

/// extra new method in extension
extension NamedIdentifiable {
    func doMagic() {
        print("I'm doing magic")
    }
}

class Animal: Identifiable {
    func identify() {
        print("Animal id \(id)")
    }
}

class FlyingAnimal: Animal {
    override func identify() {
        print("Flying animal id \(id)")
    }
}

let animal = Animal()
animal.identify()

let flyingAnimal = FlyingAnimal()
flyingAnimal.identify()

let person = Person(name: "Pete", date: Date(), id: "23412")
person.doMagic()

//: ### Constraints

protocol UppercasedNamed {
    var uppercasedName: String { get }
}

/// constraint sample `where` key word
extension UppercasedNamed where Self: NamedIdentifiable {
    var uppercasedName: String {
        /// using variables & methods of NameIdentifiable to implement UppercasedNamed
        /// constraint may be also used with classes
        name.uppercased()
    }
}

/// sample of static variable in protocol definition
protocol StaticName: AnyObject {
    static var name: String { get }
}

/// sample that static variable can be conformted also as class variable
class User: StaticName {
    class var name: String {
        "USER"
    }
}



//: [Next](@next)
