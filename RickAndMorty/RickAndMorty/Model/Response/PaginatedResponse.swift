//
//  PaginatedResponse.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 27.04.2022.
//

import Foundation

struct PaginatedResponse<T: Decodable> {
    let info: PaginationInfo
    let results: [T]
}

extension PaginatedResponse: Decodable {}
