//
// Created by José Lino Neto on 26/10/2021.
//

import Foundation
public struct ApiMetadataDto: Codable {
    public let per: Int
    public let total: Int
    public let page: Int
}