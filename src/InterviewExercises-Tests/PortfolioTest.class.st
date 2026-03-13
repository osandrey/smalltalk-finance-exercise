Class {
	#name : 'PortfolioTest',
	#superclass : 'TestCase',
	#category : 'InterviewExercises-Tests',
	#package : 'InterviewExercises-Tests'
}

{ #category : 'tests' }
PortfolioTest >> testAllChildPortfolios [
    | parent child1 child2 grandChild result |
    parent := Portfolio named: 'Europe'.
    child1 := Portfolio named: 'UK'.
    child2 := Portfolio named: 'France'.
    grandChild := Portfolio named: 'London'.

    parent addPortfolio: child1.
    parent addPortfolio: child2.
    child1 addPortfolio: grandChild.

    result := parent allChildPortfolios collect: [ :each | each name ].

    self assert: result size equals: 3.
    self assert: (result includes: 'UK').
    self assert: (result includes: 'France').
    self assert: (result includes: 'London')
]

{ #category : 'tests' }
PortfolioTest >> testAllPortfolios [
    | parent child1 child2 result |
    
    parent := Portfolio named: 'Europe'.
    child1 := Portfolio named: 'UK'.
    child2 := Portfolio named: 'France'.

    parent addPortfolio: child1.
    parent addPortfolio: child2.

    result := parent allPortfolios collect: [ :each | each name ].

    self assert: result size equals: 3.
    self assert: (result includes: 'Europe').
    self assert: (result includes: 'UK').
    self assert: (result includes: 'France').
]
