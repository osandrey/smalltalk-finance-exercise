Class {
	#name : 'TradeTest',
	#superclass : 'TestCase',
	#category : 'InterviewExercises-Tests',
	#package : 'InterviewExercises-Tests'
}

{ #category : 'tests' }
TradeTest >> testEmptyTradeHasZeroPresentValue [
    | trade market |
    
    trade := Trade new.
    market := Market new.
    market date: (Date year: 2027 month: 1 day: 1).

    self assert: (trade presentValueForMarket: market) equals: 0
]

{ #category : 'tests' }
TradeTest >> testTradePresentValueIsSumOfProducts [
    | trade market p1 p2 |
    
    trade := Trade new.
    market := Market new.
    market date: (Date year: 2027 month: 1 day: 1).

    p1 := CashflowProduct new.
    p1 amount: 100.
    p1 paymentDate: (Date year: 2027 month: 1 day: 1).

    p2 := CashflowProduct new.
    p2 amount: 50.
    p2 paymentDate: (Date year: 2027 month: 1 day: 1).

    trade addProduct: p1.
    trade addProduct: p2.

    self assert: (trade presentValueForMarket: market) equals: 150
]
