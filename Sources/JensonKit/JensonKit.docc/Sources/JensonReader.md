# ``JensonKit/JensonReader``

## Overview

The Jenson reader class is the primary mode of interaction for reading Jenson files. The reader loads the data,
decompresses it, and decodes the uncompressed data into a ``JensonFile`` structure that can be used elsewhere.

```swift
func getJensonFile(with resource: String) -> Result<JensonFile, JensonReader.ReaderError> {
    guard let path = Bundle.main.path(forResource: resource,
                                      ofType: "jenson") else { return nil }
    let reader = JensonReader(fileURLWithPath: path)
    do {
        let result = try reader.decode()
        return .success(result)
    } catch {
        return .failure(error)
    }
}
```

## Data Compression

Starting with newer versions of the Jenson file format, the contents of a Jenson file is compressed automatically using
the Brotli compression algorithm. By default, ``JensonReader`` will automatically decompress the file loaded into it.

There may be some cases where disabling compression is needed, such as if the reader will be opening uncompressed files
for debugging or opening older versions of the format. To disable compression, set ``compressed`` to false:

```swift
func getOldJensonFile(with resource: String) -> JensonFile? {
    guard let path = Bundle.main.path(forResource: resource,
    ofType: "jenson") else { return nil }
    let reader = JensonReader(fileURLWithPath: path)
    reader.compressed = false
    return try? reader.decode()
}
```
