
Object subclass: #FiniteStateMachine
  instanceVariableNames: 
    ' states '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'FSM Constructor'
!

Object subclass: #FiniteStateMachineBuilder
  instanceVariableNames: 
    ' parser tree map isParser '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'FSM Constructor'
!

Object subclass: #FiniteStateMachineState
  instanceVariableNames: 
    ' transitions isInitial isFinal stateNumber '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'FSM Constructor'
!

Object subclass: #Transition
  instanceVariableNames: 
    ' transitionName goto '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'FSM Constructor'
!

Object subclass: #TransitionName
  instanceVariableNames: 
    ' symbolOrPair attributes action parameters isRootBuilding name state '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'FSM Constructor'
!


!FiniteStateMachine class methodsFor: 'instance creation'!

new

    ^super new initialize! !

!FiniteStateMachine class methodsFor: 'classMethods'!

forIdentifier: aSymbol attributes: attributes
    | fsm transitions state1 state2 transition1 |
    fsm := FiniteStateMachine new.
    
    state1 := FiniteStateMachineState new isInitial: true; stateNumber: 1.
    state2 := FiniteStateMachineState new isFinal: true; stateNumber: 2.
    
    state1 transitions add: (Transition new goto: state2; transitionName: (TransitionName new symbolOrPair: aSymbol; attributes: attributes )).
    
    fsm states add: state1; add: state2.
    ^fsm.!
 
forE
    | fsm state1 |
    fsm := FiniteStateMachine new.
    state1 := FiniteStateMachineState new isInitial: true; isFinal: true; stateNumber: 1.
    fsm states add: state1.
    ^fsm.!

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

    ^ fsm renumber.!
 
concat: fsms
    | fsm |
    fsm := fsms first.
    fsms rest do: [:cfsm | 
        fsm concat: cfsm.
    ].
    ^ fsm renumber.!
 
minus: fsms
    | fsm |
    fsm := fsms first.
    fsms rest do: [:x |
        fsm := fsm minus: x.
    ].
    
    ^fsm renumber.!
  
or: fsms
    | fsm |
    fsm := fsms first.
    fsms rest do: [:cfsm | 
        fsm or: cfsm.
    ].
    ^ fsm renumber.! !

!FiniteStateMachine class methodsFor: 'examples'!
  
example2
    "FiniteStateMachine example2"
    |fsm s1 s2 s3 s4 s5 t1 t2 t3 t4  n1 n2 n3 n4 |
    fsm := FiniteStateMachine new.
    s1 := FiniteStateMachineState new isInitial: true; isFinal: true.
    s2 := FiniteStateMachineState new isInitial: false; isFinal: false.
    s3 := FiniteStateMachineState new isInitial: false; isFinal: false.
    s4 := FiniteStateMachineState new isInitial: false; isFinal: true.
    s5 := FiniteStateMachineState new isInitial: false; isFinal: true.
    
    n1 := TransitionName new symbolOrPair: #S; attributes: Attribute parserNonterminalDefaultAttributes.
    t1:= Transition new transitionName: n1; goto: s2.
    n2 := TransitionName new symbolOrPair: #a; attributes: Attribute parserNonterminalDefaultAttributes.
    t2 := Transition new transitionName: n2; goto: s5.
    n3 := TransitionName new symbolOrPair: #a; attributes: Attribute look.
    t3 := Transition new transitionName: n3; goto: s3.
    n4 := TransitionName new symbolOrPair: #''; action: #buildTree; parameters: #("'list'").
    t4 := Transition new transitionName: n4; goto: s4.

    s1 transitions add: t1; add: t2.
    s2 transitions add: t3.
    s3 transitions add: t4.

    fsm states add: s1; add: s2; add: s3; add: s4; add: s5.
        fsm renumber.
    Transcript cr; <<fsm.!
 
example1
    "FiniteStateMachine example1"
    |fsm s1 s2 s3 s4 s5 s6 t1 t2 t3 t4 t5 t6 t7 t8 n1 n2 n3 n4 n5 n6 n7 n8|
    fsm := FiniteStateMachine new.
    s1 := FiniteStateMachineState new isInitial: true; isFinal: true.
    s2 := FiniteStateMachineState new isInitial: false; isFinal: false.
    s3 := FiniteStateMachineState new isInitial: false; isFinal: false.
    s4 := FiniteStateMachineState new isInitial: false; isFinal: false.
    s5 := FiniteStateMachineState new isInitial: false; isFinal: false.
    s6 := FiniteStateMachineState new isInitial: false; isFinal: true.
    n1 := TransitionName new symbolOrPair: #'"'; attributes: Attribute look.
    t1:= Transition new transitionName: n1; goto: s2.
    n2 := TransitionName new symbolOrPair: #nonQuote; attributes: Attribute readKeep.
    t2 := Transition new transitionName: n2; goto: s2.
    n3 := TransitionName new symbolOrPair: #endOfFile; attributes: Attribute look.
    t3 := Transition new transitionName: n3; goto: s4.
    t4 := Transition new transitionName: n1; goto: s3.
    n5 := TransitionName new symbolOrPair: #endOfFile; attributes: Attribute look.
    t5 := Transition new transitionName: n5; goto: s5.
    n6 := TransitionName new symbolOrPair: #nonQuote; attributes: Attribute look.
    t6 := Transition new transitionName: n6; goto: s5.
    n7 := TransitionName new symbolOrPair: #'#missingQuote'; action: #missingQuote; parameters: #().
    t7 := Transition new transitionName: n7; goto: s5.
    n8 := TransitionName new symbolOrPair: #'#emitToken'; action: #emitToken; parameters: #String.
    t8 := Transition new transitionName: n8; goto: s6.

    s1 transitions add: t1.
    s2 transitions add: t2; add: t3; add: t4.
    s3 transitions add: t5; add: t6.
    s4 transitions add: t7.
    s5 transitions add: t8.

    fsm states add: s1; add: s2; add: s3; add: s4; add: s5; add: s6.
        fsm renumber.
    Transcript cr; <<fsm.!
   
experimentingExample2
    "FiniteStateMachine experimentingExample2"
    |fsm state1 state2 state3 transition1 transition2 label1 label2|
    fsm := FiniteStateMachine new.
    label1 := TransitionName new symbolOrPair: #S; attributes: Attribute parserNonterminalDefaultAttributes.
    label2 := TransitionName new symbolOrPair: #a; action: #buildTree; parameters: #(1 2 4 7 9).
    state1 := FiniteStateMachineState new isInitial: true; isFinal: true.
    state2 := FiniteStateMachineState new isInitial: false; isFinal: true.
    state3 := FiniteStateMachineState new isInitial: false; isFinal: false.
    transition1:= Transition new transitionName: label1; goto: state2.
    transition2 := Transition new transitionName: label2; goto: state3.
    state1 transitions add: transition1.
    state2 transitions add: transition2.
    fsm states add: state1; add: state2; add: state3. 
    ^fsm renumber.!
   
experimentingExample1
    "FiniteStateMachine experimentingExample1"
    |fsm state1 state2 transition1 transition2|
    fsm := FiniteStateMachine new.
    state1 := FiniteStateMachineState new isInitial: true; isFinal: false.
    state2 := FiniteStateMachineState new isInitial: false; isFinal: true.
    transition1 := Transition new transitionName: 'a'; goto: state2.
    transition2 := Transition new transitionName: 'a'; goto: state2.
    state1 transitions add: transition1.
    state2 transitions add: transition2.
    fsm states add: state1; add: state2. 
    ^fsm renumber.! !


!FiniteStateMachine methodsFor: 'initializing'!
   
override: attributes
| attrs |

attributes do: [:symbolOrPair | 
    self states do: [:state | 
        state transitions do: [:transition |
            transition override: symbolOrPair.
        ].
    ].
].
^ self.!
 
questionMark
    ^ self class forE or: self.!
  
initialize

    self
        states: OrderedCollection new! !

!FiniteStateMachine methodsFor: 'get/set'!
  
states: aCollection
    states := aCollection!
 
states
    ^states! !

!FiniteStateMachine methodsFor: 'fsmMethods'!
 
allFinal
    ^states select: [:x | x isFinal].!

and: fsm2
    states addAll: fsm2 states.
    ^ self reduce.!
 
renumber
    states indexedDo: [:index :state | state stateNumber: index].!

allInitial
    ^states select: [:x | x isInitial].!

recognizesE
    states do: [:state | (state isInitial and: [state isFinal]) ifTrue: [^true]].
    ^false.!

star
    ^ (FiniteStateMachine forE or: self plus) renumber.!
  
reduce
    | cameFromInitial canReachFinal changed |
    self renumber.
    
    cameFromInitial := IdentityDictionary new.
    canReachFinal := IdentityDictionary new.
    
    self states do: [:state |
        cameFromInitial at: state put: state isInitial.
        canReachFinal at: state put: state isFinal.
    ].
    
    changed := true.
    [ changed ] whileTrue: [
        changed := false.
        self states do: [:state |
            state transitions do: [:transition |
                (cameFromInitial at: state) ifTrue: [
                    (cameFromInitial at: transition goto) ifFalse: [
                        changed := true.
                    ].
                    cameFromInitial at: transition goto put: true.
                ].
                
                (canReachFinal at: transition goto) ifTrue: [
                    (canReachFinal at: state) ifFalse: [
                        changed := true.
                    ].
                    canReachFinal at: state put: true.
                ].
            ].
        ].
    ].
    
    self states: (self states select: [:state |
        (cameFromInitial at: state) and: [canReachFinal at: state].
    ]).
    self states do: [:state |
        state transitions: (state transitions select: [:transition |
            states includesIdentical: transition goto.
        ]).
    ].
    
    
    ^self renumber!
  
initialTransitions
    ^ (states collect: [:x | x transitions] when: [:x | x isInitial]) flattened.!
   
minus: fsm2
    states addAll: fsm2 states.
    ^ self reduce.!
   
concat: fsm2
    | fsm1RecE fsm2RecE fsm1Final fsm2Initial |
    fsm1Final := self allFinal.
    fsm2Initial := fsm2 allInitial.
    fsm1RecE := self recognizesE.
    fsm2RecE := fsm2 recognizesE.
    
    fsm1Final do: [:state | 
        state transitions addAllIfAbsent: (fsm2 initialTransitions).
    ].
    
    fsm2RecE ifFalse: [ fsm1Final do: [:state | state isFinal: false] ].
    fsm1RecE ifFalse: [ fsm2Initial do: [:state | state isInitial: false] ].

    self states addAll: fsm2 states.

    ^ self reduce.!

copy
    | fsm stateMap |
    fsm := FiniteStateMachine new.
    stateMap := Dictionary new.
    "TODO: make states first, then copy the transitions
    deepCopy
    "    
    states do: [:state | 
    
        fsm states add: (FiniteStateMachineState new 
            isInitial: state isInitial;
            isFinal: state isFinal
        ).
        
        stateMap at: state put: fsm states last.    
    ].
    
    states do: [:state |
        state transitions do: [:trans | 
            (stateMap at: state) transitions add: (Transition new transitionName: trans transitionName deepCopy; goto: (stateMap at: trans goto)).
        ].
    ].
    
    ^ fsm renumber.!

or: fsm2
    states addAll: fsm2 states.
    ^ self reduce.!
  
plus
    self allFinal do: [:state | state transitions addAllIfAbsent: self initialTransitions].
    ^ self.! !

!FiniteStateMachine methodsFor: 'printing'!

printOn: aStream

    aStream << 'FSM'.
    self states do:[ :state | state printOn: aStream ].
    aStream cr;<< 'END'.! !

!FiniteStateMachine methodsFor: 'query'! !

FiniteStateMachine comment: ''!


!FiniteStateMachineBuilder class methodsFor: 'instance creation'!
 
new

    ^super new initialize! !

!FiniteStateMachineBuilder class methodsFor: 'raw tables'!
   
rawParserTables
    "FiniteStateMachineBuilder rawParserTables"
    ^
#(
   (keywords stack noStack read look node noNode keep noKeep parser scanner)
   (ReadaheadTable 1 (parser 'RS' 104) (scanner 'RS' 105))
   (ReadaheadTable 2 (walkString: 'RSN' 39) (walkIdentifier: 'RSN' 39) (EndOfFile 'L' 31))
   (ReadaheadTable 3 (#'=' 'RS' 4))
   (ReadaheadTable 4 (walkString: 'RSN' 39) (walkSymbol: 'RSN' 9) (walkInteger: 'RSN' 43) (#'(' 'RS' 10) (walkCharacter: 'RSN' 43) (#'{' 'RS' 11) (walkIdentifier: 'RSN' 39) (#')' 'L' 86) (#'}' 'L' 86) (#'=>' 'L' 86) (#';' 'L' 86))
   (ReadaheadTable 5 (#'[' 'RS' 15) (#'*' 'L' 40) (#'?' 'L' 40) (#'+' 'L' 40) (#'&' 'L' 40) (#'-' 'L' 40) (#'(' 'L' 40) (#'{' 'L' 40) (walkIdentifier: 'L' 40) (walkString: 'L' 40) (walkSymbol: 'L' 40) (walkCharacter: 'L' 40) (walkInteger: 'L' 40) (#'|' 'L' 40) (#')' 'L' 40) (#'}' 'L' 40) (#'=>' 'L' 40) (#';' 'L' 40))
   (ReadaheadTable 6 (#'=>' 'RS' 16) (#';' 'L' 41))
   (ReadaheadTable 7 (#'..' 'RS' 17) (#'[' 'L' 42) (#'*' 'L' 42) (#'?' 'L' 42) (#'+' 'L' 42) (#'&' 'L' 42) (#'-' 'L' 42) (#'(' 'L' 42) (#'{' 'L' 42) (walkIdentifier: 'L' 42) (walkString: 'L' 42) (walkSymbol: 'L' 42) (walkCharacter: 'L' 42) (walkInteger: 'L' 42) (#'|' 'L' 42) (#')' 'L' 42) (#'}' 'L' 42) (#'=>' 'L' 42) (#';' 'L' 42))
   (ReadaheadTable 8 (#';' 'RS' 18))
   (ReadaheadTable 9 (#'[' 'RS' 19) (#'*' 'L' 47) (#'?' 'L' 47) (#'+' 'L' 47) (#'&' 'L' 47) (#'-' 'L' 47) (#'(' 'L' 47) (#'{' 'L' 47) (walkIdentifier: 'L' 47) (walkString: 'L' 47) (walkSymbol: 'L' 47) (walkCharacter: 'L' 47) (walkInteger: 'L' 47) (#';' 'L' 47) (#'|' 'L' 47) (#')' 'L' 47) (#'}' 'L' 47) (#'=>' 'L' 47))
   (ReadaheadTable 10 (walkString: 'RSN' 39) (walkSymbol: 'RSN' 9) (walkInteger: 'RSN' 43) (#'(' 'RS' 10) (walkCharacter: 'RSN' 43) (#'{' 'RS' 11) (walkIdentifier: 'RSN' 39) (#')' 'L' 86) (#'}' 'L' 86) (#'=>' 'L' 86) (#';' 'L' 86))
   (ReadaheadTable 11 (walkString: 'RSN' 39) (walkSymbol: 'RSN' 9) (walkInteger: 'RSN' 43) (#'(' 'RS' 10) (walkCharacter: 'RSN' 43) (#'{' 'RS' 11) (walkIdentifier: 'RSN' 39) (#')' 'L' 86) (#'}' 'L' 86) (#'=>' 'L' 86) (#';' 'L' 86))
   (ReadaheadTable 12 (#'*' 'RS' 52) (#'?' 'RS' 53) (#'+' 'RS' 54) (#'&' 'RS' 22) (#'-' 'RS' 23) (#'(' 'L' 44) (#'{' 'L' 44) (walkIdentifier: 'L' 44) (walkString: 'L' 44) (walkSymbol: 'L' 44) (walkCharacter: 'L' 44) (walkInteger: 'L' 44) (#'|' 'L' 44) (#')' 'L' 44) (#'}' 'L' 44) (#'=>' 'L' 44) (#';' 'L' 44))
   (ReadaheadTable 13 (#'|' 'RS' 24) (#')' 'L' 45) (#'}' 'L' 45) (#'=>' 'L' 45) (#';' 'L' 45))
   (ReadaheadTable 14 (walkString: 'RSN' 39) (walkSymbol: 'RSN' 9) (walkInteger: 'RSN' 43) (#'(' 'RS' 10) (walkCharacter: 'RSN' 43) (#'{' 'RS' 11) (walkIdentifier: 'RSN' 39) (#'|' 'L' 46) (#')' 'L' 46) (#'}' 'L' 46) (#'=>' 'L' 46) (#';' 'L' 46))
   (ReadaheadTable 15 (keep 'RSN' 49) (noNode 'RSN' 49) (noStack 'RSN' 49) (#']' 'RS' 56) (read 'RSN' 49) (look 'RSN' 49) (stack 'RSN' 49) (node 'RSN' 49) (noKeep 'RSN' 49))
   (ReadaheadTable 16 (walkString: 'RSN' 39) (#'-' 'RS' 27) (walkSymbol: 'RSN' 9) (walkIdentifier: 'RSN' 39) (#'+' 'RS' 28) (walkInteger: 'RSN' 59))
   (ReadaheadTable 17 (walkInteger: 'RSN' 43) (walkCharacter: 'RSN' 43))
   (ReadaheadTable 18 (walkString: 'RSN' 39) (walkIdentifier: 'RSN' 39) (EndOfFile 'L' 31))
   (ReadaheadTable 19 (walkString: 'RSN' 39) (walkSymbol: 'RSN' 50) (walkIdentifier: 'RSN' 39) (walkCharacter: 'RSN' 43) (#']' 'RS' 62) (walkInteger: 'RSN' 43))
   (ReadaheadTable 20 (#')' 'RS' 51))
   (ReadaheadTable 21 (#'}' 'RS' 63))
   (ReadaheadTable 22 (walkSymbol: 'RSN' 9) (walkString: 'RSN' 39) (walkIdentifier: 'RSN' 39) (#'{' 'RS' 11) (walkCharacter: 'RSN' 43) (walkInteger: 'RSN' 43) (#'(' 'RS' 10))
   (ReadaheadTable 23 (walkSymbol: 'RSN' 9) (walkString: 'RSN' 39) (walkIdentifier: 'RSN' 39) (#'{' 'RS' 11) (walkCharacter: 'RSN' 43) (walkInteger: 'RSN' 43) (#'(' 'RS' 10))
   (ReadaheadTable 24 (walkString: 'RSN' 39) (walkSymbol: 'RSN' 9) (walkInteger: 'RSN' 43) (#'(' 'RS' 10) (walkCharacter: 'RSN' 43) (#'{' 'RS' 11) (walkIdentifier: 'RSN' 39))
   (ReadaheadTable 25 (walkString: 'RSN' 39) (walkSymbol: 'RSN' 9) (walkInteger: 'RSN' 43) (#'(' 'RS' 10) (walkCharacter: 'RSN' 43) (#'{' 'RS' 11) (walkIdentifier: 'RSN' 39) (#'|' 'L' 55) (#')' 'L' 55) (#'}' 'L' 55) (#'=>' 'L' 55) (#';' 'L' 55))
   (ReadaheadTable 26 (keep 'RSN' 49) (noNode 'RSN' 49) (noStack 'RSN' 49) (#']' 'RS' 56) (read 'RSN' 49) (look 'RSN' 49) (stack 'RSN' 49) (node 'RSN' 49) (noKeep 'RSN' 49))
   (ReadaheadTable 27 (walkInteger: 'RSN' 67))
   (ReadaheadTable 28 (walkInteger: 'RSN' 59))
   (ReadaheadTable 29 (walkString: 'RSN' 39) (walkSymbol: 'RSN' 50) (#']' 'RS' 62) (walkIdentifier: 'RSN' 39) (walkCharacter: 'RSN' 43) (walkInteger: 'RSN' 43))
   (ReadaheadTable 30 (#'|' 'RS' 24) (#')' 'L' 66) (#'}' 'L' 66) (#'=>' 'L' 66) (#';' 'L' 66))
   (ReadbackTable 31 ((GrammarType 2) 'RSN' 85) ((#';' 18) 'RS' 68))
   (ReadbackTable 32 ((RepetitionOption 25) 'RSN' 32) ((RepetitionOption 14) 'RSN' 92))
   (ReadbackTable 33 ((#'[' 15) 'RS' 70) ((Attribute 26) 'RSN' 33))
   (ReadbackTable 34 ((#'+' 28) 'RS' 96) ((#'=>' 16) 'L' 96))
   (ReadbackTable 35 ((#'[' 19) 'RS' 47) ((SemanticActionParameter 29) 'RSN' 35))
   (ReadbackTable 36 ((Concatenation 30) 'RSN' 69) ((Concatenation 13) 'RSN' 102))
   (ReadbackTable 37 ((GrammarType 2) 'RSN' 85) ((#';' 18) 'RS' 68))
   (ShiftbackTable 38 1 79)
   (ShiftbackTable 39 1 75)
   (ShiftbackTable 40 1 71)
   (ShiftbackTable 41 1 83)
   (ShiftbackTable 42 1 80)
   (ShiftbackTable 43 1 82)
   (ShiftbackTable 44 1 74)
   (ShiftbackTable 45 1 81)
   (ShiftbackTable 46 1 72)
   (ShiftbackTable 47 1 87)
   (ShiftbackTable 48 1 88)
   (ShiftbackTable 49 1 77)
   (ShiftbackTable 50 1 76)
   (ShiftbackTable 51 3 80)
   (ShiftbackTable 52 2 89)
   (ShiftbackTable 53 2 90)
   (ShiftbackTable 54 2 91)
   (ShiftbackTable 55 1 32)
   (ShiftbackTable 56 1 33)
   (ShiftbackTable 57 1 94)
   (ShiftbackTable 58 3 95)
   (ShiftbackTable 59 1 34)
   (ShiftbackTable 60 1 97)
   (ShiftbackTable 61 3 98)
   (ShiftbackTable 62 1 35)
   (ShiftbackTable 63 3 99)
   (ShiftbackTable 64 3 100)
   (ShiftbackTable 65 3 101)
   (ShiftbackTable 66 2 36)
   (ShiftbackTable 67 2 103)
   (ShiftbackTable 68 3 37)
   (ShiftbackTable 69 1 36)
   (ShiftbackTable 70 1 93)
   (ReduceTable 71 Expression (4 'RSN' 12)(10 'RSN' 12)(11 'RSN' 12)(14 'RSN' 12)(22 'RSN' 64)(23 'RSN' 65)(24 'RSN' 12)(25 'RSN' 12))
   (ReduceTable 72 Concatenation (4 'RSN' 13)(10 'RSN' 13)(11 'RSN' 13)(24 'RSN' 30))
   (ReduceTable 73 ListOfFiniteStateMachines (1 'RSN' 106))
   (ReduceTable 74 RepetitionOption (4 'RSN' 14)(10 'RSN' 14)(11 'RSN' 14)(14 'RSN' 25)(24 'RSN' 14)(25 'RSN' 25))
   (ReduceTable 75 Name (2 'RSN' 3)(4 'RSN' 42)(10 'RSN' 42)(11 'RSN' 42)(14 'RSN' 42)(16 'RSN' 57)(18 'RSN' 3)(19 'RSN' 50)(22 'RSN' 42)(23 'RSN' 42)(24 'RSN' 42)(25 'RSN' 42)(29 'RSN' 50))
   (ReduceTable 76 SemanticActionParameter (19 'RSN' 29)(29 'RSN' 29))
   (ReduceTable 77 Attribute (15 'RSN' 26)(26 'RSN' 26))
   (ReduceTable 78 TreeBuildingOptions (16 'RSN' 58))
   (ReduceTable 79 GrammarType (1 'RSN' 2))
   (ReduceTable 80 Primary (4 'RSN' 5)(10 'RSN' 5)(11 'RSN' 5)(14 'RSN' 5)(22 'RSN' 5)(23 'RSN' 5)(24 'RSN' 5)(25 'RSN' 5))
   (ReduceTable 81 Alternation (4 'RSN' 6)(10 'RSN' 20)(11 'RSN' 21))
   (ReduceTable 82 Byte (4 'RSN' 7)(10 'RSN' 7)(11 'RSN' 7)(14 'RSN' 7)(17 'RSN' 61)(19 'RSN' 50)(22 'RSN' 7)(23 'RSN' 7)(24 'RSN' 7)(25 'RSN' 7)(29 'RSN' 50))
   (ReduceTable 83 FiniteStateMachine (4 'RSN' 8))
   (ReduceTable 84 SemanticAction (4 'RSN' 48)(10 'RSN' 48)(11 'RSN' 48)(14 'RSN' 48)(16 'RSN' 60)(22 'RSN' 48)(23 'RSN' 48)(24 'RSN' 48)(25 'RSN' 48))
   (SemanticTable 85 buildTree: walkList: 73)
   (SemanticTable 86 buildTree: walkEpsilon: 81)
   (SemanticTable 87 buildTree: walkSemanticAction: 84)
   (SemanticTable 88 buildTree: walkNonTreeBuildingSemanticAction: 71)
   (SemanticTable 89 buildTree: walkStar: 74)
   (SemanticTable 90 buildTree: walkQuestionMark: 74)
   (SemanticTable 91 buildTree: walkPlus: 74)
   (SemanticTable 92 buildTree: walkConcatenation: 72)
   (SemanticTable 93 buildTree: walkAttributes: 71)
   (SemanticTable 94 buildTree: walkBuildTreeOrTokenFromName: 78)
   (SemanticTable 95 buildTree: walkConcatenation: 83)
   (SemanticTable 96 buildTree: walkBuildTreeFromLeftIndex: 78)
   (SemanticTable 97 buildTree: walkTreeBuildingSemanticAction: 78)
   (SemanticTable 98 buildTree: walkDotDot: 80)
   (SemanticTable 99 buildTree: walkLook: 80)
   (SemanticTable 100 buildTree: walkAnd: 74)
   (SemanticTable 101 buildTree: walkMinus: 74)
   (SemanticTable 102 buildTree: walkOr: 81)
   (SemanticTable 103 buildTree: walkBuildTreeFromRightIndex: 78)
   (SemanticTable 104 processTypeNow: parser 38)
   (SemanticTable 105 processTypeNow: scanner 38)
   (AcceptTable 106))!
 
rawScannerTables
    "FiniteStateMachineBuilder rawScannerTables"
    ^
#(
   (ScannerReadaheadTable 1 ('''' 'R' 9) (']' 'RK' 36) ('/' 'R' 10) ('{' 'RK' 37) ('}' 'RK' 38) ('"' 'R' 11) ('$' 'R' 12) ((256) 'L' 21) ('?' 'RK' 32) ('ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 6) ('(' 'RK' 23) (')' 'RK' 24) ('*' 'RK' 25) ('+' 'RK' 26) ('-' 'RK' 2) ('&' 'RK' 22) ('.' 'RK' 3) ((9 10 12 13) 'R' 7) (' ' 'R' 7) ('0123456789' 'RK' 4) (';' 'RK' 30) ('=' 'RK' 5) ('[' 'RK' 34) ('#' 'R' 8) ('|' 'RK' 35))
   (ScannerReadaheadTable 2 ((9 10 12 13 96 147 148 256) 'L' 27) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<[]{}()^;#:.$''" ' 'L' 27) ('>' 'RK' 39))
   (ScannerReadaheadTable 3 ((9 10 12 13 96 147 148 256) 'L' 28) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:$''" ' 'L' 28) ('.' 'RK' 40))
   (ScannerReadaheadTable 4 ((9 10 12 13 96 147 148 256) 'L' 29) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!!,+-/\*~=@%&?|<>[]{}()^;#:.$''" ' 'L' 29) ('0123456789' 'RK' 4))
   (ScannerReadaheadTable 5 ((9 10 12 13 96 147 148 256) 'L' 31) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<[]{}()^;#:.$''" ' 'L' 31) ('>' 'RK' 41))
   (ScannerReadaheadTable 6 ((9 10 12 13 96 147 148 256) 'L' 33) ('!!,+-/\*~=@%&?|<>[]{}()^;#.$''" ' 'L' 33) ('0123456789:ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 6))
   (ScannerReadaheadTable 7 ((96 147 148 256) 'L' 1) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$''"' 'L' 1) ((9 10 12 13) 'R' 7) (' ' 'R' 7))
   (ScannerReadaheadTable 8 ('"' 'R' 14) ('''' 'R' 15) ('ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 13))
   (ScannerReadaheadTable 9 ((256) 'LK' 43) ('''' 'R' 16) ((9 10 12 13 96 147 148) 'RK' 9) (' !!"#$%&()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 9))
   (ScannerReadaheadTable 10 ((9 10 12 13) 'L' 45) (' ' 'L' 45) ((96 147 148 256) 'LK' 45) ('=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_\abcdefghijklmnopqrstuvwxyz{|}~!!"#$%&''()*+,-.0123456789:;<' 'LK' 45) ('/' 'R' 17))
   (ScannerReadaheadTable 11 ((256) 'LK' 46) ('"' 'R' 18) ((9 10 12 13 96 147 148) 'RK' 11) (' !!#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 11))
   (ScannerReadaheadTable 12 ((9 10 12 13 96 147 148) 'RK' 47) (' !!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 47))
   (ScannerReadaheadTable 13 ((9 10 12 13 96 147 148 256) 'L' 42) ('!!,+-/\*~=@%&?|<>[]{}()^;#.$''" ' 'L' 42) ('0123456789:ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 13))
   (ScannerReadaheadTable 14 ((256) 'LK' 48) ('"' 'R' 19) ((9 10 12 13 96 147 148) 'RK' 14) (' !!#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 14))
   (ScannerReadaheadTable 15 ((256) 'LK' 49) ('''' 'R' 20) ((9 10 12 13 96 147 148) 'RK' 15) (' !!"#$%&()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 15))
   (ScannerReadaheadTable 16 ((9 10 12 13 96 147 148 256) 'L' 44) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$" ' 'L' 44) ('''' 'RK' 9))
   (ScannerReadaheadTable 17 ((9 96 147 148) 'R' 17) ('=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~ !!"#$%&''()*+,-./0123456789:;<' 'R' 17) ((256) 'LK' 1) ((10 12 13) 'R' 1))
   (ScannerReadaheadTable 18 ((9 10 12 13 96 147 148 256) 'L' 44) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$'' ' 'L' 44) ('"' 'RK' 11))
   (ScannerReadaheadTable 19 ((9 10 12 13 96 147 148 256) 'L' 42) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$'' ' 'L' 42) ('"' 'RK' 14))
   (ScannerReadaheadTable 20 ((9 10 12 13 96 147 148 256) 'L' 42) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$" ' 'L' 42) ('''' 'RK' 15))
   (SemanticTable 21 buildToken: EndOfFile 1)
   (SemanticTable 22 buildToken: '&' 1)
   (SemanticTable 23 buildToken: '(' 1)
   (SemanticTable 24 buildToken: ')' 1)
   (SemanticTable 25 buildToken: '*' 1)
   (SemanticTable 26 buildToken: '+' 1)
   (SemanticTable 27 buildToken: '-' 1)
   (SemanticTable 28 buildToken: '.' 1)
   (SemanticTable 29 buildToken: walkInteger: 1)
   (SemanticTable 30 buildToken: ';' 1)
   (SemanticTable 31 buildToken: '=' 1)
   (SemanticTable 32 buildToken: '?' 1)
   (SemanticTable 33 buildToken: walkIdentifier: 1)
   (SemanticTable 34 buildToken: '[' 1)
   (SemanticTable 35 buildToken: '|' 1)
   (SemanticTable 36 buildToken: ']' 1)
   (SemanticTable 37 buildToken: '{' 1)
   (SemanticTable 38 buildToken: '}' 1)
   (SemanticTable 39 buildToken: '->' 1)
   (SemanticTable 40 buildToken: '..' 1)
   (SemanticTable 41 buildToken: '=>' 1)
   (SemanticTable 42 buildToken: walkSymbol: 1)
   (SemanticTable 43 syntaxError: 'missing end quote for single quoted string' 44)
   (SemanticTable 44 buildToken: walkString: 1)
   (SemanticTable 45 syntaxError: '// is a comment, / alone is not valid' 1)
   (SemanticTable 46 syntaxError: 'missing end quote for double quoted string' 44)
   (SemanticTable 47 buildToken: walkCharacter: 1)
   (SemanticTable 48 syntaxError: 'missing end quote for double quoted string' 42)
   (SemanticTable 49 syntaxError: 'missing end quote for single quoted string' 42))! !

!FiniteStateMachineBuilder class methodsFor: 'examples'!

promptForFiniteStateMachines
    "FiniteStateMachineBuilder promptForFiniteStateMachines"
    | fileName file |
    fileName :=  FileDialog promptTitle: 'File of finite state machines'.
    fileName isNil ifTrue: [^self]. "User cancelled"
    Transcript cr; cr; << 'Building finite state machines for file '; << fileName printString.
    file := File pathNameReadOnly: fileName.
    ^FiniteStateMachineBuilder new process: file contents! !


!FiniteStateMachineBuilder methodsFor: 'initializing'!
  
initialize
    parser := Parser
        for: self
        parserTables: self class rawParserTables
        scannerTables: self class rawScannerTables.
    map := Dictionary new.! !

!FiniteStateMachineBuilder methodsFor: 'processing'!
   
scannerDefaults
    ^ 'RK'.!
   
process: text
    tree := parser parse: text.
    self walkTree: tree!

walkTree: aTree
    ^self perform: aTree label with: aTree!

parserDefaults
    ^ 'RS'.!

convert: aTree
    | type |
    type := aTree label.
    
    type = #walkCharacter: ifTrue: [
        ^aTree symbol first
    ].
    type = #walkString: ifTrue: [
        ^aTree symbol asString
    ].
    type = #walkInteger: ifTrue: [
        ^aTree symbol asInteger
    ].
    type = #walksymbol: ifTrue: [
        ^aTree symbol asSymbol
    ].
    type = #walkIdentifier: ifTrue: [
        ^aTree symbol asSymbol
    ].! !

!FiniteStateMachineBuilder methodsFor: 'tree walking'!
  
walkOr: aTree
    ^ FiniteStateMachine or: (aTree children collect: [:child | self walkTree: child]).!
 
walkCharacter: aTree
    ^ FiniteStateMachine fromScannerCollection: aTree symbol attributes: self scannerDefaults.!
   
walkAttributes: aTree
    | fsm |
    fsm := self walkTree: (aTree children first).
    ^fsm override: (aTree children rest collect: [:token | token symbol ]).!
 
walkIdentifier: aTree
    | fsm |
    fsm := map at: aTree symbol ifAbsent: [ nil ].
    fsm isNil ifFalse: [^fsm copy].
    fsm := FiniteStateMachine forIdentifier: aTree symbol attributes: (isParser ifTrue: [self parserDefaults] ifFalse: ['RK']).
    ^ fsm.!
   
walkQuestionMark: aTree
    ^ (self walkTree: (aTree children first)) questionMark.!
   
walkAnd: aTree
     | fsm1 fsm2 |
    fsm1 := self walkTree: (aTree child: 1).
    fsm2 := self walkTree: (aTree child: 2).
    ^fsm1 and: fsm2!

walkConcatenation: aTree
    | fsms |
    fsms := aTree children collect: [:child | self walkTree: child].
    ^ FiniteStateMachine concat: fsms.!
   
walkTreeBuildingSemanticAction: aTree
    ^ (self walkTree: aTree children first) override: #treeBuilding.!

walkBuildTreeOrTokenFromName: aTree
    | parameters aTransitionName |
    parameters := aTree children collect: [:x | self convert: x].
    
    aTransitionName := TransitionName new
        action: (isParser ifTrue: [#buildTree] ifFalse: [#buildToken]);
        isRootBuilding: isParser;
        parameters: parameters;
        symbolOrPair: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.!
 
walkBuildTreeFromLeftIndex: aTree
    | parameters aTransitionName |
    parameters := aTree children collect: [:x | self convert: x ]. 
    
    aTransitionName := TransitionName new
        action: (isParser ifTrue: [#buildTreeFromIndex] ifFalse: [#buildToken]);
        isRootBuilding: true;
        parameters: parameters;
        symbolOrPair: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.!

walkList: aTree
    "Note: Since none of the walk routines are there (except this one), running will stop as soon
    as a new one that you must implement is reached."

    | name fsm outputIndex |
    "If there is too much output, just change the index. If it's 10, you start outputting at fsm 10."
    outputIndex := 1. "self halt: 'Task 4: Take a look at the tree...'."

    1 to: aTree children size by: 2 do: [:index |
        "Child index must be a walkIdentifier: token and child index+1 must be a finite state machine tree."
        name := (aTree child: index) symbol.
        fsm := self walkTree: (aTree child: index+1).
        (index+1)/2  >= outputIndex ifTrue: [
            Transcript cr; << 'FSM for '; << name; << ' = '; cr; << fsm; cr].
        map at: name put: fsm].!
  
walkLook: aTree
    ^(self walkTree: (aTree child: 1)) override: #(#look).!

walkDotDot: aTree
    | startVal endVal parameters fsm |
    
    parameters := OrderedCollection new.
    startVal := aTree children first symbol first asciiValue.
    endVal := aTree children second symbol first asciiValue.
    
    startVal to: endVal do: [:value | 
        parameters add: value asCharacter.
    ].
    
    fsm := FiniteStateMachine fromScannerCollection: parameters attributes: self scannerDefaults.
    ^ fsm.!
  
walkBuildTreeFromRightIndex: aTree
    | parameters aTransitionName |
    parameters := aTree children collect: [:x | (self convert: x) negated]. 
    
    aTransitionName := TransitionName new
        action: (isParser ifTrue: [#buildTreeFromIndex] ifFalse: [#buildToken]);
        isRootBuilding: true;
        parameters: parameters;
        symbolOrPair: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.!
  
walkMinus: aTree
    | fsms |
    fsms := aTree children collect: [:child | self walkTree: child].
    ^ FiniteStateMachine minus: fsms.!

walkStar: aTree
    ^(self walkTree: (aTree children first)) star.!

walkString: aTree
    | string name |
    string := aTree symbol.
    ^ isParser
        ifTrue: [
            name := TransitionName new symbolOrPair: string; attributes: self parserDefaults.
            ^ FiniteStateMachine fromParserTransitionSymbol: name.
        ]
        ifFalse: [
            ^ FiniteStateMachine fromScannerCollection: string attributes: self scannerDefaults
        ].!
  
walkEpsilon: aTree
    ^FiniteStateMachine forE.!
  
walkNonTreeBuildingSemanticAction: aTree
    ^ (self walkTree: aTree children first) override: #notTreeBuilding.!
  
walkPlus: aTree
    | fsm |
    fsm := self walkTree: (aTree children first).
    ^ fsm plus.!
   
walkInteger: aTree
    | coll |
    coll := OrderedCollection new.
    coll add: aTree symbol asInteger asCharacter.
    
    ^ FiniteStateMachine fromScannerCollection: coll attributes: self scannerDefaults.!
  
walkSemanticAction: aTree
    | action parameters aTransitionName |
    action := self convert: (aTree children first).
    
    parameters := aTree children rest collect: [:x | self convert: x ]. 
    
    aTransitionName := TransitionName new
        action: action;
        isRootBuilding: false;
        parameters: parameters;
        symbolOrPair: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.! !

!FiniteStateMachineBuilder methodsFor: 'semantic actions'!
 
processTypeNow: parserOrScanner
    isParser := parserOrScanner = #parser.! !

FiniteStateMachineBuilder comment: ''!


!FiniteStateMachineState class methodsFor: 'instance creation'!
   
new

    ^super new initialize! !


!FiniteStateMachineState methodsFor: 'initializing'!
   
initialize

    self
        isFinal: false;
        isInitial: false;
        stateNumber: nil;
        transitions: OrderedCollection new! !

!FiniteStateMachineState methodsFor: 'get/set'!
 
stateNumber: aNumber
    stateNumber := aNumber!
   
stateNumber
    ^stateNumber!
  
transitions
    ^transitions!
  
transitions: aCollection
    transitions := aCollection!
   
isFinal: aBoolean
    isFinal := aBoolean!
 
isFinal
    ^isFinal!
  
isInitial: aBoolean
    isInitial := aBoolean!
 
isInitial
    ^isInitial! !

!FiniteStateMachineState methodsFor: 'printing'!

printOn: aStream
    aStream cr;<<'   state: ';<<stateNumber;<<' '.
    self isInitial 
        ifTrue: [aStream << 'initial;'].
    self isFinal
        ifTrue: [aStream << 'final;'].
    self transitions do:[:transit | transit printOn: aStream.]! !

FiniteStateMachineState comment: ''!



!Transition methodsFor: 'get/set'!
  
attributes: newAttributes
    self transitionName attributes: newAttributes.!
  
goto
    ^goto!

transitionName
    ^transitionName!

attributes
    ^ self transitionName attributes.!
  
transitionName: aTransitionName
    transitionName := aTransitionName!
 
goto: aFiniteStateMachineState
    goto := aFiniteStateMachineState! !

!Transition methodsFor: 'printing'!
  
printOn: aStream
    aStream cr;<<'      ';<<'for: ';<<self transitionName;<<' goto: ';<<goto stateNumber;<<';'.! !

!Transition methodsFor: 'tNameMethods'!
 
override: attribute
   | finalAttributes |
   
    attribute = #treeBuilding ifTrue: [
        ^self isRootBuilding: true
    ].
    
    attribute = #notTreeBuilding ifTrue: [
        ^self isRootBuilding: false
    ].
    
    finalAttributes := ''.
    (attribute = #look) ifTrue: [
        finalAttributes := 'L', self attributes without: $R
    ].
    (attribute = #read) ifTrue: [
        finalAttributes := 'R', self attributes without: $L
    ].
    (attribute = #stack) ifTrue: [
        finalAttributes := 'S', self attributes
    ].
    (attribute = #noStack) ifTrue: [
        finalAttributes := self attributes without: $S
    ].
    (attribute = #node) ifTrue: [
        finalAttributes := 'N', self attributes
    ].
    (attribute = #noNode) ifTrue: [
        finalAttributes := self attributes without: $N
    ].
    (attribute = #keep) ifTrue: [
        finalAttributes := 'K', self attributes
    ].
    (attribute = #noKeep) ifTrue: [
        finalAttributes := self attributes without: $K
    ].

    
    self attributes: ''.
    (finalAttributes includes: $L) ifTrue: [self attributes: self attributes, 'L'].
    (finalAttributes includes: $R) ifTrue: [self attributes: self attributes, 'R'].
    (finalAttributes includes: $N) ifTrue: [self attributes: self attributes, 'N'].
    (finalAttributes includes: $S) ifTrue: [self attributes: self attributes, 'S'].
    (finalAttributes includes: $K) ifTrue: [self attributes: self attributes, 'K'].! !

Transition comment: ''!



!TransitionName methodsFor: 'get/set'!
  
isRootBuilding
    ^isRootBuilding!

action: aSymbol
    action := aSymbol!
 
parameters: aCollection
    parameters := aCollection!
 
attributes
    ^attributes!

parameters
    ^parameters!

symbolOrPair
    ^symbolOrPair!

action
    ^action!

state
    ^state!
  
symbolOrPair: aSymbol
    symbolOrPair := aSymbol!
 
isRootBuilding: aBoolean
    isRootBuilding := aBoolean!
   
attributes: aString
    attributes := aString!
 
state: aState
    state := aState! !

!TransitionName methodsFor: 'queryMethods'!

hasParameters
^ parameters ~= nil!
 
isAction
    ^self action ~= nil!
  
hasAttributes
^ attributes ~= nil! !

!TransitionName methodsFor: 'printing'!

printOn: aStream
    self isAction 
        ifTrue: [
        aStream<< self symbolOrPair;<< ' semanticAction: ';<<'#';<< self action;<<' parameters: ';<<'#';<< self parameters. 
        ^self
        ].
    self hasAttributes 
    ifTrue: [
        aStream<<'#';<< self symbolOrPair;<<' properties: ';<<self attributes.
        ^self
        ].! !

TransitionName comment: ''!
