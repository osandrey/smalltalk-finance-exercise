Class {
	#name : 'BookTest',
	#superclass : 'TestCase',
	#category : 'InterviewExercises-Tests',
	#package : 'InterviewExercises-Tests'
}

{ #category : 'tests' }
BookTest >> testBookPresentValueDelegatesToPortfolio [
    | book portfolio trade product market |

    book := Book named: 'European Book'.
    portfolio := Portfolio named: 'European Portfolio'.

    trade := Trade new.
    product := CashflowProduct new.
    product amount: 100.
    product paymentDate: (Date year: 2027 month: 1 day: 1).

    trade addProduct: product.
    portfolio addTrade: trade.

    book portfolio: portfolio.

    market := Market new.
    market date: (Date year: 2027 month: 1 day: 1).

    self assert: (book presentValueForMarket: market) equals: 100
]
