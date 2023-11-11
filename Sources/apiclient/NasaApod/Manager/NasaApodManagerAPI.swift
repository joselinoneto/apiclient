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
        try await BaseNetworkWorker<ApiResponseDto, ApiErrorDto>(target: NasaApodTarget.getApods(per: per, page: page)).urlRequest()
    }

    public func getMonthsApods(per: Int = 31, page: Int = 1, startDate: String, endDate: String) async throws -> ApiResponseDto? {
        let target = NasaApodTarget.getMonthsApods(per: per, page: page, startDate: startDate, endDate: endDate)
        return try await BaseNetworkWorker<ApiResponseDto, ApiErrorDto>(target: target).urlRequest()
    }

    public func syncData(per: Int, page: Int) async throws -> ApiResponseDto? {
        let target = NasaApodTarget.syncData(per: per, page: page)
        return try await BaseNetworkWorker<ApiResponseDto, ApiErrorDto>(target: target).urlRequest()
    }

    public func getRefreshMonthsApods(per: Int = 31, page: Int = 1, startDate: String, endDate: String) async throws -> ApiResponseDto? {
        let target = NasaApodTarget.getRefreshMonthsApods(per: per, page: page, startDate: startDate, endDate: endDate)
        return try await BaseNetworkWorker<ApiResponseDto, ApiErrorDto>(target: target).urlRequest()
    }
}
