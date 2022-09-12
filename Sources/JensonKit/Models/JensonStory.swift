//
//  JensonStory.swift
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

/// A struct that represents a story property in Jenson files.
/// - Note: This struct is available to Jenson files with manifest v2 or later.
public struct JensonStory: Codable {
    /// The UUID generated for this story.
    public let id = UUID()

    /// The name of the story.
    public let name: String

    /// The author of the story.
    public let author: String

    /// The current chapter title.
    public let chapter: String?

    /// The human-readable copyright string for the story.
    public let copyright: String?

    public init(name: String, author: String, chapter: String? = nil, copyright: String? = nil) {
        self.name = name
        self.author = author
        self.chapter = chapter
        self.copyright = copyright
    }

    private enum CodingKeys: CodingKey {
        case name
        case author
        case chapter
        case copyright
    }
}

extension JensonStory: RandomIdentifiedAccessable {}
