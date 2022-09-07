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
    let version: Int

    /// The timeline of events that will be played.
    let timeline: [JensonEvent]

    public init(version: Int, timeline: [JensonEvent]) {
        self.version = version
        self.timeline = timeline
    }
}
