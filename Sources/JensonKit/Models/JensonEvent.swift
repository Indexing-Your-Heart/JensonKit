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
    public enum EventType: String, Codable, CaseIterable {
        /// A no-op event that represents a comment.
        case comment

        /// An event that represents a piece of dialogue, either from a character or narrator.
        case dialogue

        /// An event that represents a question being asked in which the player must make a choice.
        case question

        /// An event that represents a choice to be made.
        case choice

        /// An event that represents a trigger to refresh the contents of the screen.
        /// This usually indicates an image or audio change.
        /// - Note: This event type is available to Jenson files with manifest v2 or later.
        case refresh
    }

    /// The UUID generated for this event.
    public let id = UUID()

    /// The event type.
    public let type: EventType

    /// The author or speaker of the event.
    public let who: String

    /// The text contents of the event that will be said or interpreted.
    public let what: String

    /// The question being asked, if provided.
    public let question: JensonQuestion?

    /// A list of refresh events to trigger with this event.
    /// - Note: This field is available to Jenson files with manifest v2 or later.
    public let refresh: [JensonRefreshContent]?

    public init(
        type: EventType,
        who: String,
        what: String,
        question: JensonQuestion? = nil,
        refresh: [JensonRefreshContent]? = nil
    ) {
        self.type = type
        self.who = who
        self.what = what
        self.question = question
        self.refresh = refresh
    }

    private enum CodingKeys: CodingKey {
        case type
        case who
        case what
        case question
        case refresh
    }
}

extension JensonEvent: RandomIdentifiedAccessable {
    public static func == (lhs: JensonEvent, rhs: JensonEvent) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(type)
        hasher.combine(what)
    }
}

/// A struct that represents a refresh trigger.
/// - Note: This struct is available to Jenson files with manifest v2 or later.
public struct JensonRefreshContent: Codable {
    /// An enumeration that represents the various refresh types.
    public enum Kind: String, Codable {
        /// Refreshes an image on the screen.
        case image

        /// Refreshes the sound effect layer.
        case soundEffect

        /// Refreshes the background music.
        case music

        /// Refreshes other content.
        case other
    }

    /// The UUID generated for this refresh trigger.
    public let id = UUID()

    /// The type of refresh trigger this event corresponds to.
    public let kind: Kind

    /// The name of the resource to refresh the content to.
    public let resourceName: String

    /// The priority level for this refresh trigger.
    /// This is typically used to denote various layers of content types such as images or music layering.
    public let priority: Int?

    public init(kind: Kind, resourceName: String, priority: Int? = nil) {
        self.kind = kind
        self.resourceName = resourceName
        self.priority = priority
    }

    private enum CodingKeys: CodingKey {
        case kind
        case resourceName
        case priority
    }
}

extension JensonRefreshContent: RandomIdentifiedAccessable {}
