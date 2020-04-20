//
//  BuildConfigurations.swift
//  BuildConfigurationsTutorial
//
//  Created by Orestis on 20/4/20.
//  Copyright © 2020 Orestis Papadopoulos. All rights reserved.
//

import Foundation

private enum BuildConfiguration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }

        switch object {
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum API {
    static var backendURL: String {
        do {
            return try BuildConfiguration.value(for: "BACKEND_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
