//
//  JensonWriter.swift
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

/// A class that writes Jenson files.
public class JensonWriter {
    private let contents: JensonFile

    /// Create a file writer.
    /// - Parameter jensonFile: The Jenson file struct to write to disk.
    public init(contentsOf jensonFile: JensonFile) {
        self.contents = jensonFile
    }

    /// Writes the Jenson file to the specified path.
    /// - Parameter path: The path to the file to write to.
    public func write(to path: String) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let encodedData = try encoder.encode(contents).base64EncodedString(options: .lineLength64Characters)
        let filePathURL = URL(fileURLWithPath: path)
        try encodedData.write(to: filePathURL, atomically: true, encoding: .utf8)
    }
}
