//
//  NasaApodManagerAPI.swift
//  astronomia-app
//
//  Created by José Lino Neto on 02/06/2021.
//

import Foundation
import Combine
//
import ToolboxAPIClient

public class NasaApodManagerAPI: NasaApodRequestable {
    public init() {
        
    }

    public func getApods(per: Int, page: Int) -> AnyPublisher<ApiResponseDto?, Error> {
        BaseNetworkWorker<ApiResponseDto>(target: NasaApodTarget.getApods(per: per, page: page)).urlRequest()
    }

    public func getApodsRandomly() -> AnyPublisher<[NasaApodDto]?, Error> {
        BaseNetworkWorker<[NasaApodDto]>(target: NasaApodTarget.getApodsRandomly).urlRequest()
    }
}
