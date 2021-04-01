
Object subclass: #Grammar
  instanceVariableNames: 
    ' productions macros nonTerminals '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Grammar Constructor'
!

Object subclass: #Production
  instanceVariableNames: 
    ' name fsm lookahead isEGenerating firstSet followSet '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Grammar Constructor'
!


!Grammar class methodsFor: 'instance creation'!

new

    ^super new initialize! !

!Grammar class methodsFor: 'classMethods'!
   
fromParserTransitionSymbol: symbolOrPair
    | fsm s1 s2 transition |
    fsm := FiniteStateMachine new.
    
    s1 := FiniteStateMachineState new.
    s1 isInitial: true.
    
    s2 := FiniteStateMachineState new.
    s2 isFinal: true.
    
    transition := Transition new.
    transition goto: s2.
    transition transitionName: symbolOrPair.
    s1 transitions add: transition.
    
    fsm states add: s1.
    fsm states add: s2.
    
    ^ fsm renumber.!

fromScannerCollection: aCollection attributes: attributes
    | fsm s1 s2 transition |
    fsm := FiniteStateMachine new.
    
    s1 := FiniteStateMachineState new.
    s1 isInitial: true.
    
    s2 := FiniteStateMachineState new.
    s2 isFinal: true.
    
    aCollection do: [:x | 
        transition := Transition new.
        transition goto: s2.
        transition transitionName: (TransitionName new symbolOrPair: x; attributes: attributes).
        s1 transitions add: transition.
    ].
    fsm states add: s1.
    fsm states add: s2.

    ^ fsm renumber.! !


!Grammar methodsFor: 'initializing'!
 
initialize

    self
        nonTerminals: OrderedCollection new;
        productions: Dictionary new;
        macros: Dictionary new! !

!Grammar methodsFor: 'get/set'!

nonTerminals
    ^nonTerminals!

nonTerminals: anOrderedCollection
    nonTerminals := anOrderedCollection!
 
goalProductions
    | goalProductions |
    goalProductions := OrderedCollection new.
    self goalProductionsDo: [:production | goalProductions addIfIdenticalAbsent: production].
    ^goalProductions!
   
productions: aDictionary
    productions := aDictionary!
   
macros
    ^macros!

productions
    ^productions!
  
macros: aDictionary
    macros := aDictionary! !

!Grammar methodsFor: 'adding'!
 
addProduction: aProduction
    productions at: aProduction name put: aProduction!
  
addMacro: name  fsm: anFSM
    macros at: name put: anFSM! !

!Grammar methodsFor: 'querying'!
   
isEGeneratingNonterminal: nonterminal
    | production |
    production := self productionFor: nonterminal.
    ^ production isEGenerating!
  
isLeftPart: nonterminal
    ^productions keyExists: nonterminal!
   
isNonterminal: aTransitionName
    ^ nonTerminals includes: aTransitionName!
   
isGoal: nonterminal
    ^(self productionFor: nonterminal) isGoal!
 
macro: aSymbol
    ^macros at: aSymbol!

isMacro: aSymbol
    macros at: aSymbol ifAbsent: [^false].
    ^true!

isEGeneratingName: name
    name isSemanticAction ifTrue: [ ^ true ].
    (self isNonterminal: name symbol) ifFalse: [ ^ false ].
    ^ self isEGeneratingNonterminal: name symbol.! !

!Grammar methodsFor: 'eSets'!
  
eGeneratingNonterminals
    | changed |

    changed := true.
    
    " for each nonterminal or production "
    nonTerminals do: [:x |
        x isEGenerating: false.
    ].
    productions do: [:x |
        x isEGenerating: false.
    ].
    
    [ changed ] whileTrue: [
        changed := false.
        
        productions do: [:x |
            (x isEGenerating) ifFalse: [
                (self slowlyComputedIsEGenerating: x) ifTrue: [
                    x isEGenerating: true.
                    changed := true.
                ].
            ].
        ].
    ].
    
    self halt.!
 
firstSets
    | changed |
    
    changed := true.
    
    [ changed ] whileTrue: [
        changed := false.
        
        productions do: [:production |
            self eSucessorsOf: (production fsm allInitial) do: [:state |
                state transitions do: [:transition |
                    (transition name isSemanticAction) ifFalse: [
                        (self isNonterminal: transition name symbol) ifFalse: [
                            (production firstSet includesIdentical: transition name symbol) ifFalse: [
                                production firstSet add: transition name symbol.
                                changed := true.
                            ].
                        ]
                        ifTrue: [
                            (self productionFor: transition name symbol) firstSet do: [:b |
                                 (production firstSet includesIdentical: b) ifFalse: [
                                    production firstSet add: b.
                                    changed := true.
                                ].
                            ].
                        ].
                    ].
                ].
            ].
        ].
    ].!
  
followSets
    | changed a b c q |

    changed := true.
    
    productions do: [:x |
        (x lookahead notNil) ifTrue: [
            x followSet: x lookahead.
        ]
    ].

    [ changed ] whileTrue: [
        changed := false.
        
        productions do: [:production |
            (production fsm states) do: [:state |
                (state transitions) do: [:transition |
                    (self isNonterminal: transition name symbol) ifTrue: [
                        b := self productionFor: transition name symbol.
                        q := transition goto.
                        
                        self eSucessorsOf: q do: [:esucc |
                            esucc isFinal ifTrue: [
                                (b followSet includesAll: production followSet) ifFalse: [
                                    b followSet addAllIfAbsent: production followSet.
                                    changed := true.
                                ].
                            ].
                            q transitions do: [:et |
                                false ifFalse: [
                                    a := et name symbol.
                                    (self isNonterminal: a) ifTrue: [
                                        (self isNonterminal: transition name symbol) ifTrue: [
                                            c := self productionFor: a.
                                            (b followSet includesAll: c firstSet) ifFalse: [
                                                b followSet addAllIfAbsent: c firstSet.
                                                changed := true.
                                            ].
                                        ].
                                    ]
                                    ifFalse: [
                                        (et attributes includes: $R) ifTrue: [
                                            (b followSet includes: a) ifFalse: [
                                                b followSet add: a.
                                                changed := true.
                                            ].
                                        ].
                                    ].
                                ].
                            ].
                        ].
                    ].
                ].
            ].
        ].
    ].!
 
slowlyComputedIsEGenerating: nonterminal
    | fsm |
    fsm := self rightPartFor: nonterminal.
    ^ self thereExistsAFinalESucessorOf: fsm initialStates!
  
eSucessorsOf: states do: aBlock
    | all name goto |
    
    all := OrderedCollection new.
    
    (states class = OrderedCollection) ifTrue: [
        all addAll: states.
    ]
    ifFalse: [
        all add: states.
    ].
    
    all do: [:state |
        aBlock value: state.
        state transitions do: [:transition |
            name := transition transitionName.
            goto := transition goto.
            
            (self isEGeneratingName: name) ifTrue: [
                all addIfIdenticalAbsent: goto
            ]
        ]
    ].! !

!Grammar methodsFor: 'looping'!

computeNonTerminals
    
    nonTerminals := OrderedCollection new.
    
    productions do: [:x |
        nonTerminals add: x.
    ].
    
    ^ nonTerminals!
 
productionFor: aNonterminal
    productions do: [:production |
        (aNonterminal = production name) ifTrue: [ ^ production ].
    ].
    self halt.!

goalProductionsDo: aBlock
    "aGrammar goalProductionsDo: [:production | ... ]"
    ^self productions do: [:production | production isGoal ifTrue: [aBlock value: production]]! !

!Grammar methodsFor: 'printing'!

printOn: aStream

    aStream cr; << 'Grammar'; cr.
    
    productions do: [:x |
        aStream << x
    ].
    
    macros keysAndValuesDo: [:key :value |
        aStream cr. aStream << 'Macro: '; << key; cr.
        aStream << value.
    ].! !

Grammar comment: ''!


!Production class methodsFor: 'instance creation'!
 
new

    ^super new initialize! !


!Production methodsFor: 'initializing'!

initialize

    isEGenerating := false.
    firstSet := OrderedCollection new.
    followSet := OrderedCollection new.! !

!Production methodsFor: 'get/set'!
 
name
    ^name!

fsm: aFiniteStateMachine
    fsm := aFiniteStateMachine!
   
fsm
    ^fsm!
  
followSet: aFollowSet
    followSet := aFollowSet.!

firstSet
    ^ firstSet!
   
followSet
    ^ followSet!
 
lookahead: anFSMOrArray
    lookahead := anFSMOrArray!
 
lookahead
    ^lookahead!
  
name: aSymbol
    name := aSymbol! !

!Production methodsFor: 'alternative names for parts'!
 
leftPart
    ^self name!
   
leftPart: aSymbol
    self name: aSymbol!
  
rightPart: anFSM
    self fsm: anFSM! !

!Production methodsFor: 'printing'!
 
printOn: aStream
    | firstTime |
    aStream << self name.
    self lookahead notNil ifTrue: [
        firstTime := true. aStream << ' {'.
        self lookahead isArray
            ifTrue: [self lookahead do: [:label | firstTime ifFalse: [aStream << ' | ']. firstTime := false. aStream << label]] 
            ifFalse: [self lookahead initialTransitionsDo: [:label :goto | firstTime ifFalse: [aStream << ' | ']. firstTime := false. aStream << label]].
        aStream << '}'].
    aStream << ' ->'.
    fsm printOn: aStream tabs: 3! !

!Production methodsFor: 'querying'!
  
isGoal
    ^lookahead notNil!
  
rightPart
    ^self fsm! !

Production comment: ''!
