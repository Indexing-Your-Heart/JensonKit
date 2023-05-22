# ``JensonKit``

Read and write simple dialogue files.

## Overview

JensonKit is a Swift framework that allows developers to read and write dialogue files in the Jenson file format. The
Jenson file format is designed to be light and efficient in storing critical data for dialogue scripting, such as
dialogues, questions, and refresh events.

### Why Jenson?

The Jenson file format is used internally by [Indexing Your Heart](https://indexingyourhe.art) to store dialogue scripts
used in the story portions of the game. Before the conversion to Swift and SpriteKit, Indexing Your Heart used the
[Dialogic plugin](https://dialogic.coppolaemilio.com) for Godot. Dialogic stored its scene scripts as JSON files
containing several event nodes. This allows for the Marteau tool to convert Markdown files into Dialogic timelines
relatively easily by creating a parser and re-encoding the content into JSON format.

Once Indexing Your Heart migrated to Swift and SpriteKit, using Dialogic was no longer an option. However, rather than
scrapping the dialogue tool in Marteau that allowed for seamless conversions, the Jenson format was created as the
alternative, offering similar functionality.

## Topics

### Fundamentals

- <doc:The-Jenson-Manifest>
- <doc:Events>


### Reading/Writing Files

- <doc:File-Operations>
- ``JensonReader``
- ``JensonWriter``
