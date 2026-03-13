Class {
	#name : 'NamespaceTest',
	#superclass : 'TestCase',
	#category : 'InterviewExercises-Tests',
	#package : 'InterviewExercises-Tests'
}

{ #category : 'tests' }
NamespaceTest >> testAddAllFramesAddsMultipleFrames [
    | ns f1 f2 |
    
    ns := Namespace new.
    
    f1 := Frame named: 'Bank'.
    f2 := Frame named: 'Government'.
    
    ns addAllFrames: { f1. f2 }.
    
    self deny: ns isEmpty.
    self assert: (ns frameNamed: 'Bank') equals: f1.
    self assert: (ns frameNamed: 'Government') equals: f2
]

{ #category : 'tests' }
NamespaceTest >> testAddNamedFrameMakesNamespaceNonEmpty [
    | ns frame |
    ns := Namespace new.
    frame := Frame new.
    frame name: 'Bank'.

    ns addFrame: frame.

    self deny: ns isEmpty
]

{ #category : 'tests' }
NamespaceTest >> testFrameNamedReturnsMatchingFrame [
    | ns frame |
    ns := Namespace new.
    frame := Frame new.
    frame name: 'Bank'.

    ns addFrame: frame.

    self assert: (ns frameNamed: 'Bank') equals: frame
]

{ #category : 'tests' }
NamespaceTest >> testFrameNamedReturnsNilWhenMissing [
    | ns |
    ns := Namespace new.

    self assert: (ns frameNamed: 'Missing') isNil
]

{ #category : 'tests' }
NamespaceTest >> testNewNamespaceIsEmpty [
    | ns |
    ns := Namespace new.
    self assert: ns isEmpty
]
