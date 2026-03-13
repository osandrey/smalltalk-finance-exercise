"
Book represents a financial book owned by a Party.

A book contains a root Portfolio which aggregates trades
and nested portfolios used for valuation.
"
Class {
	#name : 'Book',
	#superclass : 'Frame',
	#instVars : [
		'owner',
		'portfolio'
	],
	#category : 'InterviewExercises',
	#package : 'InterviewExercises'
}

{ #category : 'accessing' }
Book >> owner [
    ^ owner
]

{ #category : 'accessing' }
Book >> owner: aParty [
    owner := aParty
]

{ #category : 'accessing' }
Book >> portfolio [
    ^ portfolio
]

{ #category : 'accessing' }
Book >> portfolio: aPortfolio [
    portfolio := aPortfolio
]

{ #category : 'calculating' }
Book >> presentValueForMarket: aMarket [
    "Return the present value of the book by delegating valuation to its portfolio."
    
    ^ portfolio presentValueForMarket: aMarket
]
