
Object subclass: #StudentCompiler
  instanceVariableNames: 
    ' parser tree contextStack code '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Example Parser Users'
!


!StudentCompiler class methodsFor: 'instance creation'!
 
new

    ^super new initialize! !

!StudentCompiler class methodsFor: 'raw tables'!
 
rawParserTables
    "Tables generated from GrammarBuilder class>>parserGrammar"
    ^
#(
   (keywords if for else)
   (ReadaheadTable 1 (for 'RS' 4) (#'(' 'RS' 6) (walkInteger: 'RSN' 68) (walkIdentifier: 'RSN' 7) (if 'RS' 8) (#'}' 'L' 52) (#'-|' 'L' 52))
   (ReadaheadTable 2 (if 'RS' 8) (walkIdentifier: 'RSN' 7) (for 'RS' 4) (walkInteger: 'RSN' 68) (#'(' 'RS' 6) (#'}' 'L' 52) (#'-|' 'L' 52))
   (ReadaheadTable 3 (#'*' 'RS' 11) (#'/' 'RS' 12) (#'+' 'L' 66) (#'-' 'L' 66) (#'<' 'L' 66) (#'>' 'L' 66) (#'==' 'L' 66) (#'?' 'L' 66) (#')' 'L' 66) (#',' 'L' 66) (#';' 'L' 66) (#':' 'L' 66))
   (ReadaheadTable 4 (#'(' 'RS' 13))
   (ReadaheadTable 5 (#'<' 'RS' 14) (#'>' 'RS' 15) (#'==' 'RS' 16) (#'?' 'RS' 17) (#')' 'L' 67) (#',' 'L' 67) (#';' 'L' 67))
   (ReadaheadTable 6 (walkIdentifier: 'RSN' 7) (walkInteger: 'RSN' 68) (#'(' 'RS' 6))
   (ReadaheadTable 7 (#'=' 'RS' 19) (#'(' 'RS' 20) (#'*' 'L' 68) (#'/' 'L' 68) (#'+' 'L' 68) (#'-' 'L' 68) (#'<' 'L' 68) (#'>' 'L' 68) (#'==' 'L' 68) (#'?' 'L' 68) (#')' 'L' 68) (#',' 'L' 68) (#';' 'L' 68) (#':' 'L' 68))
   (ReadaheadTable 8 (#'(' 'RS' 21))
   (ReadaheadTable 9 (#'+' 'RS' 22) (#'-' 'RS' 23) (#'<' 'L' 70) (#'>' 'L' 70) (#'==' 'L' 70) (#'?' 'L' 70) (#')' 'L' 70) (#',' 'L' 70) (#';' 'L' 70) (#':' 'L' 70))
   (ReadaheadTable 10 (#';' 'RS' 71))
   (ReadaheadTable 11 (#'(' 'RS' 6) (walkInteger: 'RSN' 68) (walkIdentifier: 'RSN' 24))
   (ReadaheadTable 12 (#'(' 'RS' 6) (walkInteger: 'RSN' 68) (walkIdentifier: 'RSN' 24))
   (ReadaheadTable 13 (#'(' 'RS' 6) (walkIdentifier: 'RSN' 7) (walkInteger: 'RSN' 68))
   (ReadaheadTable 14 (walkIdentifier: 'RSN' 24) (walkInteger: 'RSN' 68) (#'(' 'RS' 6))
   (ReadaheadTable 15 (walkIdentifier: 'RSN' 24) (walkInteger: 'RSN' 68) (#'(' 'RS' 6))
   (ReadaheadTable 16 (walkIdentifier: 'RSN' 24) (walkInteger: 'RSN' 68) (#'(' 'RS' 6))
   (ReadaheadTable 17 (walkIdentifier: 'RSN' 24) (walkInteger: 'RSN' 68) (#'(' 'RS' 6))
   (ReadaheadTable 18 (#')' 'RS' 72))
   (ReadaheadTable 19 (walkIdentifier: 'RSN' 7) (walkInteger: 'RSN' 68) (#'(' 'RS' 6))
   (ReadaheadTable 20 (#')' 'RS' 79) (#'(' 'RS' 6) (walkIdentifier: 'RSN' 7) (walkInteger: 'RSN' 68))
   (ReadaheadTable 21 (#'(' 'RS' 6) (walkIdentifier: 'RSN' 7) (walkInteger: 'RSN' 68))
   (ReadaheadTable 22 (walkIdentifier: 'RSN' 24) (#'(' 'RS' 6) (walkInteger: 'RSN' 68))
   (ReadaheadTable 23 (walkIdentifier: 'RSN' 24) (#'(' 'RS' 6) (walkInteger: 'RSN' 68))
   (ReadaheadTable 24 (#'(' 'RS' 20) (#'*' 'L' 68) (#'/' 'L' 68) (#'+' 'L' 68) (#'-' 'L' 68) (#'<' 'L' 68) (#'>' 'L' 68) (#'==' 'L' 68) (#'?' 'L' 68) (#')' 'L' 68) (#',' 'L' 68) (#';' 'L' 68) (#':' 'L' 68))
   (ReadaheadTable 25 (#';' 'RS' 34))
   (ReadaheadTable 26 (#'+' 'RS' 22) (#'-' 'RS' 23) (#'<' 'L' 75) (#'>' 'L' 75) (#'==' 'L' 75) (#'?' 'L' 75) (#')' 'L' 75) (#',' 'L' 75) (#';' 'L' 75) (#':' 'L' 75))
   (ReadaheadTable 27 (#'+' 'RS' 22) (#'-' 'RS' 23) (#'<' 'L' 76) (#'>' 'L' 76) (#'==' 'L' 76) (#'?' 'L' 76) (#')' 'L' 76) (#',' 'L' 76) (#';' 'L' 76) (#':' 'L' 76))
   (ReadaheadTable 28 (#'+' 'RS' 22) (#'-' 'RS' 23) (#'<' 'L' 77) (#'>' 'L' 77) (#'==' 'L' 77) (#'?' 'L' 77) (#')' 'L' 77) (#',' 'L' 77) (#';' 'L' 77) (#':' 'L' 77))
   (ReadaheadTable 29 (#'<' 'RS' 14) (#'>' 'RS' 15) (#'==' 'RS' 16) (#':' 'RS' 35))
   (ReadaheadTable 30 (#',' 'RS' 36) (#')' 'RS' 79))
   (ReadaheadTable 31 (#')' 'RS' 37))
   (ReadaheadTable 32 (#'*' 'RS' 11) (#'/' 'RS' 12) (#'+' 'L' 80) (#'-' 'L' 80) (#'<' 'L' 80) (#'>' 'L' 80) (#'==' 'L' 80) (#'?' 'L' 80) (#')' 'L' 80) (#',' 'L' 80) (#';' 'L' 80) (#':' 'L' 80))
   (ReadaheadTable 33 (#'*' 'RS' 11) (#'/' 'RS' 12) (#'+' 'L' 81) (#'-' 'L' 81) (#'<' 'L' 81) (#'>' 'L' 81) (#'==' 'L' 81) (#'?' 'L' 81) (#')' 'L' 81) (#',' 'L' 81) (#';' 'L' 81) (#':' 'L' 81))
   (ReadaheadTable 34 (#'(' 'RS' 6) (walkIdentifier: 'RSN' 7) (walkInteger: 'RSN' 68))
   (ReadaheadTable 35 (#'(' 'RS' 6) (walkIdentifier: 'RSN' 24) (walkInteger: 'RSN' 68))
   (ReadaheadTable 36 (walkIdentifier: 'RSN' 7) (walkInteger: 'RSN' 68) (#'(' 'RS' 6))
   (ReadaheadTable 37 (#'{' 'RS' 41))
   (ReadaheadTable 38 (#';' 'RS' 42))
   (ReadaheadTable 39 (#'<' 'RS' 14) (#'>' 'RS' 15) (#'==' 'RS' 16) (#')' 'L' 82) (#',' 'L' 82) (#';' 'L' 82))
   (ReadaheadTable 40 (#',' 'RS' 36) (#')' 'RS' 79))
   (ReadaheadTable 41 (for 'RS' 4) (walkInteger: 'RSN' 68) (#'(' 'RS' 6) (walkIdentifier: 'RSN' 7) (if 'RS' 8) (#'}' 'L' 52) (#'-|' 'L' 52))
   (ReadaheadTable 42 (walkIdentifier: 'RSN' 7) (walkInteger: 'RSN' 68) (#'(' 'RS' 6))
   (ReadaheadTable 43 (#'}' 'RS' 45))
   (ReadaheadTable 44 (#')' 'RS' 46))
   (ReadaheadTable 45 (else 'RS' 47) (if 'L' 53) (for 'L' 53) (walkInteger: 'L' 53) (walkIdentifier: 'L' 53) (#'(' 'L' 53) (#'}' 'L' 53) (#'-|' 'L' 53))
   (ReadaheadTable 46 (#'{' 'RS' 48))
   (ReadaheadTable 47 (#'{' 'RS' 49))
   (ReadaheadTable 48 (for 'RS' 4) (#'(' 'RS' 6) (walkInteger: 'RSN' 68) (walkIdentifier: 'RSN' 7) (if 'RS' 8) (#'}' 'L' 52) (#'-|' 'L' 52))
   (ReadaheadTable 49 (for 'RS' 4) (#'(' 'RS' 6) (walkInteger: 'RSN' 68) (walkIdentifier: 'RSN' 7) (if 'RS' 8) (#'}' 'L' 52) (#'-|' 'L' 52))
   (ReadaheadTable 50 (#'}' 'RS' 83))
   (ReadaheadTable 51 (#'}' 'RS' 53))
   (ReadbackTable 52 ((Statement 2) 'RSN' 54) ((#'|-' 1) 'L' 96) ((#'{' 41) 'L' 96) ((#'{' 48) 'L' 96) ((#'{' 49) 'L' 96))
   (ReadbackTable 53 ((#'}' 53) 'RS' 84) ((#'}' 45) 'RS' 85))
   (ReadbackTable 54 ((Statement 2) 'RSN' 54) ((#'|-' 1) 'L' 96) ((#'{' 41) 'L' 96) ((#'{' 48) 'L' 96) ((#'{' 49) 'L' 96))
   (ReadbackTable 55 ((#'(' 20) 'RS' 61) ((Expression 40) 'RSN' 86) ((Expression 30) 'RSN' 87))
   (ReadbackTable 56 ((Expression2 32) 'RSN' 97) ((Expression2 33) 'RSN' 97) ((Expression2 3) 'RSN' 97))
   (ReadbackTable 57 ((Expression2 32) 'RSN' 98) ((Expression2 33) 'RSN' 98) ((Expression2 3) 'RSN' 98))
   (ReadbackTable 58 ((Expression0 39) 'RSN' 99) ((Expression0 5) 'RSN' 99) ((Expression0 29) 'RSN' 99))
   (ReadbackTable 59 ((Expression0 39) 'RSN' 100) ((Expression0 5) 'RSN' 100) ((Expression0 29) 'RSN' 100))
   (ReadbackTable 60 ((Expression0 39) 'RSN' 101) ((Expression0 5) 'RSN' 101) ((Expression0 29) 'RSN' 101))
   (ReadbackTable 61 ((walkIdentifier: 24) 'RSN' 103) ((walkIdentifier: 7) 'RSN' 103))
   (ReadbackTable 62 ((Expression1 27) 'RSN' 104) ((Expression1 28) 'RSN' 104) ((Expression1 9) 'RSN' 104) ((Expression1 26) 'RSN' 104))
   (ReadbackTable 63 ((Expression1 27) 'RSN' 105) ((Expression1 28) 'RSN' 105) ((Expression1 9) 'RSN' 105) ((Expression1 26) 'RSN' 105))
   (ReadbackTable 64 ((Expression 40) 'RSN' 86) ((Expression 30) 'RSN' 87))
   (ShiftbackTable 65 1 91)
   (ShiftbackTable 66 1 94)
   (ShiftbackTable 67 1 95)
   (ShiftbackTable 68 1 93)
   (ShiftbackTable 69 1 92)
   (ShiftbackTable 70 1 88)
   (ShiftbackTable 71 2 90)
   (ShiftbackTable 72 3 93)
   (ShiftbackTable 73 2 56)
   (ShiftbackTable 74 2 57)
   (ShiftbackTable 75 2 58)
   (ShiftbackTable 76 2 59)
   (ShiftbackTable 77 2 60)
   (ShiftbackTable 78 3 102)
   (ShiftbackTable 79 1 55)
   (ShiftbackTable 80 2 62)
   (ShiftbackTable 81 2 63)
   (ShiftbackTable 82 5 106)
   (ShiftbackTable 83 11 108)
   (ShiftbackTable 84 10 107)
   (ShiftbackTable 85 6 107)
   (ShiftbackTable 86 1 64)
   (ShiftbackTable 87 1 61)
   (ReduceTable 88 Expression0 (1 'RSN' 5)(2 'RSN' 5)(6 'RSN' 5)(13 'RSN' 5)(17 'RSN' 29)(19 'RSN' 5)(20 'RSN' 5)(21 'RSN' 5)(34 'RSN' 5)(35 'RSN' 39)(36 'RSN' 5)(41 'RSN' 5)(42 'RSN' 5)(48 'RSN' 5)(49 'RSN' 5))
   (ReduceTable 89 Statements (1 'RSN' 65)(41 'RSN' 43)(48 'RSN' 50)(49 'RSN' 51))
   (ReduceTable 90 Statement (1 'RSN' 2)(2 'RSN' 2)(41 'RSN' 2)(48 'RSN' 2)(49 'RSN' 2))
   (ReduceTable 91 Grammar (1 'RSN' 109))
   (ReduceTable 92 Expression2 (1 'RSN' 3)(2 'RSN' 3)(6 'RSN' 3)(13 'RSN' 3)(14 'RSN' 3)(15 'RSN' 3)(16 'RSN' 3)(17 'RSN' 3)(19 'RSN' 3)(20 'RSN' 3)(21 'RSN' 3)(22 'RSN' 32)(23 'RSN' 33)(34 'RSN' 3)(35 'RSN' 3)(36 'RSN' 3)(41 'RSN' 3)(42 'RSN' 3)(48 'RSN' 3)(49 'RSN' 3))
   (ReduceTable 93 Expression3 (1 'RSN' 69)(2 'RSN' 69)(6 'RSN' 69)(11 'RSN' 73)(12 'RSN' 74)(13 'RSN' 69)(14 'RSN' 69)(15 'RSN' 69)(16 'RSN' 69)(17 'RSN' 69)(19 'RSN' 69)(20 'RSN' 69)(21 'RSN' 69)(22 'RSN' 69)(23 'RSN' 69)(34 'RSN' 69)(35 'RSN' 69)(36 'RSN' 69)(41 'RSN' 69)(42 'RSN' 69)(48 'RSN' 69)(49 'RSN' 69))
   (ReduceTable 94 Expression1 (1 'RSN' 9)(2 'RSN' 9)(6 'RSN' 9)(13 'RSN' 9)(14 'RSN' 26)(15 'RSN' 27)(16 'RSN' 28)(17 'RSN' 9)(19 'RSN' 9)(20 'RSN' 9)(21 'RSN' 9)(34 'RSN' 9)(35 'RSN' 9)(36 'RSN' 9)(41 'RSN' 9)(42 'RSN' 9)(48 'RSN' 9)(49 'RSN' 9))
   (ReduceTable 95 Expression (1 'RSN' 10)(2 'RSN' 10)(6 'RSN' 18)(13 'RSN' 25)(19 'RSN' 78)(20 'RSN' 30)(21 'RSN' 31)(34 'RSN' 38)(36 'RSN' 40)(41 'RSN' 10)(42 'RSN' 44)(48 'RSN' 10)(49 'RSN' 10))
   (SemanticTable 96 buildTree: walkList: 89)
   (SemanticTable 97 buildTree: walkMultiply: 92)
   (SemanticTable 98 buildTree: walkDivide: 92)
   (SemanticTable 99 buildTree: walkLess: 88)
   (SemanticTable 100 buildTree: walkGreater: 88)
   (SemanticTable 101 buildTree: walkEqual: 88)
   (SemanticTable 102 buildTree: walkAssign: 95)
   (SemanticTable 103 buildTree: walkSend: 93)
   (SemanticTable 104 buildTree: walkPlus: 94)
   (SemanticTable 105 buildTree: walkMinus: 94)
   (SemanticTable 106 buildTree: walkIf: 95)
   (SemanticTable 107 buildTree: walkIf: 90)
   (SemanticTable 108 buildTree: walkFor: 90)
   (AcceptTable 109))!
   
rawScannerTables
    "Scanner rawScannerTables"

    "EndOfFileCharacter is 256"
    ^

#(
   (ScannerReadaheadTable 1 ('#' 'R' 6) ('{' 'RK' 23) ('}' 'RK' 24) ((256) 'L' 7) ('<' 'RK' 18) ('=' 'RK' 3) ('>' 'RK' 20) (')' 'RK' 9) ('*' 'RK' 10) ('+' 'RK' 11) (',' 'RK' 12) ('-' 'RK' 13) ('(' 'RK' 8) ('/' 'RK' 14) ('0123456789' 'RK' 2) (':' 'RK' 16) (';' 'RK' 17) ('?' 'RK' 21) ('ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 4) ((9 10 12 13) 'R' 5) (' ' 'R' 5))
   (ScannerReadaheadTable 2 ((9 10 12 13 256) 'L' 15) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_+-*/<>=?[]{}()^;#:.$ ' 'L' 15) ('0123456789' 'RK' 2))
   (ScannerReadaheadTable 3 ((9 10 12 13 256) 'L' 19) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789+-*/<>?[]{}()^;#:.$ ' 'L' 19) ('=' 'RK' 25))
   (ScannerReadaheadTable 4 ((9 10 12 13 256) 'L' 22) ('+-*/<>=?[]{}()^;#:.$ ' 'L' 22) ('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 4))
   (ScannerReadaheadTable 5 ((256) 'L' 1) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789+-*/<>=?[]{}()^;#:.$' 'L' 1) ((9 10 12 13) 'R' 5) (' ' 'R' 5))
   (ScannerReadaheadTable 6 ((9 256) 'R' 6) ('=>?ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_abcdefghijklmnopqrstuvwxyz{} #$()*+-./0123456789:;<' 'R' 6) ((10 12 13) 'R' 1))
   (SemanticTable 7 buildToken: '-|' 1)
   (SemanticTable 8 buildToken: '(' 1)
   (SemanticTable 9 buildToken: ')' 1)
   (SemanticTable 10 buildToken: '*' 1)
   (SemanticTable 11 buildToken: '+' 1)
   (SemanticTable 12 buildToken: ',' 1)
   (SemanticTable 13 buildToken: '-' 1)
   (SemanticTable 14 buildToken: '/' 1)
   (SemanticTable 15 buildToken: walkInteger: 1)
   (SemanticTable 16 buildToken: ':' 1)
   (SemanticTable 17 buildToken: ';' 1)
   (SemanticTable 18 buildToken: '<' 1)
   (SemanticTable 19 buildToken: '=' 1)
   (SemanticTable 20 buildToken: '>' 1)
   (SemanticTable 21 buildToken: '?' 1)
   (SemanticTable 22 buildToken: walkIdentifier: 1)
   (SemanticTable 23 buildToken: '{' 1)
   (SemanticTable 24 buildToken: '}' 1)
   (SemanticTable 25 buildToken: '==' 1))! !

!StudentCompiler class methodsFor: 'examples'!
  
walkExample1
    "StudentCompiler walkExample1"
    ^StudentCompiler new compile: 'if (a > b) {a = b; c = d;} else {e = f;}'!
 
walkExample2
    "StudentCompiler walkExample2"
    ^StudentCompiler new compile: 'for (a =1; a< 5; a+1) {b-2;}'! !


!StudentCompiler methodsFor: 'initializing'!
 
initialize
    parser := Parser
        for: self
        parserTables: self class rawParserTables
        scannerTables: self class rawScannerTables.
        
    code:= OrderedCollection new.
    contextStack:=  OrderedCollection new.
    self pushStatementContext.! !

!StudentCompiler methodsFor: 'get/set'!
   
parser: aParser
    parser := aParser!
 
tree
    ^tree!

tree: aTree
    tree := aTree!
 
parser
    ^parser! !

!StudentCompiler methodsFor: 'walk'!
  
compile: text
    tree := parser parse: text.
    self walkTree: tree.
    ^code.!
   
walkTree: aTree
    self perform: (aTree label asSymbol) with: aTree! !

!StudentCompiler methodsFor: 'compilation support'!
 
generate: instruction
    code cr; << instruction!
 
generate: instruction with: operand
    code cr; << instruction; << ' '; << operand! !

!StudentCompiler methodsFor: 'walk support'!
 
emitBranch: opCode backTo: location
    ^self emitInstruction: opCode
        with: (location - self nextInstruction)!

emitInstruction: opCode with: operand
    code add:opCode; add: operand.
    ^code size-1!

emitInstruction: opCode
    code add:opCode.
    ^code size!
  
nextInstruction
    ^code size+1!
  
fixupAllBranches: initUnknown with: a
    |nextUnknown unknown|
    unknown := initUnknown.
    [unknown notNil] whileTrue:[
        nextUnknown := code at: unknown + 1
        self fixupBranch unknown with: a.
        unknown := nextUnknown]!
   
fixupBranch: where with: nextInstruction
    |newOffset|
    newOffset :=nextInstruction - where.
    code at: where + 1 put: newOffset! !

!StudentCompiler methodsFor: 'contextStackMethods'!

pushStatementContext
    contextStack add: #statement!
 
isExpressionContext
    ^contextStack last == #expression!
 
pushExpressionContext
    contextStack add: #expression!
   
isStatementContext
    ^contextStack last == #statement!
   
popContext
    contextStack removeLast! !

!StudentCompiler methodsFor: 'walk details'!
  
walkMultiply: aTree
    self isStatementContext ifTrue: [^self].
    self walkTree: (aTree child: 1).
    self walkTree: (aTree child: 2).
    self emitInstruction: #Multiply.!

walkEqual: aTree
    self isStatementContext ifTrue: [^self].
    self walkTree: (aTree child: 1).
    self walkTree: (aTree child: 2).
    self emitInstruction: #Equal.!
  
walkIdentifier: aTree
    | name|
    self isStatementContext ifTrue: [^self].
    name := aTree symbol.
    self emitInstruction: #Push with: name.!
   
walkFunctionCall: aTree
    aTree children rest do: [:child | self walkTree: child].
    self emitInstruction: 'FUNCTION_CALL' with: (aTree child: 1) symbol!
 
walkDivide: aTree
    self isStatementContext ifTrue: [^self].
    self walkTree: (aTree child: 1).
    self walkTree: (aTree child: 2).
    self emitInstruction: #Divide.!

walkGreater: aTree
    self isStatementContext ifTrue: [^self].
    self walkTree: (aTree child: 1).
    self walkTree: (aTree child: 2).
    self emitInstruction: #Greater.!
  
walkAssign: aTree
    |name expression|
    name := (aTree child: 1) symbol.
    expression := aTree child: 2.
    self pushExpressionContext.
        self walkTree: expression.
    self popContext.
    self isExpressionContext ifTrue: [
        self emitInstruction: #Duplicate].
    self emitInstruction: #Pop with: name!

walkList: aTree
    aTree children isEmpty ifTrue:[
        self isExpressionContext ifTrue:[
            self emitInstruction: #push with: nil.
        ^self]].
    self pushStatementContext.
        aTree children allButLast do: [:child |
            self walkTree: child].
    self popContext.
    self walkTree:(aTree child: aTree children size).!

walkFor: aTree
    |initialExpression booleanExpression incrementExpression body end whileStart fixAtEnd|
    self isExpressionContext ifTrue:[
        self designError: 'Can''t use for loop as expression'.
        ^self].
    initialExpression := aTree child: 1.
    booleanExpression := aTree child: 2.
    incrementExpression :=aTree child: 3.
    body := aTree child: 4.
    self walkTree: initialExpression.
    self pushExpressionContext "For branchIfFalse to work".
        whileStart := self nextInstruction.
        self walkTree: booleanExpression.
    self popContext.
    fixAtEnd := self nextInstruction.
    self emitInstruction: #branchIfFalse with: nil. "to End"
    self walkTree: body.
    self walkTree: incrementExpression.
    self emitBranch: #branch backTo: whileStart.
    end := self nextInstruction.
    self fixupBranch: fixAtEnd with: end.!

walkMinus: aTree
    self isStatementContext ifTrue: [^self].
    self walkTree: (aTree child: 1).
    self walkTree: (aTree child: 2).
    self emitInstruction: #Minus.!
  
walkLess: aTree
    self isStatementContext ifTrue: [^self].
    self walkTree: (aTree child: 1).
    self walkTree: (aTree child: 2).
    self emitInstruction: 'Less'.!
   
walkPlus: aTree
    self isStatementContext ifTrue: [^self].
    self walkTree: (aTree child: 1).
    self walkTree: (aTree child: 2).
    self emitInstruction: #Add.!
 
walkInteger: aTree
    | constant |
    self isStatementContext ifTrue: [^self].
    constant := aTree symbol asInteger.
    self emitInstruction: #Push with: constant.!
   
walkIf: aTree
    |exp then else fixToElse elseStart fixToEnd endStart|
    exp := aTree child: 1.
    then := aTree child: 2.
    else := aTree children size < 3
        ifTrue: [nil]
        ifFalse: [aTree child: 3].
    (else isNil and: [self isExpressionContext]) ifTrue:[
        self error: 'Missing else for if expression'.
        else := then "Make the compiler work"].
        
        
    self pushExpressionContext.
        self walkTree: exp.
    self popContext.
    fixToElse := self emitInstruction: #branchIfFalse with: nil. 
    self walkTree: then.
    else isNil
        ifTrue:[
            elseStart := self nextInstruction.
            self fixupBranch: fixToElse with: elseStart]
        ifFalse:[
            fixToEnd := self emitInstruction: #branch with: nil. 
            elseStart := self nextInstruction. 
            self walkTree: else.
            endStart := self nextInstruction.
            self fixupBranch: fixToElse with: elseStart.
            self fixupBranch: fixToEnd with: endStart].! !

StudentCompiler comment: ''!
