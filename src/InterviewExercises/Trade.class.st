"
Trade represents a collection of financial products.

The present value of a trade is calculated as the sum of the
present values of all contained products.
"
Class {
	#name : 'Trade',
	#superclass : 'Frame',
	#instVars : [
		'products'
	],
	#category : 'InterviewExercises',
	#package : 'InterviewExercises'
}

{ #category : 'adding' }
Trade >> addProduct: aProduct [
	"Add a financial product to the trade."
	
    products add: aProduct
]

{ #category : 'initialization' }
Trade >> initialize [
    super initialize.
    products := OrderedCollection new
]

{ #category : 'adding' }
Trade >> isEmpty [
    ^ products isEmpty
]

{ #category : 'calculating' }
Trade >> presentValueForMarket: aMarket [
	"Return the sum of present values of all products in this trade."
	
    ^ products
        sum: [ :each | each presentValueForMarket: aMarket ]
        ifEmpty: [ 0 ]
]

{ #category : 'accessing' }
Trade >> totalAmount [
    ^ products sum: [ :each | each amount ] ifEmpty: [ 0 ]
]
