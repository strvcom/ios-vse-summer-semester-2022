//: [Previous](@previous)
//: # Optionals
import Foundation
//: ## Introduction
//: ### Why optionals
example(of: "Type casting") {
    let stringAge = "31"
    let age = Int(stringAge)
    print(age.debugDescription)
    print(type(of: age))
}
//: ### Declare an optional
example(of: "Optional integer") {
    var age: Int? = 31
    print(age.debugDescription)
    age = nil
    print(age.debugDescription)
    
//    var name: String = "Jan"
//    name = nil
}
//: ## Unwrapping
//: ### Force unwrap
example(of: "Force unwrap") {
    var age: Int? = 31
    print(age.debugDescription)
    
    if age == nil {
        print("It is nil")
    } else {
        print(age!)
    }
    
    age = nil
//    print(age!)
}
//: ### If let
example(of: "If let") {
    let age: Int? = 31
    
    if let unwrappedAge = age {
        print(type(of: age))
        print(type(of: unwrappedAge))
        print(unwrappedAge)
    }
}
//: ### Guard let
example(of: "Guard let") {
    let age: Int? = nil
    
    guard let unwrappedAge = age else {
        print("There was nil")
        return
    }
    
    print(unwrappedAge)
}
//: ## Working with optionals
//: ### Comparison
example(of: "Comparison") {
    let age: Int? = nil
    let name = "Jan"
    
    // let olderAge = age + 2
    
    if age == nil || name == "Jan" {
        print("There was nil")
    } else if age == 31 {
        print("There was 31")
    } else if let unwrappedAge = age, unwrappedAge < 31  {
        print(unwrappedAge)
    }
    
    guard let unwrappedAge = age else {
        return
    }
    
    if age == nil {
        
    } else if unwrappedAge < 31 {
        
    }
}
//: ### Calling function on optional
example(of: "Calling function on optional") {
    let age: Int? = 31
    
    if let unwrappedAge = age {
        print(unwrappedAge)
        print(unwrappedAge.advanced(by: 2))
    }
    
    let advancedAge = age?.advanced(by: 2)
    print(advancedAge)
    print(type(of: advancedAge))
    
    if age != nil {
        let advancedByThree = age!.advanced(by: 3)
        print(advancedByThree)
        print(type(of: advancedByThree))
    }
}
//: ### Implicitly unwrapped optional
example(of: "Implicitly unwrapped optional") {
    var age: Int! = 31
    print(type(of: age))
    print(age.advanced(by: 2))
    print(age.debugDescription)
    if age < 33 {
        print("Yes")
    }
    
    age = nil
    // let _ = age + 1
    
    if age == nil {
        age = 33
    }
    
    print(age.advanced(by: 3))
}
//: [Next](@next)
