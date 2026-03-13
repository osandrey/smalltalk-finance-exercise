"
Frame is the abstract base class for all named domain objects in the system.

Examples of frames include Party, Book, Portfolio and Market.

Frames are stored inside a Namespace and can be looked up by name.
"
Class {
	#name : 'Frame',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'InterviewExercises',
	#package : 'InterviewExercises'
}

{ #category : 'instance creation' }
Frame class >> named: aString [
    ^ self new
        name: aString;
        yourself
]

{ #category : 'testing' }
Frame >> isAnonymous [
    ^ name isNil
]

{ #category : 'accessing' }
Frame >> name [
    ^ name
]

{ #category : 'accessing' }
Frame >> name: aString [
    name := aString
]
