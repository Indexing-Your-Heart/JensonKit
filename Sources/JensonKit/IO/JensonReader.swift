//
//  JensonReader.swift
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

/// A class that reads Jenson files and decodes them into events.
public class JensonReader {
    private let data: Data

    /// Whether the reader should interpret the file as being compressed. Defaults to true.
    var compressed = true

    /// An enumeration representing various file reading errors.
    public enum ReaderError: Error {
        /// The data is malformed.
        case malformedData
        /// The file couldn't be decoded from Base64.
        case decryptionError
    }

    /// - Parameter data: The data containing the Jenson file's contents.
    public init(_ data: Data) {
        self.data = data
    }

    /// - Parameter path: The path to the file to read.
    public init(fileURLWithPath path: String) throws {
        let url = URL(fileURLWithPath: path)
        self.data = try Data(contentsOf: url)
    }

    /// Decode the file data into a Jenson file struct.
    public func decode() throws -> JensonFile {
        guard let stringContents = String(data: self.data, encoding: .utf8) else {
            throw ReaderError.malformedData
        }
        guard var decodedData = Data(base64Encoded: stringContents, options: .ignoreUnknownCharacters) else {
            throw ReaderError.decryptionError
        }
        if compressed {
            decodedData = try decodedData.decompressed(from: COMPRESSION_BROTLI)
        }
        let decoder = JSONDecoder()
        return try decoder.decode(JensonFile.self, from: decodedData)
    }
}
