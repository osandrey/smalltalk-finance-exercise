"
Namespace is a container for all domain frames in the system.

It acts as a registry allowing lookup of parties, books,
portfolios and markets by name.
"
Class {
	#name : 'Namespace',
	#superclass : 'Object',
	#instVars : [
		'frames'
	],
	#category : 'InterviewExercises',
	#package : 'InterviewExercises'
}

{ #category : 'examples' }
Namespace class >> example [
    | ns bank government techFirm
      europeanBook asianBook americanBook
      europeanPortfolio ukPortfolio francePortfolio germanyPortfolio
      trade product
      market2026 market2027 |

    ns := self new.

    bank := Party named: 'The Bank'.
    government := Party named: 'Government'.
    techFirm := Party named: 'Tech firm'.

    europeanBook := Book named: 'European Book'.
    asianBook := Book named: 'Asian Book'.
    americanBook := Book named: 'American Book'.

    europeanBook owner: bank.
    asianBook owner: bank.
    americanBook owner: bank.

    europeanPortfolio := Portfolio named: 'European Portfolio'.
    ukPortfolio := Portfolio named: 'UK Portfolio'.
    francePortfolio := Portfolio named: 'France Portfolio'.
    germanyPortfolio := Portfolio named: 'Germany Portfolio'.

    europeanPortfolio addPortfolio: ukPortfolio.
    europeanPortfolio addPortfolio: francePortfolio.
    europeanPortfolio addPortfolio: germanyPortfolio.

    europeanBook portfolio: europeanPortfolio.

    trade := Trade new.

   product := CashflowProduct new
    amount: 1063;
    paymentDate: (Date year: 2027 month: 1 day: 1);
    yourself.

    trade addProduct: product.
    ukPortfolio addTrade: trade.

    market2026 := Market named: 'Market-2026'.
    market2026 date: (Date year: 2026 month: 1 day: 1).

    market2027 := Market named: 'Market-2027'.
    market2027 date: (Date year: 2027 month: 1 day: 1).

    ns addAllFrames: {
        bank.
        government.
        techFirm.
        europeanBook.
        asianBook.
        americanBook.
        europeanPortfolio.
        ukPortfolio.
        francePortfolio.
        germanyPortfolio.
        market2026.
        market2027 }.

    ^ ns
]

{ #category : 'examples' }
Namespace class >> exampleValuation [
    | ns book portfolio trade product market |

    ns := self new.

    book := Book named: 'Test Book'.
    portfolio := Portfolio named: 'Test Portfolio'.

    trade := Trade new.

    product := CashflowProduct new.
    product amount: 100.
    product paymentDate: (Date year: 2027 month: 1 day: 1).

    trade addProduct: product.
    portfolio addTrade: trade.

    book portfolio: portfolio.

    market := Market new.
    market date: (Date year: 2027 month: 1 day: 1).

    ns addAllFrames: { book. portfolio }.

    ^ ns
]

{ #category : 'adding' }
Namespace >> addAllFrames: aCollection [
    aCollection do: [ :each | self addFrame: each ]
]

{ #category : 'adding' }
Namespace >> addFrame: aFrame [
	"Add a frame to the namespace."
	
    aFrame isAnonymous ifTrue: [ ^ self ].
    frames add: aFrame.
]

{ #category : 'finding' }
Namespace >> books [
    "Return all books registered in the namespace."

    ^ frames select: [ :each | each isKindOf: Book ]
]

{ #category : 'finding' }
Namespace >> frameNamed: aName [
	"Return the frame with the given name or nil if none exists."
	
    ^ frames detect: [ :f | f name = aName ] ifNone: [ nil ].
]

{ #category : 'accessing' }
Namespace >> frames [
    "Return all frames registered in the namespace."

    ^ frames
]

{ #category : 'initialization' }
Namespace >> initialize [
    super initialize.
    frames := OrderedCollection new.
]

{ #category : 'testing' }
Namespace >> isEmpty [
    ^ frames isEmpty
]
