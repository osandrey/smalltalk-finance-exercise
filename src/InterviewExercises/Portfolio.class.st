"
Portfolio groups trades and other portfolios into a hierarchical structure.

Portfolios may contain trades directly as well as child portfolios.
The present value of a portfolio is calculated recursively by aggregating
the values of all trades contained in the hierarchy.
"
Class {
	#name : 'Portfolio',
	#superclass : 'Frame',
	#instVars : [
		'trades',
		'portfolios'
	],
	#category : 'InterviewExercises',
	#package : 'InterviewExercises'
}

{ #category : 'adding' }
Portfolio >> addPortfolio: aPortfolio [
	"Add a child portfolio."
	
    portfolios add: aPortfolio
]

{ #category : 'adding' }
Portfolio >> addTrade: aTrade [
	"Add a trade to the portfolio."
	
    trades add: aTrade
]

{ #category : 'enumerating' }
Portfolio >> allChildPortfolios [
    | result |
    result := OrderedCollection new.
    self allChildPortfoliosDo: [ :each | result add: each ].
    ^ result
]

{ #category : 'enumerating' }
Portfolio >> allChildPortfoliosDo: aBlock [
	"Iterate recursively over all child portfolios."
	
    portfolios do: [ :each |
        aBlock value: each.
        each allChildPortfoliosDo: aBlock ]
]

{ #category : 'enumerating' }
Portfolio >> allPortfolios [
    | result |
    result := OrderedCollection new.
    self allPortfoliosDo: [ :each | result add: each ].
    ^ result
]

{ #category : 'enumerating' }
Portfolio >> allPortfoliosDo: aBlock [
	"Iterate over this portfolio and all nested portfolios."
	
    aBlock value: self.
    self allChildPortfoliosDo: aBlock
]

{ #category : 'enumerating' }
Portfolio >> allTrades [
    | tradesCollection |
    tradesCollection := OrderedCollection new.
    self allTradesDo: [ :each | tradesCollection add: each ].
    ^ tradesCollection
]

{ #category : 'enumerating' }
Portfolio >> allTradesDo: aBlock [
	"Iterate over all trades in this portfolio and its child portfolios."
	
    trades do: aBlock.
    portfolios do: [ :each | each allTradesDo: aBlock ]
]

{ #category : 'initialization' }
Portfolio >> initialize [
    super initialize.
    trades := OrderedCollection new.
    portfolios := OrderedCollection new
]

{ #category : 'testing' }
Portfolio >> isEmpty [
    ^ trades isEmpty and: [ portfolios isEmpty ]
]

{ #category : 'calculating' }
Portfolio >> presentValueForMarket: aMarket [
	"Compute the aggregated present value of all trades in the portfolio hierarchy."
	
    ^ self allTrades
        sum: [ :each | each presentValueForMarket: aMarket ]
        ifEmpty: [ 0 ]
]
