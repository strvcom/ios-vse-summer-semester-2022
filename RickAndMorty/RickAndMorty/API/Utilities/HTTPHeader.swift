//
//  HTTPHeader.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 27.04.2022.
//

import Foundation

enum HTTPHeader {
    // key
    enum HeaderField: String {
        case contentType = "Content-Type"
    }

    // value
    enum ContentType: String {
        case json = "application/json"
    }
}
