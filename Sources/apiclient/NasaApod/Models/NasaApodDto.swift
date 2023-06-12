//
//  NasaApodDto.swift
//  astronomia-app
//
//  Created by José Lino Neto on 02/06/2021.
//

import Foundation

public struct NasaApodDto: Codable {
    public var id: UUID?
    public let date: String?
    public let explanation: String?
    public let mediaType: String?
    public let thumbnailUrl: String?
    public let title: String?
    public let url: String?
    public let hdurl: String?
    public let copyright: String?
    public var postedDate: Date?
}
