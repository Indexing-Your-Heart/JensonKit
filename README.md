# JensonKit

**JensonKit** is a Swift package for reading and writing files in the
Jenson dialogue format. The Jenson format is used interally for the
dialogue in _Indexing Your Heart_.

## Getting started

### Quickstart: Add to an Xcode project

JensonKit can be added directly into Xcode. In Xcode 13 or later, go
to **File > Add Packages...**, then paste the URL to this repository.

> **Note**  
> For older versions of Xcode, this menu may be located in **File >**
> **&nbsp;Swift Packages > Add Package Dependency...**.

Afterwards, you can interact with JensonKit via `import JensonKit`.

### Building from source

**Required Tools**
- Xcode 13 or later
- Swift 5.6 or later

Clone the repository using `git clone` or `gh repo clone`, then open
the project in Xcode or run `swift build`.

## Example Usage

### Reading a Jenson file
```swift
do {
    let fileContents = try JensonReader(fileURLWithPath: "Test.jenson").decode()
    for event in fileContents.timeline {
        print(\(event.who): \(event.what))
    }
} catch {
    print("Couldn't read the file.")
}
```

### Writing a Jenson file
```swift
let exampleEvent = JensonEvent(type: .comment, who: "Tom", what: "Hello, world!", question: nil)
let fileContents = JensonFile(version: 1, timeline: [exampleEvent])
do {
    let writer = JensonWriter(contentsOf: fileContents)
    try writer.write(to: "Test.jenson")
} catch {
    print(error.localizedDescription)
```

## License
JensonKit is non-violent software licensed under the Cooperative
Non-violent Public License, v7 or later. You can read your rights in
the provided LICENSE.md file or at
https://git.pixie.town/thufie/npl-builder/src/branch/main/cnpl.md.
