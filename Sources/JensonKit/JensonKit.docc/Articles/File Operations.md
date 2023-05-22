# File Operations

Read and write Jenson files using JensonKit.

## Overview

Jenson files consist of a Base64 encoded string with a compressed data object. The compressed data represents a JSON
object that matches the Jenson manifest, and the data is compressed using the Brotli compression algorithm. This
compression occurs to save on disk space while maintaining reading performance.

### Reading a file

To read a file, create a ``JensonReader`` and call ``JensonReader/decode()``.

```swift
if let path = Bundle.main.path(forResource: "SampleScript",
                               ofType: "jenson") {
    let reader = JensonReader(fileURLWithPath: path)
    do {
        let data = try reader.decode()
        print(data.story?.author)
    } catch {
        print("Failed to read the file: \(error.localized.description)")
    }
}
```

### Writing a file

To write the contents of a ``JensonFile`` to disk, create a ``JensonWriter`` and call ``JensonWriter/write(to:)``.

```swift
if let path = getUserRequestedPath() {
    let writer = JensonWriter(contentsOf: jensonFile)
    do {
        try writer.write(to: path)
    } catch {
        print("Couldn't write to \(path): \(error.localizedDescription)")
    }
}
```

## Disabling compression

Some older Jenson file versions did not compress their data contents before being encoded when they were generated, and
it may be required to bypass compression altogether. Both ``JensonReader`` and ``JensonWriter`` offer a `compressed`
property that can be disabled to disable compression:

```swift
if let path = Bundle.main.path(forResource: "ReallyOldScript",
                               ofType: "jenson") {
    let reader = JensonReader(fileURLWithPath: path)
    reader.compressed = false
    do {
        let data = try reader.decode()
        print(data.story?.author)
    } catch {
        print("Failed to read the file: \(error.localized.description)")
    }
}
```
