# The Jenson Manifest

Discover the fundamental pieces that make up a Jenson file.

A Jenson file is represented as an object containing several fields:

- The ``JensonKit/JensonFile/version`` determines the version of the manifest. As the Jenson format improves over time,
  certain versions may include new events.
- The ``JensonKit/JensonFile/application`` contains information about the application that wrote the file. This field is
  available for Jenson files with v2 or later, and it is not required.
- The ``JensonKit/JensonFile/story`` contains metadata about the story this file is associated with, such as the title
  of the story, its author, and copyrights. This field is available for Jenson files with manifest v2 or later.
- The ``JensonKit/JensonFile/timeline`` is a list of Jenson events that the scene contains.

```swift
struct JensonFile {
  let version: Int
  let application: JensonApp?
  let story: JensonStory?
  let timeline: [JensonEvent]
}
```

For exmaple, the following JSON structure shows what a Jenson file looks like:
```json
{
  "version": 2,
  "story": { ... },
  "application": { ... },
  "timeline": [ ... ]
}
```

## Story Metadata

Introduced in v2, the ``JensonKit/JensonFile/story`` field allows authors to represent metadata about the story the file
represents. Files matching Jenson v2 or later must contain this metadata.

The story metadata object contains four fields:

- The ``JensonKit/JensonStory/name`` contains the story’s title.
- The ``JensonKit/JensonStory/author`` contains the name of the author.
- The ``JensonKit/JensonStory/chapter`` contains the chapter title, if applicable.
- The ``JensonKit/JensonStory/copyright`` contains a human-readable copyright string, if applicable.

```swift
struct JensonStory {
    let name: String
    let author: String
    let chapter: String?
    let copyright: String?
}
```

For example, the following JSON structure shows what a story would look like:

```json
{
    "name": "Othello",
    "chapter": "Act V, Scene II"
    "author": "William Shakespeare",
    "copyright": "(C) 1603 William Shakespeare. All rights reserved."
}
```

### For applications writing Jenson files

Introduced in v2, the ``JensonKit/JensonFile/application`` field in the Jenson manifest should be used when a
third-party application is responsible for writing Jenson files on a user’s behalf.

The application object contains two fields: the ``JensonKit/JensonApp/name`` field for the name of the application and
an optional ``JensonKit/JensonApp/website`` field for the application’s website, if applicable.

For example, the following JSON structure is used by the Gutenberg app to register itself as the editor for files:

```json
{
    "name": "Gutenberg",
    "website": "https://github.com/Indexing-Your-Heart/gutenberg"
}
```

> Tip: If your application writes Jenson files, it is highly recommended that you add your app's attributes to the
> Jenson file for discovery and troubleshooting reasons.

## Topics

### File Structure
- ``JensonFile``

### Metadata Structures
- ``JensonStory``
- ``JensonApp``
