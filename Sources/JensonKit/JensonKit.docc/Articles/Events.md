# Events

Learn the fundamental building blocks of a timeline.

## Overview

Similar to Dialogic, a *timeline* in Jenson consists of multiple *events*. Each event can either display dialogue,
present a question with choices, or perform other actions.

An event is represented as an object with several fields:

- The ``JensonEvent/type`` defines the type of event, which determines how the content should be displayed.
- The ``JensonEvent/who`` is a field that determines who is speaking. This field is typically left blank in non-dialogue
  events.
- The ``JensonEvent/what`` contains the text content that will be spoken or displayed on screen.
- The ``JensonEvent/question`` is an optional field that contains a question with a list of choices that will be
  displayed (see <doc:Asking-Questions>).
- The ``JensonEvent/refresh`` is an optional trigger that indicates the user interface or display should be refreshed.

```swift
struct JensonEvent {
  let type: JensonEventType
  let who: String
  let what: String
  let question: JensonQuestion?
  let refresh: JensonRefreshContent?
}
```

## Types of events

There are three primary event types in Jenson: comments, dialogue, and questions.

### Comments

**Introduced**: Jenson v1  

Comment events are no-op events that provide commentary or documentation. They are never displayed on screen. The
comment appears in the ``JensonEvent/what`` field of an event.

```json
{
  "type": "comment",
  "who": "",
  "what": "This is a comment."
}
```

### Dialogue

**Introduced**: Jenson v1  

Dialogue events represent any dialogue that will be spoken; they often include conversations, monologues, and narration.
Dialogue events are presented to the screen. The character speaking is stored in the ``JensonEvent/who`` field, and the
spoken content is presented in the ``JensonEvent/what`` field.

```json
{
  "type" : "dialogue",
  "who" : "Desdemon",
  "what" : "That death's unnatural that kills for loving."
}
```

> Tip: To add a narration block, set ``JensonEvent/who`` to an empty string. This will result in the speaker's name
> being omitted from the view.

### Questions

**Introduced**: Jenson v1  

Question events contain a question with a list of choices the player has to make. Choices may contain additional
dialogue. The ``JensonEvent/who`` and ``JensonEvent/what`` fields are typically left blank, and the question’s content
is stored in the ``JensonEvent/question`` property.

```json
{
  "type" : "question",
  "who" : "",
  "what" : "",
  "question": { ... }
}
```

### Refresh Triggers

**Introduced**: Jenson v2  

Refresh events contain a list of triggers to tell the reader of the file to refresh the contents of the display or user
interface. Events may include music, sound effects, images, or a general “other” category.

```json
{
  "type" : "refresh",
  "who" : "",
  "what" : "",
  "refresh": [ ... ]
}
```

## Topics

### Related Structures

- ``JensonEvent``

### Questions

- <doc:Asking-Questions>
- ``JensonQuestion``

### Refreshing Events

- <doc:Refreshing-Events>
- ``JensonRefreshContent``
