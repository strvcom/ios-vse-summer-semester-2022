//: [Previous](@previous)

//: # Associated types

//: ### Protocol with associated type

import Foundation


protocol Screen {
    associatedtype ItemType // abstract type we named ItemType
    var items: [ItemType] { get set }
}

class MainScreen: Screen {
    typealias ItemType = String // explicit assignment of ItemType type
    var items: [String] = []
}

/// sample of automatic ItemType evaluation, it's Int
class SecondaryScreen: Screen {
    var items: [Int] = []
}

//: ### Constraints
protocol Identifiable {
    associatedtype ID: Hashable /// ID can be any type which is hashable
    var id: ID { get }
}

//: ### Generic constraint issue
/// typical issue
/// 'protocol can only be used as a generic constraint because it has Self or associated type requirements'

struct Person: Identifiable {
    /// ID is typed as UUID
    var id: UUID {
        UUID()
    }
}

struct Website: Identifiable {
    var id: String
}

let person1 = Person()
let person2 = Person()
print(person1.id)
print(person2.id)

//struct NotBuildable {
//    var identifiableVariable: Identifiable // we can't use Identifiable here as it already has its own associated type abstraction
//}

/// Solution opaque type
struct Buildable {
    var identifiableVariable: some Identifiable {
        Person()
    }
}

/// Solution generic types

// Not working
//func compareThing1(_ thing1: Identifiable, against thing2: Identifiable) -> Bool {
//    return true
//}

/// Generic represents substitu type which is resolved when used of concrete implementation
func compareThing2<T: Identifiable>(_ thing1: T, against thing2: T) -> Bool {
    thing1.id == thing2.id
}

compareThing2(person1, against: person2) // now the T stands for Person

let website = Website(id: "test")

// we can't compare different types even though both conforms Identifiable, method signature requires same type for both inputs
//compareThing2(person1, against: website)

///An opaque type can be seen as the reverse of a generic type. The types to which the generic types are mapped are dictated by the call site, and the function implementation is based on the abstract footprint of acceptable types. Those roles are reversed for a function with an opaque return type. An opaque type lets the function implementation pick the type for the value it returns in a way that is abstracted away from the call site.

//: [Next](@next)
