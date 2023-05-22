# ``JensonKit/JensonWriter``

## Overview

The Jenson writer class is the primary mode of interaction for writing a ``JensonFile`` structure to a Jenson file. The
writer automatically handles encoding the structure and compressing the data.

```swift
func writeJensonFile(_ file: JensonFile, to path: String) {
    let writer = JensonWriter(contentsOf: file)
    do {
        try writer.write(to: path)
    } catch {
        print("Couldn't write file: \(error.localizedDescription)")
    }
}
```

## Capturing Written Data

There may be a case where only the data being written is required. To get the data without writing it to a file, call
``JensonWriter/data()``:

```swift
func writeData(of file: JensonFile, completion: @escaping (Data) -> Void) {
let writer = JensonWriter(contentsOf: file)
    do {
        let data = try writer.data()
        completion(data)
    } catch {
        print("Couldn't write file: \(error.localizedDescription)")
    }
}
```

## Data Compression

Starting with newer versions of the Jenson file format, the contents of a Jenson file is compressed automatically using
the Brotli compression algorithm. By default, ``JensonWriter`` will automatically compress the file loaded into it.

There may be instances where writing uncompressed data is preferred, such as for older versions of the format. Set
``compressed`` to false to disable compression:

```swift
func writeOldData(of file: JensonFile, completion: @escaping (Data) -> Void) {
    let writer = JensonWriter(contentsOf: file)
    writer.compressed = false
    do {
        let data = try writer.data()
        completion(data)
    } catch {
        print("Couldn't write file: \(error.localizedDescription)")
    }
}
```
