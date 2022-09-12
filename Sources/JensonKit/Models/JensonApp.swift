//
//  JensonApp.swift
//  Created by Marquis Kurt on 9/12/22.
//  This file is part of Indexing Your Heart.
//
//  Indexing Your Heart is non-violent software: you can use, redistribute, and/or modify it under the terms of the
//  CNPLv7+ as found in the LICENSE file in the source code root directory or at
//  <https://git.pixie.town/thufie/npl-builder>.
//
//  Indexing Your Heart comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law. See the CNPL for
//  details.

import Foundation

/// A struct that represents an application in a Jenson manifest file.
/// - Note: This application is only present on Jenson files with manifest v2 or later.
public struct JensonApp: Codable {
    /// The UUID generated for this application.
    public let id = UUID()

    /// The name of the application that authored the file.
    public let name: String

    /// The URL to the website associated with this application.
    public let website: String?

    public init(name: String, website: String? = nil) {
        self.name = name
        self.website = website
    }

    private enum CodingKeys: CodingKey {
        case name
        case website
    }
}

extension JensonApp: RandomIdentifiedAccessable {}
