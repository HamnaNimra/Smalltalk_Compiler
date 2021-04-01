
Object subclass: #GrammarBuilder
  instanceVariableNames: 
    ' parser tree grammar map isParser '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Example Parser Users'
!

Object subclass: #Relation
  instanceVariableNames: 
    ' triples '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Example Parser Users'
!

Object subclass: #SampleTranslator
  instanceVariableNames: 
    ' parser tree codeIfCompiler expressionsIfEvaluator compilationOperatorMap evaluationOperatorMap '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Example Parser Users'
!

Object subclass: #StudentCompiler
  instanceVariableNames: 
    ' parser tree contextStack code '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Example Parser Users'
!


!GrammarBuilder class methodsFor: 'instance creation'!
   
new

    ^super new initialize! !

!GrammarBuilder class methodsFor: 'raw tables'!
  
rawParserTables
    "GrammarBuilder rawParserTables"
    ^
#(
   (keywords stack noStack read look node noNode keep noKeep parser scanner super superScanner attribute defaults keywords output optimize terminal nonterminal)
   (ReadaheadTable 1 (scanner 'RS' 161) (superScanner 'RS' 162) (super 'RS' 3) (parser 'RS' 163))
   (ReadaheadTable 2 (walkString: 'RSN' 67) (keywords 'RS' 4) (output 'RS' 5) (attribute 'RS' 6) (optimize 'RS' 7) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 3 (scanner 'RS' 165))
   (ReadaheadTable 4 (walkString: 'RSN' 67) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 5 (walkString: 'RSN' 67) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 6 (defaults 'RS' 14) (terminal 'RS' 15) (nonterminal 'RS' 16))
   (ReadaheadTable 7 (walkString: 'RSN' 67) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 8 (Equals 'RS' 18) (OpenCurly 'RS' 19) (RightArrow 'L' 70))
   (ReadaheadTable 9 (walkString: 'RSN' 67) (walkIdentifier: 'RSN' 67) (#'-|' 'L' 71))
   (ReadaheadTable 10 (RightArrow 'RS' 20))
   (ReadaheadTable 11 (walkString: 'RSN' 67) (walkIdentifier: 'RSN' 67) (#'-|' 'L' 71))
   (ReadaheadTable 12 (walkString: 'RSN' 67) (Dot 'RS' 79) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 13 (Dot 'RS' 80))
   (ReadaheadTable 14 (walkString: 'RSN' 67) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 15 (defaults 'RS' 24))
   (ReadaheadTable 16 (defaults 'RS' 25))
   (ReadaheadTable 17 (Dot 'RS' 81))
   (ReadaheadTable 18 (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkSymbol: 'RSN' 30) (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34) (CloseCurly 'L' 135) (Dot 'L' 135) (CloseRound 'L' 135) (FatRightArrow 'L' 135) (RightArrow 'L' 135))
   (ReadaheadTable 19 (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkSymbol: 'RSN' 30) (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34) (CloseCurly 'L' 135) (Dot 'L' 135) (CloseRound 'L' 135) (FatRightArrow 'L' 135) (RightArrow 'L' 135))
   (ReadaheadTable 20 (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkSymbol: 'RSN' 30) (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34) (CloseCurly 'L' 135) (Dot 'L' 135) (CloseRound 'L' 135) (FatRightArrow 'L' 135) (RightArrow 'L' 135))
   (ReadaheadTable 21 (RightArrow 'RS' 20) (Dot 'RS' 84))
   (ReadaheadTable 22 (walkString: 'RSN' 67) (keywords 'RS' 4) (output 'RS' 5) (attribute 'RS' 6) (optimize 'RS' 7) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 23 (walkString: 'RSN' 67) (Dot 'RS' 85) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 24 (walkString: 'RSN' 67) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 25 (walkString: 'RSN' 67) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 26 (OpenSquare 'RS' 39) (Star 'L' 73) (QuestionMark 'L' 73) (Plus 'L' 73) (And 'L' 73) (Minus 'L' 73) (OpenRound 'L' 73) (OpenCurly 'L' 73) (walkIdentifier: 'L' 73) (walkString: 'L' 73) (walkSymbol: 'L' 73) (walkCharacter: 'L' 73) (walkInteger: 'L' 73) (VerticalBar 'L' 73) (CloseCurly 'L' 73) (Dot 'L' 73) (CloseRound 'L' 73) (FatRightArrow 'L' 73) (RightArrow 'L' 73))
   (ReadaheadTable 27 (Dot 'RS' 87))
   (ReadaheadTable 28 (DotDot 'RS' 40) (OpenSquare 'L' 74) (Star 'L' 74) (QuestionMark 'L' 74) (Plus 'L' 74) (And 'L' 74) (Minus 'L' 74) (OpenRound 'L' 74) (OpenCurly 'L' 74) (walkIdentifier: 'L' 74) (walkString: 'L' 74) (walkSymbol: 'L' 74) (walkCharacter: 'L' 74) (walkInteger: 'L' 74) (VerticalBar 'L' 74) (CloseCurly 'L' 74) (Dot 'L' 74) (CloseRound 'L' 74) (FatRightArrow 'L' 74) (RightArrow 'L' 74))
   (ReadaheadTable 29 (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkSymbol: 'RSN' 30) (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34) (CloseCurly 'L' 135) (Dot 'L' 135) (CloseRound 'L' 135) (FatRightArrow 'L' 135) (RightArrow 'L' 135))
   (ReadaheadTable 30 (OpenSquare 'RS' 42) (Star 'L' 82) (QuestionMark 'L' 82) (Plus 'L' 82) (And 'L' 82) (Minus 'L' 82) (OpenRound 'L' 82) (OpenCurly 'L' 82) (walkIdentifier: 'L' 82) (walkString: 'L' 82) (walkSymbol: 'L' 82) (walkCharacter: 'L' 82) (walkInteger: 'L' 82) (RightArrow 'L' 82) (Dot 'L' 82) (VerticalBar 'L' 82) (CloseCurly 'L' 82) (CloseRound 'L' 82) (FatRightArrow 'L' 82))
   (ReadaheadTable 31 (QuestionMark 'RS' 89) (Minus 'RS' 43) (Star 'RS' 90) (Plus 'RS' 91) (And 'RS' 44) (OpenRound 'L' 76) (OpenCurly 'L' 76) (walkIdentifier: 'L' 76) (walkString: 'L' 76) (walkSymbol: 'L' 76) (walkCharacter: 'L' 76) (walkInteger: 'L' 76) (VerticalBar 'L' 76) (CloseCurly 'L' 76) (Dot 'L' 76) (CloseRound 'L' 76) (FatRightArrow 'L' 76) (RightArrow 'L' 76))
   (ReadaheadTable 32 (VerticalBar 'RS' 45) (CloseCurly 'L' 77) (Dot 'L' 77) (CloseRound 'L' 77) (FatRightArrow 'L' 77) (RightArrow 'L' 77))
   (ReadaheadTable 33 (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkSymbol: 'RSN' 30) (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34) (VerticalBar 'L' 78) (CloseCurly 'L' 78) (Dot 'L' 78) (CloseRound 'L' 78) (FatRightArrow 'L' 78) (RightArrow 'L' 78))
   (ReadaheadTable 34 (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkSymbol: 'RSN' 30) (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34) (CloseCurly 'L' 135) (Dot 'L' 135) (CloseRound 'L' 135) (FatRightArrow 'L' 135) (RightArrow 'L' 135))
   (ReadaheadTable 35 (CloseCurly 'RS' 94))
   (ReadaheadTable 36 (FatRightArrow 'RS' 48) (RightArrow 'L' 54) (Dot 'L' 54))
   (ReadaheadTable 37 (walkString: 'RSN' 67) (Dot 'RS' 95) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 38 (walkString: 'RSN' 67) (Dot 'RS' 96) (walkIdentifier: 'RSN' 67))
   (ReadaheadTable 39 (keep 'RSN' 86) (noNode 'RSN' 86) (noStack 'RSN' 86) (CloseSquare 'RS' 97) (read 'RSN' 86) (look 'RSN' 86) (stack 'RSN' 86) (node 'RSN' 86) (noKeep 'RSN' 86))
   (ReadaheadTable 40 (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75))
   (ReadaheadTable 41 (CloseCurly 'RS' 99))
   (ReadaheadTable 42 (walkString: 'RSN' 67) (walkSymbol: 'RSN' 88) (walkIdentifier: 'RSN' 67) (walkCharacter: 'RSN' 75) (CloseSquare 'RS' 100) (walkInteger: 'RSN' 75))
   (ReadaheadTable 43 (walkSymbol: 'RSN' 30) (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkIdentifier: 'RSN' 67) (walkCharacter: 'RSN' 75) (OpenRound 'RS' 34) (walkInteger: 'RSN' 75))
   (ReadaheadTable 44 (walkString: 'RSN' 67) (walkSymbol: 'RSN' 30) (OpenCurly 'RS' 29) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34) (walkInteger: 'RSN' 75))
   (ReadaheadTable 45 (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkSymbol: 'RSN' 30) (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34))
   (ReadaheadTable 46 (walkString: 'RSN' 67) (OpenCurly 'RS' 29) (walkSymbol: 'RSN' 30) (walkInteger: 'RSN' 75) (walkCharacter: 'RSN' 75) (walkIdentifier: 'RSN' 67) (OpenRound 'RS' 34) (VerticalBar 'L' 92) (CloseCurly 'L' 92) (Dot 'L' 92) (CloseRound 'L' 92) (FatRightArrow 'L' 92) (RightArrow 'L' 92))
   (ReadaheadTable 47 (CloseRound 'RS' 93))
   (ReadaheadTable 48 (Minus 'RS' 52) (walkString: 'RSN' 67) (walkSymbol: 'RSN' 30) (walkIdentifier: 'RSN' 67) (Plus 'RS' 53) (walkInteger: 'RSN' 104))
   (ReadaheadTable 49 (keep 'RSN' 86) (noNode 'RSN' 86) (noStack 'RSN' 86) (CloseSquare 'RS' 97) (read 'RSN' 86) (look 'RSN' 86) (stack 'RSN' 86) (node 'RSN' 86) (noKeep 'RSN' 86))
   (ReadaheadTable 50 (walkString: 'RSN' 67) (walkSymbol: 'RSN' 88) (walkIdentifier: 'RSN' 67) (walkCharacter: 'RSN' 75) (CloseSquare 'RS' 100) (walkInteger: 'RSN' 75))
   (ReadaheadTable 51 (VerticalBar 'RS' 45) (CloseCurly 'L' 102) (Dot 'L' 102) (CloseRound 'L' 102) (FatRightArrow 'L' 102) (RightArrow 'L' 102))
   (ReadaheadTable 52 (walkInteger: 'RSN' 106))
   (ReadaheadTable 53 (walkInteger: 'RSN' 104))
   (ReadbackTable 54 ((TreeBuildingOptions 54) 'RSN' 107) ((Alternation 36) 'RSN' 108))
   (ReadbackTable 55 ((Defaults 164) 'RSN' 55) ((GrammarType 2) 'RSN' 122))
   (ReadbackTable 56 ((Macro 9) 'RSN' 56) ((Production 11) 'RSN' 56) ((GrammarType 2) 'L' 134) ((Defaults 164) 'L' 134))
   (ReadbackTable 57 ((RepetitionOption 46) 'RSN' 57) ((RepetitionOption 33) 'RSN' 148))
   (ReadbackTable 58 ((OpenSquare 39) 'RS' 110) ((Attribute 49) 'RSN' 58))
   (ReadbackTable 59 ((OpenSquare 42) 'RS' 82) ((SemanticActionParameter 50) 'RSN' 59))
   (ReadbackTable 60 ((Plus 53) 'RS' 158) ((FatRightArrow 48) 'L' 158))
   (ReadbackTable 61 ((keywords 4) 'RS' 136) ((Name 12) 'RSN' 61))
   (ReadbackTable 62 ((LeftPart 10) 'RSN' 142) ((RightPart 21) 'RSN' 62))
   (ReadbackTable 63 ((Name 23) 'RSN' 63) ((defaults 14) 'RS' 111))
   (ReadbackTable 64 ((Name 37) 'RSN' 64) ((defaults 24) 'RS' 112))
   (ReadbackTable 65 ((Name 38) 'RSN' 65) ((defaults 25) 'RS' 113))
   (ReadbackTable 66 ((Concatenation 51) 'RSN' 109) ((Concatenation 32) 'RSN' 156))
   (ShiftbackTable 67 1 119)
   (ShiftbackTable 68 1 55)
   (ShiftbackTable 69 1 126)
   (ShiftbackTable 70 1 133)
   (ShiftbackTable 71 1 56)
   (ShiftbackTable 72 2 126)
   (ShiftbackTable 73 1 114)
   (ShiftbackTable 74 1 128)
   (ShiftbackTable 75 1 130)
   (ShiftbackTable 76 1 118)
   (ShiftbackTable 77 1 129)
   (ShiftbackTable 78 1 115)
   (ShiftbackTable 79 2 61)
   (ShiftbackTable 80 3 137)
   (ShiftbackTable 81 3 138)
   (ShiftbackTable 82 1 139)
   (ShiftbackTable 83 1 140)
   (ShiftbackTable 84 2 62)
   (ShiftbackTable 85 2 63)
   (ShiftbackTable 86 1 125)
   (ShiftbackTable 87 4 144)
   (ShiftbackTable 88 1 121)
   (ShiftbackTable 89 2 145)
   (ShiftbackTable 90 2 146)
   (ShiftbackTable 91 2 147)
   (ShiftbackTable 92 1 57)
   (ShiftbackTable 93 3 128)
   (ShiftbackTable 94 4 149)
   (ShiftbackTable 95 2 64)
   (ShiftbackTable 96 2 65)
   (ShiftbackTable 97 1 58)
   (ShiftbackTable 98 3 153)
   (ShiftbackTable 99 3 154)
   (ShiftbackTable 100 1 59)
   (ShiftbackTable 101 3 155)
   (ShiftbackTable 102 2 66)
   (ShiftbackTable 103 1 157)
   (ShiftbackTable 104 1 60)
   (ShiftbackTable 105 1 159)
   (ShiftbackTable 106 2 160)
   (ShiftbackTable 107 3 141)
   (ShiftbackTable 108 1 141)
   (ShiftbackTable 109 1 66)
   (ShiftbackTable 110 1 152)
   (ShiftbackTable 111 1 143)
   (ShiftbackTable 112 2 150)
   (ShiftbackTable 113 2 151)
   (ReduceTable 114 Expression (18 'RSN' 31)(19 'RSN' 31)(20 'RSN' 31)(29 'RSN' 31)(33 'RSN' 31)(34 'RSN' 31)(43 'RSN' 101)(44 'RSN' 101)(45 'RSN' 31)(46 'RSN' 31))
   (ReduceTable 115 Concatenation (18 'RSN' 32)(19 'RSN' 32)(20 'RSN' 32)(29 'RSN' 32)(34 'RSN' 32)(45 'RSN' 51))
   (ReduceTable 116 LeftPart (2 'RSN' 10)(9 'RSN' 10)(11 'RSN' 10)(164 'RSN' 10))
   (ReduceTable 117 Macro (2 'RSN' 9)(9 'RSN' 9)(11 'RSN' 9)(164 'RSN' 9))
   (ReduceTable 118 RepetitionOption (18 'RSN' 33)(19 'RSN' 33)(20 'RSN' 33)(29 'RSN' 33)(33 'RSN' 46)(34 'RSN' 33)(45 'RSN' 33)(46 'RSN' 46))
   (ReduceTable 119 Name (2 'RSN' 8)(4 'RSN' 12)(5 'RSN' 13)(7 'RSN' 17)(9 'RSN' 8)(11 'RSN' 8)(12 'RSN' 12)(14 'RSN' 23)(18 'RSN' 74)(19 'RSN' 74)(20 'RSN' 74)(164 'RSN' 8)(23 'RSN' 23)(24 'RSN' 37)(25 'RSN' 38)(29 'RSN' 74)(33 'RSN' 74)(34 'RSN' 74)(37 'RSN' 37)(38 'RSN' 38)(42 'RSN' 88)(43 'RSN' 74)(44 'RSN' 74)(45 'RSN' 74)(46 'RSN' 74)(48 'RSN' 103)(50 'RSN' 88))
   (ReduceTable 120 Defaults (2 'RSN' 164)(164 'RSN' 164))
   (ReduceTable 121 SemanticActionParameter (42 'RSN' 50)(50 'RSN' 50))
   (ReduceTable 122 Grammar (1 'RSN' 166))
   (ReduceTable 123 TreeBuildingOptions (48 'RSN' 54))
   (ReduceTable 124 Production (2 'RSN' 11)(9 'RSN' 11)(11 'RSN' 11)(164 'RSN' 11))
   (ReduceTable 125 Attribute (39 'RSN' 49)(49 'RSN' 49))
   (ReduceTable 126 GrammarType (1 'RSN' 2))
   (ReduceTable 127 Rules (2 'RSN' 68)(164 'RSN' 68))
   (ReduceTable 128 Primary (18 'RSN' 26)(19 'RSN' 26)(20 'RSN' 26)(29 'RSN' 26)(33 'RSN' 26)(34 'RSN' 26)(43 'RSN' 26)(44 'RSN' 26)(45 'RSN' 26)(46 'RSN' 26))
   (ReduceTable 129 Alternation (18 'RSN' 27)(19 'RSN' 35)(20 'RSN' 36)(29 'RSN' 41)(34 'RSN' 47))
   (ReduceTable 130 Byte (18 'RSN' 28)(19 'RSN' 28)(20 'RSN' 28)(29 'RSN' 28)(33 'RSN' 28)(34 'RSN' 28)(40 'RSN' 98)(42 'RSN' 88)(43 'RSN' 28)(44 'RSN' 28)(45 'RSN' 28)(46 'RSN' 28)(50 'RSN' 88))
   (ReduceTable 131 RightPart (10 'RSN' 21)(21 'RSN' 21))
   (ReduceTable 132 SemanticAction (18 'RSN' 83)(19 'RSN' 83)(20 'RSN' 83)(29 'RSN' 83)(33 'RSN' 83)(34 'RSN' 83)(43 'RSN' 83)(44 'RSN' 83)(45 'RSN' 83)(46 'RSN' 83)(48 'RSN' 105))
   (SemanticTable 133 buildTree: walkLeftPart: 116)
   (SemanticTable 134 buildTree: walkGrammar: 127)
   (SemanticTable 135 buildTree: walkEpsilon: 129)
   (SemanticTable 136 buildTree: walkKeywords: 120)
   (SemanticTable 137 buildTree: walkOutput: 120)
   (SemanticTable 138 buildTree: walkOptimize: 120)
   (SemanticTable 139 buildTree: walkSemanticAction: 132)
   (SemanticTable 140 buildTree: walkNonTreeBuildingSemanticAction: 114)
   (SemanticTable 141 buildTree: walkRightPart: 131)
   (SemanticTable 142 buildTree: walkProduction: 124)
   (SemanticTable 143 buildTree: walkAttributeDefaults: 120)
   (SemanticTable 144 buildTree: walkMacro: 117)
   (SemanticTable 145 buildTree: walkQuestionMark: 118)
   (SemanticTable 146 buildTree: walkStar: 118)
   (SemanticTable 147 buildTree: walkPlus: 118)
   (SemanticTable 148 buildTree: walkConcatenation: 115)
   (SemanticTable 149 buildTree: walkLeftPartWithLookahead: 116)
   (SemanticTable 150 buildTree: walkAttributeTerminalDefaults: 120)
   (SemanticTable 151 buildTree: walkAttributeNonterminalDefaults: 120)
   (SemanticTable 152 buildTree: walkAttributes: 114)
   (SemanticTable 153 buildTree: walkDotDot: 128)
   (SemanticTable 154 buildTree: walkLook: 128)
   (SemanticTable 155 buildTree: walkMinus: 118)
   (SemanticTable 156 buildTree: walkOr: 129)
   (SemanticTable 157 buildTree: walkBuildTreeOrTokenFromName: 123)
   (SemanticTable 158 buildTree: walkBuildTreeFromLeftIndex: 123)
   (SemanticTable 159 buildTree: walkTreeBuildingSemanticAction: 123)
   (SemanticTable 160 buildTree: walkBuildTreeFromRightIndex: 123)
   (SemanticTable 161 processTypeNow: Scanner 69)
   (SemanticTable 162 processTypeNow: SuperScanner 69)
   (SemanticTable 163 processTypeNow: Parser 69)
   (SemanticTable 164 processAndDiscardDefaultsNow 22)
   (SemanticTable 165 processTypeNow: SuperScanner 72)
   (AcceptTable 166))!
   
rawScannerTables
    "GrammarBuilder rawScannerTables"
    ^
#(
   (ScannerReadaheadTable 1 (']' 'RK' 35) ('/' 'R' 10) ('{' 'RK' 36) ('}' 'RK' 37) ('"' 'R' 11) ('$' 'R' 12) ((256) 'L' 21) ('ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 6) ('[' 'RK' 33) ('(' 'RK' 23) (')' 'RK' 24) ('*' 'RK' 25) ('+' 'RK' 26) ('-' 'RK' 2) ('&' 'RK' 22) ('.' 'RK' 3) ((9 10 12 13) 'R' 7) (' ' 'R' 7) ('0123456789' 'RK' 4) ('=' 'RK' 5) ('?' 'RK' 31) ('#' 'R' 8) ('|' 'RK' 34) ('''' 'R' 9))
   (ScannerReadaheadTable 2 ((9 10 12 13 96 147 148 256) 'L' 27) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<[]{}()^;#:.$''" ' 'L' 27) ('>' 'RK' 38))
   (ScannerReadaheadTable 3 ((9 10 12 13 96 147 148 256) 'L' 28) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:$''" ' 'L' 28) ('.' 'RK' 39))
   (ScannerReadaheadTable 4 ((9 10 12 13 96 147 148 256) 'L' 29) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!!,+-/\*~=@%&?|<>[]{}()^;#:.$''" ' 'L' 29) ('0123456789' 'RK' 4))
   (ScannerReadaheadTable 5 ((9 10 12 13 96 147 148 256) 'L' 30) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<[]{}()^;#:.$''" ' 'L' 30) ('>' 'RK' 40))
   (ScannerReadaheadTable 6 ((9 10 12 13 96 147 148 256) 'L' 32) ('!!,+-/\*~=@%&?|<>[]{}()^;#.$''" ' 'L' 32) ('0123456789:ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 6))
   (ScannerReadaheadTable 7 ((96 147 148 256) 'L' 1) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$''"' 'L' 1) ((9 10 12 13) 'R' 7) (' ' 'R' 7))
   (ScannerReadaheadTable 8 ('"' 'R' 14) ('''' 'R' 15) ('ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 13))
   (ScannerReadaheadTable 9 ((256) 'LK' 42) ('''' 'R' 16) ((9 10 12 13 96 147 148) 'RK' 9) (' !!"#$%&()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 9))
   (ScannerReadaheadTable 10 ((9 10 12 13) 'L' 44) (' ' 'L' 44) ((96 147 148 256) 'LK' 44) ('=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_\abcdefghijklmnopqrstuvwxyz{|}~!!"#$%&''()*+,-.0123456789:;<' 'LK' 44) ('/' 'R' 17))
   (ScannerReadaheadTable 11 ((256) 'LK' 45) ('"' 'R' 18) ((9 10 12 13 96 147 148) 'RK' 11) (' !!#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 11))
   (ScannerReadaheadTable 12 ((9 10 12 13 96 147 148) 'RK' 46) (' !!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 46))
   (ScannerReadaheadTable 13 ((9 10 12 13 96 147 148 256) 'L' 41) ('!!,+-/\*~=@%&?|<>[]{}()^;#.$''" ' 'L' 41) ('0123456789:ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 13))
   (ScannerReadaheadTable 14 ((256) 'LK' 47) ('"' 'R' 19) ((9 10 12 13 96 147 148) 'RK' 14) (' !!#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 14))
   (ScannerReadaheadTable 15 ((256) 'LK' 48) ('''' 'R' 20) ((9 10 12 13 96 147 148) 'RK' 15) (' !!"#$%&()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~' 'RK' 15))
   (ScannerReadaheadTable 16 ((9 10 12 13 96 147 148 256) 'L' 43) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$" ' 'L' 43) ('''' 'RK' 9))
   (ScannerReadaheadTable 17 ((9 96 147 148) 'R' 17) ('=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~ !!"#$%&''()*+,-./0123456789:;<' 'R' 17) ((256) 'LK' 1) ((10 12 13) 'R' 1))
   (ScannerReadaheadTable 18 ((9 10 12 13 96 147 148 256) 'L' 43) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$'' ' 'L' 43) ('"' 'RK' 11))
   (ScannerReadaheadTable 19 ((9 10 12 13 96 147 148 256) 'L' 41) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$'' ' 'L' 41) ('"' 'RK' 14))
   (ScannerReadaheadTable 20 ((9 10 12 13 96 147 148 256) 'L' 41) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789!!,+-/\*~=@%&?|<>[]{}()^;#:.$" ' 'L' 41) ('''' 'RK' 15))
   (SemanticTable 21 buildToken: '-|' 1)
   (SemanticTable 22 buildToken: And 1)
   (SemanticTable 23 buildToken: OpenRound 1)
   (SemanticTable 24 buildToken: CloseRound 1)
   (SemanticTable 25 buildToken: Star 1)
   (SemanticTable 26 buildToken: Plus 1)
   (SemanticTable 27 buildToken: Minus 1)
   (SemanticTable 28 buildToken: Dot 1)
   (SemanticTable 29 buildToken: walkInteger: 1)
   (SemanticTable 30 buildToken: Equals 1)
   (SemanticTable 31 buildToken: QuestionMark 1)
   (SemanticTable 32 buildToken: walkIdentifier: 1)
   (SemanticTable 33 buildToken: OpenSquare 1)
   (SemanticTable 34 buildToken: VerticalBar 1)
   (SemanticTable 35 buildToken: CloseSquare 1)
   (SemanticTable 36 buildToken: OpenCurly 1)
   (SemanticTable 37 buildToken: CloseCurly 1)
   (SemanticTable 38 buildToken: RightArrow 1)
   (SemanticTable 39 buildToken: DotDot 1)
   (SemanticTable 40 buildToken: FatRightArrow 1)
   (SemanticTable 41 buildToken: walkSymbol: 1)
   (SemanticTable 42 syntaxError: 'missing end quote for single quoted string' 43)
   (SemanticTable 43 buildToken: walkString: 1)
   (SemanticTable 44 syntaxError: '// is a comment, / alone is not valid' 1)
   (SemanticTable 45 syntaxError: 'missing end quote for double quoted string' 43)
   (SemanticTable 46 buildToken: walkCharacter: 1)
   (SemanticTable 47 syntaxError: 'missing end quote for double quoted string' 41)
   (SemanticTable 48 syntaxError: 'missing end quote for single quoted string' 41))! !

!GrammarBuilder class methodsFor: 'examples'!

promptForGrammar
    "GrammarBuilder promptForGrammar"
    | fileName file |
    fileName :=  FileDialog promptTitle: 'File of finite state machines'.
    fileName isNil ifTrue: [^self]. "User cancelled"
    Transcript cr; cr; << 'Building grammar for file '; << fileName printString.
    file := File pathNameReadOnly: fileName.
    ^GrammarBuilder new process: file contents! !


!GrammarBuilder methodsFor: 'initializing'!
 
initialize
    parser := Parser
        for: self
        parserTables: self class rawParserTables
        scannerTables: self class rawScannerTables.
    grammar := Grammar new.
    map := Dictionary new.! !

!GrammarBuilder methodsFor: 'processing'!
 
lookForToken: aTree
    ((aTree child: 1) class) = Token ifTrue: [
        ^ (aTree child: 1) symbol
    ].    
    ^ self lookForToken: (aTree child: 1)!
  
walkTree: aTree
    ^self perform: aTree label with: aTree!

scannerDefaults
    ^ 'RK'.!
   
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
    ].!
  
parserDefaults
    ^ 'RS'.!

process: text
    tree := parser parse: text.
    self walkTree: tree! !

!GrammarBuilder methodsFor: 'semantic actions'!
   
processTypeNow: parserOrScanner    
    self halt: 'Look at the parameter? It tells you if you are processing a parser or a scanner'! !

!GrammarBuilder methodsFor: 'sponsored semantic actions'!
   
processDefaultNow
    "Pick up the tree just built containing either the attributes, keywords, optimize, and output tree,
    and process it..."
    self walkTree: parser treeStack last!
   
processAndDiscardDefaultsNow
    "Pick up the tree just built containing either the attributes, keywords, optimize, and output tree,
    process it, and remove it from the tree stack..."
    | tree |
    tree := parser treeStack last. self walkTree: tree.
    parser treeStack removeLast; addLast: nil.! !

!GrammarBuilder methodsFor: 'walk routines - sponsored'!
  
walkAttributeTerminalDefaults: aTree
    "Note: This walk routine is initiated by #processAndDiscardDefaultsNow which subsequently eliminates the tree to prevent generic tree walking later..."
    | attributes |
    attributes := aTree children collect: [:child | child symbol].
    "grammar grammarSuppliedTerminalAttributeDefaults: attributes."
    Transcript cr; << 'The terminal attributes are '; << attributes!

walkAttributeNonterminalDefaults: aTree
    "Note: This walk routine is initiated by #processAndDiscardDefaultsNow which subsequently eliminates the tree to prevent generic tree walking later..."
    | attributes |
    attributes := aTree children collect: [:child | child symbol].
    "grammar grammarSuppliedNonterminalAttributeDefaults: attributes."
    Transcript cr; << 'The nonterminal attributes are '; << attributes!
   
walkKeywords: aTree
    "Note: This walk routine is initiated by #processAndDiscardDefaultsNow which subsequently eliminates the tree to prevent generic tree walking later..."
    | keywords |
    keywords := aTree children collect: [:child | child symbol].
    "grammar keywordsForParser: keywords."
    Transcript cr; << 'The keywords are '; << keywords!
   
walkOutput: aTree
    "Note: This walk routine is initiated by #processAndDiscardDefaultsNow which subsequently eliminates the tree to prevent generic tree walking later..."
    | outputLanguage |
    outputLanguage := aTree children first symbol.
    "grammar outputLanguage: outputLanguage asLowercase asSymbol."
    Transcript cr; << 'The output language is '; << outputLanguage!
 
walkAttributeDefaults: aTree
    "Note: This walk routine is initiated by #processAndDiscardDefaultsNow which subsequently eliminates the tree to prevent generic tree walking later..."
    | attributes |
    attributes := aTree children collect: [:child | child symbol].
    "grammar grammarSuppliedTerminalAttributeDefaults: attributes."
    Transcript cr; << 'The terminal attributes are '; << attributes!

walkOptimize: aTree
    "Note: This walk routine is initiated by #processAndDiscardDefaultsNow which subsequently eliminates the tree to prevent generic tree walking later..."
    | optimizationString |
    aTree children do: [:child |
        optimizationString := child symbol asLowercase.
        optimizationString = 'chain reductions' ifTrue: ["grammar optimizeChainReductions: true"] ifFalse: [
        optimizationString = 'keep nonterminal transitions' ifTrue: ["grammar keepNonterminalTransitions: true"] ifFalse: [
        self halt: 'The optimization options allowed are ''chain reductions'' and ''keep nonterminal transitions''.']].

        Transcript cr; << 'Requested optimization "'; << optimizationString; << '"']! !

!GrammarBuilder methodsFor: 'tree walking'!
   
walkCharacter: aTree
    ^ FiniteStateMachine fromScannerCollection: aTree symbol attributes: self scannerDefaults.!
   
walkAnd: aTree
     | fsm1 fsm2 |
    fsm1 := self walkTree: (aTree child: 1).
    fsm2 := self walkTree: (aTree child: 2).
    ^fsm1 and: fsm2!

walkAttributes: aTree
    | fsm |
    fsm := self walkTree: (aTree children first).
    ^fsm override: (aTree children rest collect: [:token | token symbol ]).!
 
walkOr: aTree
    ^ FiniteStateMachine or: (aTree children collect: [:child | self walkTree: child]).!
 
walkQuestionMark: aTree
    ^ (self walkTree: (aTree children first)) questionMark.!
   
walkIdentifier: aTree
    | name |
    
    (grammar macros includesKey: aTree symbol) ifTrue: [
        ^ (grammar macros at: aTree symbol) copy
    ].
    name := TransitionName new symbolOrPair: aTree symbol.
    isParser ifTrue: [
        (grammar nonTerminals includes: aTree) ifTrue: [
            name attributes: self parserNonTerminalDefaults
        ]
        ifFalse: [
            name attributes: self parserTerminalDefaults
        ].
        ^ FiniteStateMachine fromParserTransitionSymbol: name
    ].
    name attributes: self scannerDefaults.
    self halt.
    ^ FiniteStateMachine fromParserTransitionSymbol: name!

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
        symbolOrPair: aTree label.
    ^FiniteStateMachine fromParserTransitionSymbol: aTransitionName.!
  
walkMinus: aTree
    | fsms |
    fsms := aTree children collect: [:child | self walkTree: child].
    ^ FiniteStateMachine minus: fsms.!

walkGrammar: aTree
    aTree children do: [:child |
            (child label = #walkProduction:) ifTrue: [
                grammar nonTerminals add: (self lookForToken: child).
            ].
        ].!

walkStar: aTree
    ^(self walkTree: (aTree children first)) star.!

walkProduction: aTree
    | leftPartArray rightPartFSM production |

    leftPartArray := self walkTree: (aTree child: 1).
    rightPartFSM := self walkTree: (aTree child: 2). 

    production := Production new
        name: leftPartArray first;
        lookahead: leftPartArray second;
        fsm: rightPartFSM.
        
    grammar addProduction: production.
    
    ^ nil!
  
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
  
walkLeftPartWithLookahead: aTree
    | token fsm |
    token := aTree child: 1.
    fsm := self walkTree: (aTree child: 2).
    ^ Array with: token symbol with: fsm allInitialStateTransitionSymbol!
   
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

GrammarBuilder comment: ''!


!Relation class methodsFor: 'instance creation'!
  
new

    ^super new initialize! !

!Relation class methodsFor: 'examples'!
  
example3
        "Relation example3"!
  
example1
    "Relation example1"
        | collection relation bracket1 |
        "First, build a relation."
        collection := #((2 < 3) (1 = 1) (3 > 1) (2 < 4)(1 < 5) (5 < 6) (2 < 5)).
        relation := Relation new.
        collection do: [:triple | relation addTriple: triple].
        Transcript cr; << 'Let relation = '; << collection.
        Transcript cr; << 'The created relation is '.
        relation do: [:a :b :c |Transcript cr; << a; space; << b; space; << c; space]!

example2
        "Relation example2"
        | collection relation |
        "First, build a relation."
        collection := #((2 < 3) (1 = 1) (3 > 1) (2 < 4)(1 < 5) (5 < 6) (2 < 5)).
        relation := Relation new.
        collection do: [:triple | relation addTriple: triple].

        Transcript cr; << 'Let relation = '; << collection.
        Transcript cr; << 'Starting from {1 2 3},'.
            relation from: #(1 2 3) do: [:relationship :subrelation |                 
                Transcript cr; << 'There is a relationship '; << relationship; 
                    << ' with subrelation'; cr; tab.
                subrelation do: [:triple |Transcript space; << triple]]! !

!Relation class methodsFor: 'performMethods'!
 
using: relation1 and: relation2 performCollectionOneStep: aCollection
    | newRelation |
     newRelation := self using: relation1 and: 2 performRelationOneStep: aCollection.
     ^newRelation allTo!
 
using: relation performRelationOneStep: items
    "Builds new triples by applying 'relation' ONCE to each item in items. 
    Returns the triples in a totally new relation."
    | newRelation tos |
    newRelation := Relation new. tos = OrderedCollection new.
    
    relation from: items do: [:relationship :subrelation |
        subrelation do: [:triple | tos addifAbsent: triple third]].

    relation from: tos do: [:relationship :subrelation |
        subrelation do: [:triple | newRelation addTriple: triple]].

    ^newRelation!

using: relation1 and: relation2 performItemStep: items
    | newRelation |
     newRelation := self using: relation1 and: 2 performRelationOneStep: items.
     ^newRelation allTo!
  
using: relation1 and: relation2 performRelationOneStep: items
    "Builds new triples by applying 'relation1' ONCE to each item in items and 'relation2' ONCE to each item in items. 
    Returns the triples in a totally new relation."
    | newRelation tos |
    newRelation := Relation new. tos = OrderedCollection new.
    
    relation1 from: items do: [:relationship :subrelation |
        subrelation do: [:triple | tos addifAbsent: triple third]].
    
    relation2 from: items do: [:relationship :subrelation |
        subrelation do: [:triple | tos addifAbsent: triple third]].

    relation2 from: tos do: [:relationship :subrelation |
        subrelation do: [:triple | newRelation addTriple: triple]].
    
    ^newRelation!
  
using: relation performRelationStar: items
    | newRelation |
    newRelation := Relation new.
    workingCollection := OrderedCollection new addAllIfAbsent: items.
    workingCollection do: [:item |
        relation from: (OrderedCollection with: item) do: [:relationship :subrelation |
        subrelation do: [:triple | 
            workingCollection addIfAbsent: triples last.
            newRelation addTriple: triple]]].

    ^newRelation!

using: relation performCollectionOneStep: aCollection
    | newRelation |
     newRelation := self using: relation performRelationOneStep: aCollection.
     ^newRelation allTo!
 
using: relation performItemOneStep: items
    | newRelation |
     newRelation := self using: relation performRelationOneStep: items.
     ^newRelation allTo!
   
using: relation performItemStar: items
    | newRelation |
    newRelation := self using: relation performRelationStar: items.
    ^newRelation allTo addAllIfAbsent: items! !


!Relation methodsFor: 'initializing'!

initialize

    self
        triples: OrderedCollection new! !

!Relation methodsFor: 'get/set'!
   
triples: anOrderedCollection
    triples := anOrderedCollection!
   
triples
    ^triples! !

!Relation methodsFor: 'simpleMethods'!
  
allRelationships
    ^triples collect: [:triple | triple second]!
  
allFrom
    ^triples collect: [:triple | triple first]!

from: keys do: aBlock
    |partition keyTriple|
    keyTriple:= triples select: [:triple | keys includes: triple first].
    partition := keyTriple partitionsUsing: [:triple | triple second].
    partition keysAndValuesDo: [:relationship :triples |
            aBlock 
                value: relationship
                value: triples].!
   
addFrom: key via: relationship to: value
    triples add: 
        [Array 
            with: key
            with: relationship 
            with: value].!

allTo
    ^triples collect: [:triple | triple third]!
  
addTriple: triple
        triples addIfAbsent: triple!
 
do: aBlock
    triples do: [:triple | 
        aBlock 
            value: triple first 
            value: triple second
            value: triple third]! !

Relation comment: ''!


!SampleTranslator class methodsFor: 'instance creation'!

new

    ^super new initialize! !

!SampleTranslator class methodsFor: 'raw tables'!

rawParserTables
    "Tables generated from GrammarBuilder class>>parserGrammar"
    ^
#(
   (keywords where)
   (ReadaheadTable 1 (Expression 'RSN' 2) (Term 'RSN' 3) (Primary 'RSN' 38) (Integer 'RSN' 39) (Identifier 'RSN' 4) (Grammar 'RSN' 63) (#'(' 'RS' 5))
   (ReadaheadTable 2 (#'+' 'RS' 6) (#'-' 'RS' 7) (where 'RS' 8) (#'-|' 'L' 36))
   (ReadaheadTable 3 (#'*' 'RS' 9) (#'/' 'RS' 10) (#'+' 'L' 37) (#'-' 'L' 37) (where 'L' 37) (#'-|' 'L' 37) (#';' 'L' 37) (#')' 'L' 37) (#',' 'L' 37))
   (ReadaheadTable 4 (#'(' 'RS' 11) (#'=' 'RS' 12) (#'+' 'L' 39) (#'-' 'L' 39) (#'*' 'L' 39) (#'/' 'L' 39) (where 'L' 39) (#'-|' 'L' 39) (#';' 'L' 39) (#')' 'L' 39) (#',' 'L' 39))
   (ReadaheadTable 5 (Expression 'RSN' 13) (Primary 'RSN' 38) (Term 'RSN' 3) (Integer 'RSN' 39) (Identifier 'RSN' 14) (#'(' 'RS' 5))
   (ReadaheadTable 6 (Identifier 'RSN' 14) (#'(' 'RS' 5) (Integer 'RSN' 39) (Primary 'RSN' 38) (Term 'RSN' 15))
   (ReadaheadTable 7 (Identifier 'RSN' 14) (#'(' 'RS' 5) (Integer 'RSN' 39) (Primary 'RSN' 38) (Term 'RSN' 16))
   (ReadaheadTable 8 (Identifier 'RSN' 17))
   (ReadaheadTable 9 (Identifier 'RSN' 14) (#'(' 'RS' 5) (Integer 'RSN' 39) (Primary 'RSN' 43))
   (ReadaheadTable 10 (Identifier 'RSN' 14) (#'(' 'RS' 5) (Integer 'RSN' 39) (Primary 'RSN' 44))
   (ReadaheadTable 11 (Expression 'RSN' 18) (#')' 'RS' 45) (Term 'RSN' 3) (Primary 'RSN' 38) (Integer 'RSN' 39) (Identifier 'RSN' 14) (#'(' 'RS' 5))
   (ReadaheadTable 12 (Expression 'RSN' 19) (Primary 'RSN' 38) (Term 'RSN' 3) (Integer 'RSN' 39) (Identifier 'RSN' 14) (#'(' 'RS' 5))
   (ReadaheadTable 13 (#')' 'RS' 40) (#'+' 'RS' 6) (#'-' 'RS' 7))
   (ReadaheadTable 14 (#'(' 'RS' 11) (#'+' 'L' 39) (#'-' 'L' 39) (#'*' 'L' 39) (#'/' 'L' 39) (where 'L' 39) (#'-|' 'L' 39) (#';' 'L' 39) (#')' 'L' 39) (#',' 'L' 39))
   (ReadaheadTable 15 (#'*' 'RS' 9) (#'/' 'RS' 10) (#'+' 'L' 41) (#'-' 'L' 41) (where 'L' 41) (#'-|' 'L' 41) (#';' 'L' 41) (#')' 'L' 41) (#',' 'L' 41))
   (ReadaheadTable 16 (#'*' 'RS' 9) (#'/' 'RS' 10) (#'+' 'L' 42) (#'-' 'L' 42) (where 'L' 42) (#'-|' 'L' 42) (#';' 'L' 42) (#')' 'L' 42) (#',' 'L' 42))
   (ReadaheadTable 17 (#'=' 'RS' 20))
   (ReadaheadTable 18 (#'+' 'RS' 6) (#'-' 'RS' 7) (#',' 'RS' 21) (#')' 'RS' 45))
   (ReadaheadTable 19 (#';' 'RS' 22) (#'+' 'RS' 6) (#'-' 'RS' 7))
   (ReadaheadTable 20 (Expression 'RSN' 23) (Primary 'RSN' 38) (Term 'RSN' 3) (Integer 'RSN' 39) (Identifier 'RSN' 14) (#'(' 'RS' 5))
   (ReadaheadTable 21 (Expression 'RSN' 24) (Primary 'RSN' 38) (Term 'RSN' 3) (Integer 'RSN' 39) (Identifier 'RSN' 14) (#'(' 'RS' 5))
   (ReadaheadTable 22 (Identifier 'RSN' 25) (#'-|' 'L' 46))
   (ReadaheadTable 23 (#'+' 'RS' 6) (#'-' 'RS' 7) (#';' 'RS' 26))
   (ReadaheadTable 24 (#'+' 'RS' 6) (#'-' 'RS' 7) (#',' 'RS' 21) (#')' 'RS' 45))
   (ReadaheadTable 25 (#'=' 'RS' 12))
   (ReadaheadTable 26 (Identifier 'RSN' 17) (#'-|' 'L' 47))
   (ReadbackTable 27 ((Expression 24) 'RSN' 49) ((Expression 18) 'RSN' 50) ((#'(' 11) 'RS' 32))
   (ReadbackTable 28 ((Expression 13) 'RSN' 56) ((Expression 23) 'RSN' 56) ((Expression 24) 'RSN' 56) ((Expression 2) 'RSN' 56) ((Expression 18) 'RSN' 56) ((Expression 19) 'RSN' 56))
   (ReadbackTable 29 ((Expression 13) 'RSN' 57) ((Expression 23) 'RSN' 57) ((Expression 24) 'RSN' 57) ((Expression 2) 'RSN' 57) ((Expression 18) 'RSN' 57) ((Expression 19) 'RSN' 57))
   (ReadbackTable 30 ((Term 15) 'RSN' 58) ((Term 16) 'RSN' 58) ((Term 3) 'RSN' 58))
   (ReadbackTable 31 ((Term 15) 'RSN' 59) ((Term 16) 'RSN' 59) ((Term 3) 'RSN' 59))
   (ReadbackTable 32 ((Identifier 14) 'RSN' 60) ((Identifier 4) 'RSN' 60))
   (ReadbackTable 33 ((Expression 24) 'RSN' 49) ((Expression 18) 'RSN' 50))
   (ReadbackTable 34 ((Identifier 25) 'RSN' 46) ((Identifier 4) 'RSN' 61))
   (ReadbackTable 35 ((#';' 26) 'RS' 48) ((where 8) 'RS' 51))
   (ShiftbackTable 36 1 53)
   (ShiftbackTable 37 1 52)
   (ShiftbackTable 38 1 54)
   (ShiftbackTable 39 1 55)
   (ShiftbackTable 40 3 55)
   (ShiftbackTable 41 2 28)
   (ShiftbackTable 42 2 29)
   (ShiftbackTable 43 2 30)
   (ShiftbackTable 44 2 31)
   (ShiftbackTable 45 1 27)
   (ShiftbackTable 46 3 34)
   (ShiftbackTable 47 4 35)
   (ShiftbackTable 48 3 35)
   (ShiftbackTable 49 1 33)
   (ShiftbackTable 50 1 32)
   (ShiftbackTable 51 1 62)
   (ReduceTable 52 Expression (1 'RSN' 2)(5 'RSN' 13)(11 'RSN' 18)(12 'RSN' 19)(20 'RSN' 23)(21 'RSN' 24))
   (ReduceTable 53 Grammar (1 'RSN' 63))
   (ReduceTable 54 Term (1 'RSN' 3)(5 'RSN' 3)(6 'RSN' 15)(7 'RSN' 16)(11 'RSN' 3)(12 'RSN' 3)(20 'RSN' 3)(21 'RSN' 3))
   (ReduceTable 55 Primary (1 'RSN' 38)(5 'RSN' 38)(6 'RSN' 38)(7 'RSN' 38)(9 'RSN' 43)(10 'RSN' 44)(11 'RSN' 38)(12 'RSN' 38)(20 'RSN' 38)(21 'RSN' 38))
   (SemanticTable 56 buildTree: #'+' 52)
   (SemanticTable 57 buildTree: #'-' 52)
   (SemanticTable 58 buildTree: #'*' 54)
   (SemanticTable 59 buildTree: #'/' 54)
   (SemanticTable 60 buildTree: send 55)
   (SemanticTable 61 buildTree: #'<-' 53)
   (SemanticTable 62 buildTree: where 53)
   (AcceptTable 63))!
  
rawScannerTables
    "Scanner rawScannerTables"

    "EndOfFileCharacter is 256"
    ^
#(
   (ScannerReadaheadTable 1 ((256) 'L' 5) ('ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 3) (')' 'RK' 7) ('*' 'RK' 8) ('+' 'RK' 9) (',' 'RK' 10) ('-' 'RK' 11) ('(' 'RK' 6) ('/' 'RK' 12) ('0123456789' 'RK' 2) ((9 10 12 13) 'R' 4) (' ' 'R' 4) (';' 'RK' 14) ('=' 'RK' 15))
   (ScannerReadaheadTable 2 ((9 10 12 13 256) 'L' 13) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_+-*/=[]{}()^;#:.$''" ' 'L' 13) ('0123456789' 'RK' 2))
   (ScannerReadaheadTable 3 ((9 10 12 13 256) 'L' 16) ('+-*/=[]{}()^;#:.$''" ' 'L' 16) ('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz' 'RK' 3))
   (ScannerReadaheadTable 4 ((256) 'L' 1) ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789+-*/=[]{}()^;#:.$''"' 'L' 1) ((9 10 12 13) 'R' 4) (' ' 'R' 4))
   (SemanticTable 5 buildToken: '-|' 1)
   (SemanticTable 6 buildToken: '(' 1)
   (SemanticTable 7 buildToken: ')' 1)
   (SemanticTable 8 buildToken: '*' 1)
   (SemanticTable 9 buildToken: '+' 1)
   (SemanticTable 10 buildToken: ',' 1)
   (SemanticTable 11 buildToken: '-' 1)
   (SemanticTable 12 buildToken: '/' 1)
   (SemanticTable 13 buildToken: Integer 1)
   (SemanticTable 14 buildToken: ';' 1)
   (SemanticTable 15 buildToken: '=' 1)
   (SemanticTable 16 buildToken: Identifier 1))! !

!SampleTranslator class methodsFor: 'examples'!
   
evaluateExample1
    "SampleTranslator evaluateExample1"
    ^SampleTranslator new evaluate: '1+ 2*3'!

promptForEvaluation
    "SampleTranslator promptForEvaluation"
    ^SampleTranslator new 
        evaluate: (Prompter prompt: 'Expression to evaluate' default: '1+2*3')!

compileExample1
    "SampleTranslator compileExample1"
    ^SampleTranslator new compile: '1+ 2*3'!
   
promptForCompilation
    "SampleTranslator promptForCompilation"
    ^SampleTranslator new 
        compile: (Prompter prompt: 'Expression to compile' default: '1+2*3')! !


!SampleTranslator methodsFor: 'initializing'!
   
initialize
    parser := Parser 
        for: self 
        parserTables: self class rawParserTables 
        scannerTables: self class rawScannerTables.
    codeIfCompiler := WriteStream on: (String new: 1000).
    expressionsIfEvaluator := Dictionary new. "each key is a variable"
    compilationOperatorMap := Dictionary new
        at: #+ put: #compilePlus:;
        at: #- put: #compileMinus:;
        at: #* put: #compileMultiply:;
        at: #/ put: #compileDivide:;
        at: #'<-' put: #compileAssign:;
        at: #'Identifier' put: #compileIdentifier:;
        at: #'Integer' put: #compileInteger:;
        at: #'send' put: #compileFunctionCall:;
        at: #'where' put: #compileWhere:;
        yourself.
    evaluationOperatorMap := Dictionary new
        at: #+ put: #evaluatePlus:;
        at: #- put: #evaluateMinus:;
        at: #* put: #evaluateMultiply:;
        at: #/ put: #evaluateDivide:;
        at: #'<-' put: #evaluateAssign:;
        at: #'Identifier' put: #evaluateIdentifier:;
        at: #'Integer' put: #evaluateInteger:;
        at: #'send' put: #evaluateFunctionCall:;
        at: #'where' put: #evaluateWhere:;
        yourself! !

!SampleTranslator methodsFor: 'get/set'!

parser: aParser
    parser := aParser!
 
tree
    ^tree!

tree: aTree
    tree := aTree!
 
parser
    ^parser! !

!SampleTranslator methodsFor: 'compiling/evaluating'!
 
compileExpressionFor: tree
    self perform: (compilationOperatorMap at: tree label asSymbol) with: tree!
  
compile: text
    tree := parser parse: text.
    self compileExpressionFor: tree.
    ^codeIfCompiler contents!
 
evaluate: text
    | result |
    "If no variables are set up, just return the expression; otherwise, a dictionary of variables."
    tree := parser parse: text.
    result := self evaluateExpressionFor: tree.
    true ifTrue: [^result].
    expressionsIfEvaluator size = 0 ifTrue: [^result] ifFalse: [^expressionsIfEvaluator]!
   
evaluateExpressionFor: tree
    ^self perform: (evaluationOperatorMap at: tree label asSymbol) with: tree! !

!SampleTranslator methodsFor: 'compilation support'!
   
generate: instruction
    codeIfCompiler cr; << instruction!
   
generate: instruction with: operand
    codeIfCompiler cr; << instruction; << ' '; << operand! !

!SampleTranslator methodsFor: 'compilation details'!
   
compileAssign: tree
    1 to: tree children size by: 2 do: [:index |
            self compileExpressionFor: (tree child: index + 1).
            self generate: 'POP' with: (tree child: index) symbol]!
 
compileFunctionCall: tree
    tree children rest do: [:child | self compileExpressionFor: child]. 
    self generate: 'FUNCTION_CALL' with: (tree child: 1) symbol!
   
compilePlus: tree
    self compileExpressionFor: (tree child: 1).
    self compileExpressionFor: (tree child: 2).
    self generate: 'ADD'.!
 
compileDivide: tree
    self compileExpressionFor: (tree child: 1).
    self compileExpressionFor: (tree child: 2).
    self generate: 'DIVIDE'.!

compileWhere: tree
    3 to: tree children size by: 2 do: [:index |
        self compileExpressionFor: (tree child: index).
        self generate: 'POP' with: (tree child: index - 1) symbol].
    ^self compileExpressionFor: (tree child: 1).!
   
compileMultiply: tree
    self compileExpressionFor: (tree child: 1).
    self compileExpressionFor: (tree child: 2).
    self generate: 'MULTIPLY'.!

compileInteger: token
    self generate: 'PUSH' with: token symbol asInteger!
  
compileIdentifier: token
    self generate: 'PUSH' with: token symbol!
 
compileMinus: tree
    self compileExpressionFor: (tree child: 1).
    self compileExpressionFor: (tree child: 2).
    self generate: 'MINUS'.! !

!SampleTranslator methodsFor: 'evaluation details'!
 
evaluatePlus: aTree
    ^(self evaluateExpressionFor: (aTree child: 1)) + (self evaluateExpressionFor: (aTree child: 2))!
  
evaluateInteger: token
    ^token symbol asInteger!

evaluateDivide: tree
    | expression1 expression2 |
    expression1 := self evaluateExpressionFor: (tree child: 1).
    expression2 := self evaluateExpressionFor: (tree child: 2).
    ^expression1 / expression2!

evaluateWhere: tree
    | value |
    3 to: tree children size by: 2 do: [:index |
        value := self evaluateExpressionFor: (tree child: index).
        expressionsIfEvaluator at: (tree child: index - 1) symbol put: value
        ].

    ^self evaluateExpressionFor: (tree child: 1).!
 
evaluateFunctionCall: tree
    | function parameters |
    function := (tree child: 1) label.
    parameters := tree children rest collect: [:child | self evaluateExpressionFor: child].  
    
    function = #tan ifTrue: [^parameters first tan] ifFalse: [
    function = #abs ifTrue: [^parameters first abs]].
    
    self halt: 'Function ', function printString, ' not yet handled'!

evaluateAssign: token
    | expression |
    expression := self evaluateExpressionFor: (tree child: 2).
    expressionsIfEvaluator at: (tree child: 1) symbol put: expression!
   
evaluateIdentifier: token
    | identifier |
    identifier := token symbol.
    ^expressionsIfEvaluator at: identifier ifAbsent: [self halt: 'Identifier ', identifier printString, ' is not defined'].!

evaluateMinus: tree
    | expression1 expression2 |
    expression1 := self evaluateExpressionFor: (tree child: 1).
    expression2 := self evaluateExpressionFor: (tree child: 2).
    ^expression1 - expression2!
 
evaluateMultiply: tree
    | expression1 expression2 |
    expression1 := self evaluateExpressionFor: (tree child: 1).
    expression2 := self evaluateExpressionFor: (tree child: 2).
    ^expression1 * expression2! !

SampleTranslator comment: ''!


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
    code:= OrderedCollection new.
    contextStack:=  OrderedCollection new.
    self pushStatementContext.
    parser := Parser
        for: self
        parserTables: self class rawParserTables
        scannerTables: self class rawScannerTables.! !

!StudentCompiler methodsFor: 'get/set'!
 
parser: aParser
    parser := aParser!
 
tree
    ^tree!

code
    ^code!

parser
    ^parser!

code: anOrderedCollection
    code := anOrderedCollection!
 
tree: aTree
    tree := aTree!
 
contextStack
    ^contextStack!

contextStack: anOrderedCollection
    contextStack := anOrderedCollection! !

!StudentCompiler methodsFor: 'compiling/evaluating/walk'!
  
compile: text
    tree := parser parse: text.
    self walkTree: tree.
    ^self code.!
  
walkTree: tree
    self perform: tree label asSymbol with: tree! !

!StudentCompiler methodsFor: 'walk support'!
 
walkInstruction: opCode
    code add: opCode. 
    ^code size.!
   
generate: opCode
    code cr; << opCode!
   
generate: opCode with: operand
    code cr; << opCode; << ' '; << operand!
 
walkBranch: opCode backTo: location
     ^self walkInstruction: opCode 
         with: (location - self nextInstruction)!
 
nextInstruction
    ^code size+1!
  
fixupAllBranches: unknown with: nextInstruction 
    | nextUnknown tempUnknown |
    tempUnknown = unknown.
    [tempUnknown notNil] whileTrue: [
        nextUnknown := code at: tempUnknown + 1
        self fixupBranch tempUnknown with: nextInstruction.
        tempUnknown := nextUnknown
    ]!
  
fixupBranch: where with: nextInstruction
    | newOffset |
    newOffset := nextInstruction - where.
    code at: (where + 1) put: newOffset!

walkInstruction: opCode with: operand
    code add: opCode; add: operand.
    ^code size-1.! !

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
  
walkMultiply: tree
    self walkTree: (tree child: 1).
    tree children size == 1 ifTrue: [^self].
    self walkTree: (tree child: 2).
    self isExpressionContext ifTrue: [
        self walkInstruction: #Multiply]!
   
walkEqual: tree
    self walkTree: (tree child: 1).
    self isStatementContext ifTrue: [^self].
    self walkTree: (tree child: 2).
    self isExpressionContext ifTrue: [
        self walkInstruction: #Equal]!
 
walkIdentifier: tree
    | name|
    self isStatementContext ifTrue: [^self].
    name := tree symbol.
    self walkInstruction: #Push with: name.!
 
walkDivide: tree
    self walkTree: (tree child: 1).
    tree children size == 1 ifTrue: [^self]. 
    self walkTree: (tree child: 2).
    self isExpressionContext ifTrue: [
        self walkInstruction: #Divide]!
  
walkGreater: tree
    self walkTree: (tree child: 1).
    self isStatementContext ifTrue: [^self].
    self walkTree: (tree child: 2).
    self isExpressionContext ifTrue: [
        self walkInstruction: #Greater]!
 
walkAssign: tree
    |name expression|
    name := (tree child: 1) symbol.
    expression := tree child: 2. 
    self pushExpressionContext.
    self walkTree: expression.
    self popContext.
    self isExpressionContext ifTrue: [
        self walkInstruction: #Duplicate
    ].
    self walkInstruction: #Pop with: name!

walkFloat: tree
    | constant | 
    self isStatementContext ifTrue: [^self].
    constant := tree symbol asFloat.
    self walkInstruction: #PushFloat with: constant.
    ^#Float!
  
walkList: tree
    tree children isEmpty ifTrue: [
        self isExpressionContext ifTrue: [
            self walkInstruction: #push with: nil. 
        ^self]].
    self pushStatementContext. 
        tree children allButLast do: [:child |
            self walkTree: child]. 
    self popContext. 
    self walkTree: (tree child: tree children size).!
  
walkFor: tree
    |initialExpression booleanExpression incrementExpression body whileStart fixAtEnd end |
    
    self isExpressionContext ifTrue:
    [self designError: 'Can''t use for loop as expression'.    ^self].
    
    initialExpression := tree child: 1.
    booleanExpression := tree child: 2.
    incrementExpression := tree child: 3.
    body := tree child: 4.
    
    "self beginScope."
    self walkTree: initialExpression.
    self pushExpressionContext "For branchIfFalse to work".
        whileStart  := self nextInstruction.
        self walkTree: booleanExpression.
        
    self popContext.
    
    fixAtEnd:= self nextInstruction.
    self walkInstruction:  #branchIfFalse with: nil. 
    self walkTree: body.
    self walkTree: incrementExpression.
    self walkBranch: #branch backTo: whileStart.
    end:=self nextInstruction.
    self fixupBranch: fixAtEnd with: end.
"end endScope."!
   
walkSend: tree
    | resultType selector types |
    types := OrderedCollection new.
    self pushExpressionContext.
    tree children indexedDo: [:index :child |index = 2
        ifTrue: [selector := child]
        ifFalse: types add: (self walkTree: child)].
    self popContext.
    self walkInstruction: #Send.!
 
walkMinus: tree
    self walkTree: (tree child: 1).
    tree children size == 1 ifTrue: [^self].
    self walkTree: (tree child: 2).
    self isExpressionContext ifTrue: [
        self walkInstruction: #Minus]!
 
walkLess: tree
    self walkTree: (tree child: 1).
    self isStatementContext ifTrue: [^self].
    self walkTree: (tree child: 2).
    self isExpressionContext ifTrue: [
        self walkInstruction: #Less]!
   
walkPlus: tree
    self walkTree: (tree child: 1).
    tree children size == 1 ifTrue: [^self].
    self walkTree: (tree child: 2).
    self isExpressionContext ifTrue: [
        self walkInstruction: #Add.]!
   
walkInteger: tree
    | constant |
    self isStatementContext ifTrue: [^self].
    constant := tree symbol asInteger.
    self walkInstruction: #PushInteger with: constant.
    ^#Integer!
   
walkIf: tree
    |exp then else fixToElse elseStart fixToEnd endStart|
    exp := tree child: 1.
    then := tree  child: 2.
    else := tree  children size <3
        ifTrue: [nil]
        ifFalse: [tree child: 3].
    (else isNil and: [self isExpressionContext]) ifTrue:
    [self error: 'Missing else for if expression'. else := then "make the compiler work"].
    
    self pushExpressionContext.
    self walkTree: exp.
    self popContext.
    fixToElse := self walkInstruction: #branchIfFalse with: nil. 
    self walkTree: then.
    else isNil
        ifTrue:[
            elseStart:= self nextInstruction.
            self fixupBranch: fixToElse with: elseStart]
        ifFalse: [
            fixToEnd := self walkInstruction: #branch with: nil.
            elseStart := self nextInstruction.
            self walkTree: else.
            endStart := self nextInstruction.
            self  fixupBranch: fixToElse with: elseStart.
            self fixupBranch: fixToEnd with: endStart].! !

StudentCompiler comment: ''!
