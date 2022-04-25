//
//  LoginDto.swift
//  Astronomy Picute Today
//
//  Created by José Lino Neto on 03/03/2022.
//

import Foundation

public struct LoginDto: Codable {
    public let email: String?
    public let password: String?
    public let token: String?
}
