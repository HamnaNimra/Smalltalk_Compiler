
Object subclass: #FiniteStateMachineBuilder
  instanceVariableNames: 
    ' parser tree map isParser '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Grammar Constructor'
!


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
   
process: text
    tree := parser parse: text.
    self walkTree: tree!

walkTree: aTree
    ^self perform: aTree label with: aTree! !

!FiniteStateMachineBuilder methodsFor: 'tree walking'!

walkCharacter: aTree
    ^ FiniteStateMachine fromScannerCollection: aTree symbol attributes: self scannerDefaults.!
   
walkOr: aTree
    | fsm |
    fsm := aTree children collect: [:child |
        self walkTree: child].
    ^ FiniteStateMachine or: fsm!
 
walkIdentifier: aTree
    | fsm |
    fsm := map at: aTree symbol ifAbsent: [ nil ].
    fsm isNil ifFalse: [^fsm copy].
    fsm := FiniteStateMachine forIdentifier: aTree symbol attributes: (isParser ifTrue: [self parserDefaults] ifFalse: ['RK']).
    ^ fsm.!
   
walkAttributes: aTree
    | fsm |
    fsm := self walkTree: (aTree children first).
    ^fsm override: (aTree children rest collect: [:token | token symbol ]).!
 
walkQuestionMark: aTree
    |fsm|
    fsm := self walkTree: (aTree child:1).
    ^fsm questionMark.!
 
walkConcatenation: aTree
    |fsm|
    fsm := aTree children collect: [:child | self walkTree: child].
    ^ FiniteStateMachine concat: fsm.!

walkTreeBuildingSemanticAction: aTree
    ^ (self walkTree: aTree children first) override: #treeBuilding.!

walkBuildTreeOrTokenFromName: aTree
    | parameters aTransitionName |
    parameters := aTree children collect: [:x | self convert: x].
    
    aTransitionName := TransitionName new
        action: (isParser ifTrue: [#buildTree] ifFalse: [#buildToken]);
        isRootBuilding: isParser;
        parameters: parameters;
        symbol: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.!
   
walkBuildTreeFromLeftIndex: aTree
    | parameters aTransitionName |
    parameters := aTree children collect: [:x | self convert: x ]. 
    
    aTransitionName := TransitionName new
        action: (isParser ifTrue: [#buildTreeFromIndex] ifFalse: [#buildToken]);
        isRootBuilding: true;
        parameters: parameters;
        symbol: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.!
  
walkList: aTree
    "Note: Since none of the walk routines are there (except this one), running will stop as soon
    as a new one that you must implement is reached."
    
    | name fsm outputIndex |
    "If there is too much output, just change the index. If it's 10, you start outputting at fsm 10."
    outputIndex := 1. self halt: 'Task 4: Take a look at the tree...'.
    
    1 to: aTree children size by: 2 do: [:index |
        "Child index must be a walkIdentifier: token and child index+1 must be a finite state machine tree."
        name := (aTree child: index) symbol.
        fsm := self walkTree: (aTree child: index+1).
        (index+1)/2  >= outputIndex ifTrue: [
            Transcript cr; << 'FSM for '; << name; << ' = '; cr; << fsm].
        map at: name put: fsm].!

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
  
walkLook: aTree
    ^(self walkTree: (aTree child: 1)) override: #(#look).!

walkBuildTreeFromRightIndex: aTree
    | parameters aTransitionName |
    parameters := aTree children collect: [:x | (self convert: x) negated]. 
    
    aTransitionName := TransitionName new
        action: (isParser ifTrue: [#buildTreeFromIndex] ifFalse: [#buildToken]);
        isRootBuilding: true;
        parameters: parameters;
        symbol: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.!

walkStar: aTree
    |fsm|
    fsm := self walkTree: (aTree child:1).
    ^fsm star.!
 
walkString: aTree
    | string name |
    string := aTree symbol.
    ^ isParser
        ifTrue: [
            name := TransitionName new symbol: string; attributes: self parserDefaults.
            ^ FiniteStateMachine fromParserTransitionSymbol: name.
        ]
        ifFalse: [
            ^ FiniteStateMachine fromScannerCollection: string attributes: self scannerDefaults
        ].!

walkEpsilon: aTree
    ^FiniteStateMachine epsilon!

walkNonTreeBuildingSemanticAction: aTree
    ^ (self walkTree: aTree children first) override: #notTreeBuilding.!
  
walkPlus: aTree
    |fsm|
    fsm := self walkTree: (aTree child:1).
    ^fsm plus.!
 
walkInteger: aTree
    | fsm |
    fsm := OrderedCollection new.
    fsm add: aTree symbol asInteger asCharacter.
    
    ^ FiniteStateMachine fromScannerCollection: fsm attributes: self scannerDefaults.!
  
walkSemanticAction: aTree
    | action parameters aTransitionName |
    action := self convert: (aTree children first).
    
    parameters := aTree children rest collect: [:x | self convert: x ]. 
    
    aTransitionName := TransitionName new
        action: action;
        isRootBuilding: false;
        parameters: parameters;
        symbol: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.! !

!FiniteStateMachineBuilder methodsFor: 'otherMethods'!
   
scannerDefaults
    ^ 'RK'.!
   
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
    type = #walkSymbol: ifTrue: [
        ^aTree symbol asSymbol
    ].
    type = #walkIdentifier: ifTrue: [
        ^aTree symbol asSymbol
    ].! !

!FiniteStateMachineBuilder methodsFor: 'semantic actions'!
  
processTypeNow: parserOrScanner    
    isParser := parserOrScanner = #parser.! !

FiniteStateMachineBuilder comment: ''!
