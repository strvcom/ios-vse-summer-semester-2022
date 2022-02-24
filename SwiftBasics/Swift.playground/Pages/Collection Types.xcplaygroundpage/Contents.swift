//: [Previous](@previous)
//: # Collection types
import Foundation
//: ## Arrays
//: ### Declaration
example(of: "Array declaration") {
    let _ = [String]()
    var names: [String] = ["Jan", "Jan", "CJ"]
    
    print(names[2])
    names[0] = "Honza"
}
//: ### Properties and methods
example(of: "Array properties and methods") {
    var names: [String] = ["Jan", "Jan", "CJ"]
    print(names.count)
    print(names.isEmpty)
    print(names.first)
    names.append("Tomas")
    print(names)
    names.append(contentsOf: ["A", "B"])
    print(names)
    names.insert("First", at: 0)
    print(names)
    names.remove(at: 0)
    print(names)
    names.removeAll()
}
//: ### Loop array
example(of: "Loop array") {
    let names: [String] = ["Jan", "Jan", "CJ"]
    
    for name in names {
        print(name)
    }
    
    for index in 0...(names.count-1) {
        print(index)
        print(names[index])
    }
    
    for index in 0..<names.count {
        print(index)
        print(names[index])
    }
    
    for (index, name) in names.enumerated() {
        print(index, name)
    }
}

//: ## Sets
//: ### Declaration
example(of: "Set declaration") {
    let names: [String] = ["Jan", "Jan", "CJ"]
    let setOfNames = Set(names)
    print(setOfNames)
}
//: ## Dictionaries
//: ### Declaration
example(of: "Dictionary declaration") {
    let _ = [String: String]()
    var numberForLanguages: [String: Int] = [:]
    
    numberForLanguages["Swift"] = 5
    print(numberForLanguages["Swift"])
    print(numberForLanguages["Java"])
    numberForLanguages["Java"] = 0
    print(numberForLanguages["Java"])
}
//: ### Loop
example(of: "Loop dictionary") {
    var numberForLanguages: [String: Int] = [:]
    
    numberForLanguages["Swift"] = 5
    numberForLanguages["Java"] = 0

    for (key, value) in numberForLanguages {
        print(key, value)
    }
}
//: [Next](@next)
