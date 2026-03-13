"
CashflowProduct represents a single future cash payment.

The present value is calculated by discounting the payment amount
using the market discount rate and time to payment.
"
Class {
	#name : 'CashflowProduct',
	#superclass : 'Product',
	#instVars : [
		'paymentDate',
		'amount'
	],
	#category : 'InterviewExercises',
	#package : 'InterviewExercises'
}

{ #category : 'accessing' }
CashflowProduct >> amount [
    ^ amount
]

{ #category : 'accessing' }
CashflowProduct >> amount: aNumber [
    amount := aNumber
]

{ #category : 'accessing' }
CashflowProduct >> paymentDate [
    ^ paymentDate
]

{ #category : 'accessing' }
CashflowProduct >> paymentDate: aDate [
    paymentDate := aDate
]

{ #category : 'accessing' }
CashflowProduct >> presentValueForMarket: aMarket [
	"Compute discounted present value of the cashflow for the given market."
	
    | numberOfDays timeInYears |
    
    aMarket date > paymentDate ifTrue: [ ^ 0 ].
    aMarket date = paymentDate ifTrue: [ ^ amount ].
    
    numberOfDays := paymentDate subtractDate: aMarket date.
    timeInYears := numberOfDays asFloat / 365.0.
    
    ^ amount / ((1 + aMarket discountRate) raisedTo: timeInYears)
]
