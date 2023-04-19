//
//  ApiErrorDto.swift
//  
//
//  Created by José Neto on 12/03/2023.
//

import Foundation

struct ApiErrorDto: Codable {
    let error: Bool
    let reason: String
}
