//
//  JensonFile.swift
//  Created by Marquis Kurt on 9/7/22.
//  This file is part of Indexing Your Heart.
//
//  Indexing Your Heart is non-violent software: you can use, redistribute, and/or modify it under the terms of the
//  CNPLv7+ as found in the LICENSE file in the source code root directory or at
//  <https://git.pixie.town/thufie/npl-builder>.
//
//  Indexing Your Heart comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law. See the CNPL for
//  details.

import Foundation

/// A struct that represents a Jenson file.
public struct JensonFile: Codable {
    /// The version of the Jenson file, which dictates what features are available.
    public let version: Int

    /// The application that wrote the file.
    /// - Note: This field is available to Jenson files with manifest v2 or later.
    public let application: JensonApp?

    /// The story associated with this Jenson file.
    /// - Note: This field is available to Jenson files with manifest v2 or later.
    public let story: JensonStory?

    /// The timeline of events that will be played.
    public let timeline: [JensonEvent]

    public init(
        version: Int,
        application: JensonApp? = nil,
        story: JensonStory? = nil,
        timeline: [JensonEvent]
    ) {
        self.version = version
        self.application = application
        self.story = story
        self.timeline = timeline
    }
}
