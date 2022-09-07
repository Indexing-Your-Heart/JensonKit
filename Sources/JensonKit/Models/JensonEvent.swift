//
//  JensonEvent.swift
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

/// A struct that represents an event in Jenson.
///
/// An event may be a comment, dialogue, or question.
public struct JensonEvent: Codable {
    /// An enumeration representing the various event types.
    public enum EventType: String, Codable {
        /// A no-op event that represents a comment.
        case comment

        /// An event that represents a piece of dialogue, either from a character or narrator.
        case dialogue

        /// An event that represents a question being asked in which the player must make a choice.
        case question

        /// An event that represents a choice to be made.
        case choice
    }

    /// The event type.
    public let type: EventType

    /// The author or speaker of the event.
    public let who: String

    /// The text contents of the event that will be said or interpreted.
    public let what: String

    /// The question being asked, if provided.
    public let question: JensonQuestion?
}

/// A struct that represents a question event.
public struct JensonQuestion: Codable {
    /// The question that will be asked.
    public let question: String

    /// The list of choices the player can make.
    public let options: [JensonChoice]
}

/// A struct that represents a choice that can be made by the player.
public struct JensonChoice: Codable {
    /// The name of the choice as it appears on-screen.
    public let name: String

    /// The events that follow this choice.
    public let events: [JensonEvent]
}
