//
//  APIError.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 27.04.2022.
//

import Foundation

// Custom error handling
enum APIError: Error, LocalizedError {
    case invalidURLComponents
    case noResponse
    case unacceptableResponseStatusCode
    case customDecodingFailed
}
