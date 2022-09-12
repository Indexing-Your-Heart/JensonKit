//
//  JensonBranching.swift
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

/// A struct that represents a question event.
public struct JensonQuestion: Codable {
    /// The UUID generated for this question.
    public let id = UUID()

    /// The question that will be asked.
    public let question: String

    /// The list of choices the player can make.
    public let options: [JensonChoice]

    public init(question: String, options: [JensonChoice]) {
        self.question = question
        self.options = options
    }

    private enum CodingKeys: CodingKey {
        case question
        case options
    }
}

extension JensonQuestion: RandomIdentifiedAccessable {
    public static func == (lhs: JensonQuestion, rhs: JensonQuestion) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(question)
    }
}

/// A struct that represents a choice that can be made by the player.
public struct JensonChoice: Codable {
    /// The UUID generated for this choice.
    public let id = UUID()

    /// The name of the choice as it appears on-screen.
    public let name: String

    /// The events that follow this choice.
    public let events: [JensonEvent]

    public init(name: String, events: [JensonEvent]) {
        self.name = name
        self.events = events
    }

    private enum CodingKeys: CodingKey {
        case name
        case events
    }
}

extension JensonChoice: RandomIdentifiedAccessable {}
