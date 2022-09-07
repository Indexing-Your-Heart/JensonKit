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

public class JensonReader {
    private let data: Data

    public enum ReaderError: Error {
        case malformedData
        case decryptionError
    }

    public init(_ data: Data) {
        self.data = data
    }

    public init(fileURLWithPath path: String) throws {
        let url = URL(fileURLWithPath: path)
        self.data = try Data(contentsOf: url)
    }

    public func decode() throws -> JensonFile {
        guard let stringContents = String(data: self.data, encoding: .utf8) else {
            throw ReaderError.malformedData
        }

        print(stringContents)

        guard let decodedData = Data(base64Encoded: stringContents, options: .ignoreUnknownCharacters) else {
            throw ReaderError.decryptionError
        }

        let decoder = JSONDecoder()
        return try decoder.decode(JensonFile.self, from: decodedData)
    }
}
