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

    public func getApods(per: Int, page: Int) async throws -> ApiResponseDto? {
        try await BaseNetworkWorker<ApiResponseDto>(target: NasaApodTarget.getApods(per: per, page: page)).urlRequest()
    }

    public func getMonthsApods(per: Int = 100, page: Int = 1, startDate: String, endDate: String) async throws -> ApiResponseDto? {
        try await BaseNetworkWorker<ApiResponseDto>(target: NasaApodTarget.getMonthsApods(per: per, page: page, startDate: startDate, endDate: endDate)).urlRequest()
    }
}
