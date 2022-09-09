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
import Compression

/// A class that writes Jenson files.
public class JensonWriter {
    private let contents: JensonFile

    /// Whether the writer should compress the data before writing to disk. Defaults to true.
    public var compressed = true

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
        var encodedData = try encoder.encode(contents)
        if compressed {
            encodedData = try encodedData.compressed(using: COMPRESSION_BROTLI)
        }
        let encodedString = encodedData.base64EncodedString(options: .lineLength64Characters)
        let filePathURL = URL(fileURLWithPath: path)
        try encodedString.write(to: filePathURL, atomically: true, encoding: .utf8)
    }

    /// Encodes the current file into a data object.
    public func data() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        var encodedData = try encoder.encode(contents)
        if compressed {
            encodedData = try encodedData.compressed(using: COMPRESSION_BROTLI)
        }
        return encodedData
    }
}
