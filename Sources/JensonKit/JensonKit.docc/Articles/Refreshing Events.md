# Refreshing Events

Refresh the contents of the screen or audio mixer.

## Overview

Refresh events are used to update the scene in some way, both audio and visual. They consist of three main fields:

- The ``JensonRefreshContent/kind-swift.property`` determines what type of data is being refreshed. This can be any of
  the following: `image`, `soundEffect`, `music`, or `other`.
- The ``JensonRefreshContent/resourceName`` indicates what the type of data will be refreshed to.
- The ``JensonRefreshContent/priority`` is an optional field that contains a number representing the “layer” this data
  will be refreshed at.

```swift
struct JensonRefreshContent {
    let kind: Kind
    let resourceName: String
    let priority: Int?
}
```

For example, the following JSON structure shows a refresh event that will set the image layer at `-1` to be
`BedBackground_Blurred`:

```json
{
    "kind": "image",
    "resourceName": "BedBackground_Blurred",
    "priority": -1
}
```

> Important: ``JensonRefreshContent/resourceName`` is not a file path. Rather, it is the name of the resource to load.
> Implementations on how this name is to be used can be varied.

## Topics

### Related Structures

- ``JensonRefreshContent``
