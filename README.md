Smalltalk Finance Exercise

A simple financial object model implemented in Pharo Smalltalk as part of a technical interview exercise.

The system models financial entities such as Books, Portfolios, Trades and Products and calculates their present value (PV) for a given Market.
<br>

Architecture

The domain model is built around a base class Frame, allowing most objects to be registered in a Namespace.

<br>
Valuation flows through the object graph:

Book → Portfolio → Trade → Product

<br>
Where:

Product performs the valuation
Trade aggregates product values
Portfolio aggregates trades recursively
Book delegates valuation to its portfolio


Domain Structure
```
                Namespace
                    │
     ┌──────────────┼──────────────┐
     │              │              │
   Party           Book           Market
                    │
                    ▼
               Portfolio
                    │
        ┌───────────┴───────────┐
        │                       │
     Trade                 Portfolio
        │                       │
     Product                Trade
        │
        ▼
  CashflowProduct
```
```	
Class Hierarchy
Object
├─ Frame
│  ├─ Party
│  ├─ Book
│  ├─ Portfolio
│  ├─ Trade
│  ├─ Market
│  └─ Product
│       └─ CashflowProduct
└─ Namespace
```

Example

Create an example namespace:

ns := Namespace example.

Retrieve a book:

book := ns frameNamed: 'European Book'.

Create a market and calculate valuation:

market := Market named: 'Market2027'.
market date: (Date year: 2027 month: 1 day: 1).

book presentValueForMarket: market.


<br>
Tests

SUnit tests implemented for the main domain classes:

FrameTest
NamespaceTest
PortfolioTest
TradeTest
CashflowProductTest
BookTest

<br>

Environment

Pharo Smalltalk
Code exported using the Pharo Git integration.
