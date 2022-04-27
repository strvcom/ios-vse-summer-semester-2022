//
//  Injected.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 27.04.2022.
//

import Foundation

@propertyWrapper
struct Injected<T> {
    let wrappedValue: T

    init() {
        wrappedValue = DIContainer.shared.resolve()
    }
}
