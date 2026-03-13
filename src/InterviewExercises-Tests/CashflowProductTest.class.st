Class {
	#name : 'CashflowProductTest',
	#superclass : 'TestCase',
	#category : 'InterviewExercises-Tests',
	#package : 'InterviewExercises-Tests'
}

{ #category : 'tests' }
CashflowProductTest >> testPresentValueBeforePaymentDateIsDiscounted [
    | product market pv |
    
    product := CashflowProduct new.
    product amount: 100.
    product paymentDate: (Date year: 2027 month: 1 day: 1).

    market := Market new.
    market date: (Date year: 2026 month: 1 day: 1).

    pv := product presentValueForMarket: market.

    self assert: pv < 100
]

{ #category : 'tests' }
CashflowProductTest >> testPresentValueEqualsAmountOnPaymentDate [
    | product market |
    
    product := CashflowProduct new.
    product amount: 100.
    product paymentDate: (Date year: 2027 month: 1 day: 1).

    market := Market new.
    market date: (Date year: 2027 month: 1 day: 1).

    self assert: (product presentValueForMarket: market) equals: 100
]

{ #category : 'tests' }
CashflowProductTest >> testPresentValueIsZeroAfterPaymentDate [
    | product market |
    
    product := CashflowProduct new.
    product amount: 100.
    product paymentDate: (Date year: 2027 month: 1 day: 1).

    market := Market new.
    market date: (Date year: 2027 month: 1 day: 2).

    self assert: (product presentValueForMarket: market) equals: 0
]
