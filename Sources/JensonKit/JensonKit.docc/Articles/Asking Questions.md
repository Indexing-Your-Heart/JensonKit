# Asking Questions

Present a question with a menu of options to pick from.

## Questions

Questions in Jenson are represented with a question object, which contains two primary fields:

- The ``JensonKit/JensonQuestion/question`` field contains the question being asked.
- The ``JensonKit/JensonQuestion/options`` field contains a list of choices the player can make.

```swift
struct JensonQuestion {
    let question: String
    let options: [JensonChoice]
}
```
For example, the following JSON structure represents a question:

```json
{
    "question": "Alas, why gnaw you so your nether lip?",
    "options": [
        {
            "name": "Peace, and be still!",
            "events": [ ... ]
        }
    ]
}
```

## Choices

Choices are represented as object with two fields:

- The ``JensonChoice/name`` represents the text content displayed on screen when the player makes a choice.
- The ``JensonChoice/events`` fields contains a list of events that play when this choice is selected.

```swift
struct JensonChoice {
    let name: String
    let events: [JensonEvent]
}
```
For example, the following JSON structure represents a choice that can be found in a question:

```json
// Example Jenson choice
{
    "name": "Peace, and be still!",
    "events": [ ... ]
}
```

## Topics

### Related Structures

- ``JensonQuestion``
- ``JensonChoice``
