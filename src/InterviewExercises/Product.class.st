"
Product is an abstract financial instrument contained within a trade.

Subclasses implement the valuation logic through
presentValueForMarket:.
"
Class {
	#name : 'Product',
	#superclass : 'Frame',
	#category : 'InterviewExercises',
	#package : 'InterviewExercises'
}

{ #category : 'calculating' }
Product >> presentValueForMarket: aMarket [
	"Abstract valuation method implemented by subclasses."
	
    self subclassResponsibility
]
