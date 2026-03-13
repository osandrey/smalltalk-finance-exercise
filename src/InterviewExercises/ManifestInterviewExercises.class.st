"
The system is built around a simple hierarchy where most domain objects inherit from Frame, allowing them to be registered in a Namespace.
Financial valuation flows from Book to Portfolio, then recursively through Trade objects down to individual Product implementations such as CashflowProduct.
"
Class {
	#name : 'ManifestInterviewExercises',
	#superclass : 'PackageManifest',
	#category : 'InterviewExercises-Manifest',
	#package : 'InterviewExercises',
	#tag : 'Manifest'
}
