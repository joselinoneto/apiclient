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
    func getApodsRandomly() async throws -> [NasaApodDto]?
}

public enum NasaApodTarget {
    case getApods(per: Int, page: Int)
    case getApodsRandomly
    
}

extension NasaApodTarget: TargetType {
    public var queryString: [URLQueryItem] {
        switch self {
        case .getApods(let per, let page):
            return [
                URLQueryItem(name: "per", value: per.description),
                URLQueryItem(name: "page", value: page.description)]
        default:
            return []
        }
    }
    
    public var baseURL: URL {
        return URL(string: ConfigLoader.shared.appConfig.apiUrl)!
    }
    
    public var path: String {
        switch self {
        case .getApods:
            return "apod"
        case .getApodsRandomly:
            return "randomly"
        }
    }
    
    public var method: HttpMethodEnum {
        switch self {
        case .getApods:
            return .get
        case .getApodsRandomly:
            return .get
        }
    }
    
    public var headers: [String : String]? {
        let token = KeychainStorage.shared.getValueForKey(ConfigLoader.shared.appConfig.token) ?? ""
        return ["Authorization": "Bearer  \(token)"]
    }
}
