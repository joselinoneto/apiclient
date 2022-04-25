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
    public func login(email: String, password: String) -> AnyPublisher<LoginDto?, Error> {
        let login: LoginDto = LoginDto(email: email, password: password, token: nil)
        return BaseNetworkWorker<LoginDto>(target: LoginTarget.login(email: email, password: password))
            .urlRequest(contentBody: login)
    }
    
    public func createUser(email: String, password: String) -> AnyPublisher<LoginDto?, Error> {
        let login: LoginDto = LoginDto(email: email, password: password, token: nil)
        return BaseNetworkWorker<LoginDto>(target: LoginTarget.createUser(email: email, password: password))
            .urlRequest(contentBody: login)
    }
    
    public func me() -> AnyPublisher<UserDto?, Error> {
        BaseNetworkWorker<UserDto>(target: LoginTarget.me).urlRequest()
    }
    
    public init() {

    }
}
