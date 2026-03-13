"
Market represents market conditions used for valuation.

It defines the valuation date and a discount rate used
to compute the present value of financial products.
"
Class {
	#name : 'Market',
	#superclass : 'Frame',
	#instVars : [
		'date',
		'discountRate'
	],
	#category : 'InterviewExercises',
	#package : 'InterviewExercises'
}

{ #category : 'accessing' }
Market >> date [
    ^ date
]

{ #category : 'accessing' }
Market >> date: aDate [
	date := aDate 
]

{ #category : 'accessing' }
Market >> discountRate [
    ^ discountRate
]

{ #category : 'accessing' }
Market >> discountRate: aNumber [
    discountRate := aNumber
]

{ #category : 'initialization' }
Market >> initialize [
    super initialize.
    discountRate := 0.0371
]
