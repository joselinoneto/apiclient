//
// Created by José Lino Neto on 26/10/2021.
//

import Foundation
public struct ApiResponseDto: Codable {
    public let items: [NasaApodDto]
    public let apiMetadata: ApiMetadataDto

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case apiMetadata = "metadata"
    }
}