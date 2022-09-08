//
//  JensonKitTests.swift
//  Created by Marquis Kurt on 9/7/22.
//  This file is part of Indexing Your Heart.
//
//  Indexing Your Heart is non-violent software: you can use, redistribute, and/or modify it under the terms of the
//  CNPLv7+ as found in the LICENSE file in the source code root directory or at
//  <https://git.pixie.town/thufie/npl-builder>.
//
//  Indexing Your Heart comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law. See the CNPL for
//  details.

import XCTest
@testable import JensonKit

final class JensonKitTests: XCTestCase {
    func testReaderReadsFileContents() throws {
        guard let path = Bundle.module.path(forResource: "JensonTestFile", ofType: "jenson") else {
            XCTFail("Missing resource file \"JensonTestFile.jenson\"")
            return
        }
        let _ = try JensonReader(fileURLWithPath: path)
    }

    func testReaderFailsDecryption() throws {
        guard let path = Bundle.module.path(forResource: "JensonTestFile", ofType: "json") else {
            XCTFail("Missing resource file \"JensonTestFile.json\"")
            return
        }
        
        let reader = try JensonReader(fileURLWithPath: path)
        XCTAssertThrowsError(try reader.decode())
    }

    func testReaderDecodesSuccessfully() throws {
        guard let path = Bundle.module.path(forResource: "JensonTestFile", ofType: "jenson") else {
            XCTFail("Missing resource file \"JensonTestFile.jenson\"")
            return
        }
        let reader = try JensonReader(fileURLWithPath: path)
        let contents = try reader.decode()

        XCTAssertEqual(contents.version, 1)
        XCTAssertEqual(contents.timeline.count, 17)

        XCTAssertEqual(contents.timeline.first?.type, JensonEvent.EventType.comment)
        XCTAssertEqual(
            contents.timeline.first?.what,
            "This is the start of the Jenson file, which contains various elements."
        )
        XCTAssertNotNil(contents.timeline.first { $0.type == .question })
        XCTAssertEqual(contents.timeline.filter { $0.who == "Witness"}.count, 7)
    }

    func testWriterEncodesSuccessfully() throws {
        guard let expectedPath = Bundle.module.path(forResource: "JensonTestFile", ofType: "jenson") else {
            XCTFail("Missing resource file \"JensonTestFile.jenson\"")
            return
        }
        let reader = try JensonReader(fileURLWithPath: expectedPath)
        let contents = try reader.decode()

        let writer = JensonWriter(contentsOf: contents)
        try writer.write(to: "Test.jenson")

        let testDataPath = URL(fileURLWithPath: "Test.jenson")
        let expectedDataPath = URL(fileURLWithPath: expectedPath)
        let readData = try Data(contentsOf: testDataPath)
        let expectedData = try Data(contentsOf: expectedDataPath)
        XCTAssertEqual(readData, expectedData)
    }

    func testMeasureReadPerformance() throws {
        guard let path = Bundle.module.path(forResource: "JensonTestFileUncompressed", ofType: "jenson") else {
            XCTFail("Missing resource file \"JensonTestFile.jenson\"")
            return
        }
        measure {
            do {
                let reader = try JensonReader(fileURLWithPath: path)
                reader.compressed = false
                _ = try reader.decode()
            } catch {
                XCTFail("Decode failed: \(error.localizedDescription)")
            }
        }
    }

    func testMeasureWritePerformance() throws {
        guard let path = Bundle.module.path(forResource: "JensonTestFile", ofType: "jenson") else {
            XCTFail("Missing resource file \"JensonTestFile.jenson\"")
            return
        }
        measure {
            do {
                let reader = try JensonReader(fileURLWithPath: path)
                let contents = try reader.decode()
                let writer = JensonWriter(contentsOf: contents)
                writer.compressed = false
                try writer.write(to: "Test.jenson")

            } catch {
                XCTFail("Write failed failed: \(error.localizedDescription)")
            }

        }
    }

    func testMeasureReadPerformanceWithCompression() throws {
        guard let path = Bundle.module.path(forResource: "JensonTestFile", ofType: "jenson") else {
            XCTFail("Missing resource file \"JensonTestFile.jenson\"")
            return
        }
        measure {
            do {
                let reader = try JensonReader(fileURLWithPath: path)
                _ = try reader.decode()
            } catch {
                XCTFail("Decode failed: \(error.localizedDescription)")
            }
        }
    }

    func testMeasureWritePerformanceWithCompression() throws {
        guard let path = Bundle.module.path(forResource: "JensonTestFile", ofType: "jenson") else {
            XCTFail("Missing resource file \"JensonTestFile.jenson\"")
            return
        }
        measure {
            do {
                let reader = try JensonReader(fileURLWithPath: path)
                let contents = try reader.decode()
                let writer = JensonWriter(contentsOf: contents)
                try writer.write(to: "Test.jenson")

            } catch {
                XCTFail("Write failed failed: \(error.localizedDescription)")
            }

        }
    }
}
