Class {
	#name : 'FrameTest',
	#superclass : 'TestCase',
	#category : 'InterviewExercises-Tests',
	#package : 'InterviewExercises-Tests'
}

{ #category : 'tests' }
FrameTest >> testFrameIsAnonymousWhenNoName [
    | frame |
    frame := Frame new.

    self assert: frame isAnonymous
]

{ #category : 'tests' }
FrameTest >> testFrameIsNotAnonymousWhenNamed [
    | frame |
    frame := Frame new.
    frame name: 'Bank'.

    self deny: frame isAnonymous
]

{ #category : 'tests' }
FrameTest >> testFrameNameAccessor [
    | frame |
    frame := Frame new.
    frame name: 'Bank'.

    self assert: frame name equals: 'Bank'
]

{ #category : 'tests' }
FrameTest >> testFrameNamedConstructor [
    | frame |
    frame := Frame named: 'Bank'.

    self assert: frame name equals: 'Bank'
]
