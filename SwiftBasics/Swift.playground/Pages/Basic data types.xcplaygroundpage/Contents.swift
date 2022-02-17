//: # Basic data types
import Foundation

//: ### Strings
example(of: "Strings") {
    let name = "Jan"
    print(name)
    print(type(of: name))
    
    let surname: String = "Schwarz"
    print(surname)
    print(type(of: surname))
}
//: ### Mutability
example(of: "Mutability") {
    let _ = "Jan"
    // name = "Honza" let is constant
    
    var surname = "Schwarz"
    surname = "Cerny"
    print(surname)
}
//: ### Numbers
example(of: "Numbers") {
    let age: Int = 31
    print(age)
    print(type(of: age))
    
    let height = 1.75
    print(type(of: height))

    let height2: Float = 1.75
    print(type(of: height2))
}
//: ### Boolean
example(of: "Boolean") {
    var isBald: Bool = false
    print(type(of: isBald))
    
    isBald.toggle()
    print(isBald)
}
//: ### Tuple
example(of: "Tuple") {
    // let name: (firstName: String, surname: String) = ("Jan", "Schwarz")
    let name: (String, String) = ("Jan", "Schwarz")
    print(name)
    print(name.0)
}
//: [Next](@next)
