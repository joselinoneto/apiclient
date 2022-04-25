//
//  ConfigLoader.swift
//  Astronomy Picute Today
//
//  Created by José Lino Neto on 19/02/2022.
//

import Foundation

class ConfigLoader {
    static let shared: ConfigLoader = ConfigLoader()
    let appConfig: AppConfiguration

    private init() {
        appConfig = ConfigLoader.parseFile()
    }

    private static func parseFile() -> AppConfiguration {
        let fileName: String = "Config.plist"
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: nil),
            let fileData = FileManager.default.contents(atPath: filePath)
        else {
            fatalError("Config file '\(fileName)' not loadable!")
        }

        do {
            let config = try PropertyListDecoder().decode(AppConfiguration.self, from: fileData)
            return config
        } catch {
            fatalError("Configuration not decodable from '\(fileName)': \(error)")
        }
    }
}

struct AppConfiguration: Decodable {
    let config: String
    let apiUrl: String
    let testFlags: TestFlags?
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case config
        case apiUrl = "api-url"
        case testFlags
        case token
    }
}

struct TestFlags: Decodable {
    let resetData: Bool
    let noSplash: Bool
    let applyTestData: Bool
}
