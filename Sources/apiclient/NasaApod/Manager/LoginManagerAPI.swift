//
//  LoginManagerAPI.swift
//  Astronomy Picute Today
//
//  Created by José Lino Neto on 03/03/2022.
//

import Foundation
import Combine
//
import ToolboxAPIClient

public class LoginManagerAPI: LoginRequestable {
    public func login(email: String, password: String) async throws -> LoginDto? {
        let login: LoginDto = LoginDto(email: email, password: password, token: nil, deviceId: nil)
        return try await BaseNetworkWorker<LoginDto, ApiErrorDto>(target: LoginTarget.login).urlRequest(contentBody: login)
    }
    
    public func createUser(email: String, password: String) async throws -> LoginDto? {
        let login: LoginDto = LoginDto(email: email, password: password, token: nil, deviceId: nil)
        return try await BaseNetworkWorker<LoginDto, ApiErrorDto>(target: LoginTarget.createUser).urlRequest(contentBody: login)
    }
    
    public func me() async throws -> UserDto?{
        try await BaseNetworkWorker<UserDto, ApiErrorDto>(target: LoginTarget.me).urlRequest()
    }
    
    public func deviceLogin(deviceId: String) async throws -> LoginDto? {
        let login: LoginDto = LoginDto(email: nil, password: nil, token: nil, deviceId: deviceId)
        return try await BaseNetworkWorker<LoginDto, ApiErrorDto>(target: LoginTarget.deviceLogin).urlRequest(contentBody: login)
    }
    
    public init() {

    }
}
