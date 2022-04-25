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

    public var postedDate: Date? {
        guard let localDate = date else { return nil }
        let formatter = DateFormatter.yyyyMMdd
        return formatter.date(from: localDate)
    }
}

extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
