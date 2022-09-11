//
//  LoginTarget.swift
//  Astronomy Picute Today
//
//  Created by José Lino Neto on 03/03/2022.
//

import Foundation
import ToolboxAPIClient
import tools

public protocol LoginRequestable {
    func createUser(email: String, password: String) async throws -> LoginDto?
    func deviceLogin(deviceId: String) async throws -> LoginDto?
    func login(email: String, password: String) async throws -> LoginDto?
    func me() async throws -> UserDto?
}

public enum LoginTarget {
    case createUser
    case login
    case deviceLogin
    case me
}

extension LoginTarget: TargetType {
    public var queryString: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }
    
    public var baseURL: URL {
        return URL(string: ConfigLoader.shared.appConfig.apiUrl)!
    }
    
    public var path: String {
        switch self {
        case .createUser:
            return "create"
        case .login:
            return "login"
        case .me:
            return "me"
        case .deviceLogin:
            return "device"
        }
    }
    
    public var method: HttpMethodEnum {
        switch self {
        case .createUser:
            return .post
        case .login:
            return .post
        case .me:
            return .get
        case .deviceLogin:
            return .post
        }
    }
    
    public var headers: [String : String]? {
        nil
    }
}
