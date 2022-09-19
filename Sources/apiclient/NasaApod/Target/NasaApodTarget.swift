//
//  NasaApodTarget.swift
//  astronomia-app
//
//  Created by José Lino Neto on 02/06/2021.
//

import Foundation
import ToolboxAPIClient
import tools

public protocol NasaApodRequestable {
    func getApods(per: Int, page: Int) async throws -> ApiResponseDto?
    func getMonthsApods(per: Int, page: Int, startDate: String, endDate: String) async throws -> ApiResponseDto?
}

public enum NasaApodTarget {
    case getApods(per: Int, page: Int)
    case getMonthsApods(per: Int, page: Int, startDate: String, endDate: String)
    
}

extension NasaApodTarget: TargetType {
    public var queryString: [URLQueryItem] {
        switch self {
        case .getApods(let per, let page):
            return [
                URLQueryItem(name: "per", value: per.description),
                URLQueryItem(name: "page", value: page.description)]
        case .getMonthsApods(let per, let page, let startDate, let endDate):
            return [
                URLQueryItem(name: "per", value: per.description),
                URLQueryItem(name: "page", value: page.description),
                URLQueryItem(name: "startDate", value: startDate),
                URLQueryItem(name: "endDate", value: endDate)]
        }
    }
    
    public var baseURL: URL {
        return URL(string: ConfigLoader.shared.appConfig.apiUrl)!
    }
    
    public var path: String {
        switch self {
        case .getApods, .getMonthsApods:
            return "apod"
        }
    }
    
    public var method: HttpMethodEnum {
        switch self {
        case .getApods, .getMonthsApods:
            return .get
        }
    }
    
    public var headers: [String : String]? {
        let token = KeychainStorage.shared.getValueForKey(ConfigLoader.shared.appConfig.token) ?? ""
        return ["Authorization": "Bearer  \(token)"]
    }
}
