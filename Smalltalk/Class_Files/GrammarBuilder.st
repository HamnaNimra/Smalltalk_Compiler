
Object subclass: #GrammarBuilder
  instanceVariableNames: 
    ' parser tree grammar'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Example Parser Users'
!


Object subclass: #Grammar
  instanceVariableNames: 
    ' productions macros '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Grammar Constructor'
!

Object subclass: #Production
  instanceVariableNames: 
    ' name fsm lookahead  '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Grammar Constructor'
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
   (AcceptTable 166))! !

!GrammarBuilder class methodsFor: 'raw tables'!
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
    grammar := Grammar new.! !

!GrammarBuilder methodsFor: 'processing'!

process: text
    tree := parser parse: text.
    self walkTree: tree!

walkTree: aTree
    ^self perform: aTree label with: aTree! !

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


GrammarBuilder comment: ''!


!Grammar class methodsFor: 'instance creation'!
   
new
    ^super new initialize! !


!Grammar methodsFor: 'initializing'!

initialize
    self productions: Dictionary new; macros: Dictionary new! !

!Grammar methodsFor: 'get/set'!
  
productions
    ^productions!

 
goalProductions
    | goalProductions |
    goalProductions := OrderedCollection new.
    self goalProductionsDo: [:production | goalProductions addIfIdenticalAbsent: production].
    ^goalProductions!
 
macros: aDictionary
    macros := aDictionary!
   
macros
    ^macros!
  
productions: aDictionary
    productions := aDictionary! !

!Grammar methodsFor: 'adding'!
  
addProduction: aProduction
    productions at: aProduction name put: aProduction!
  
addMacro: name  fsm: anFSM
    macros at: name put: anFSM! !

!Grammar methodsFor: 'querying'!

   
isLeftPart: nonterminal
    ^productions keyExists: nonterminal!
   
isNonterminal: aTransitionName
    aTransitionName isAction ifTrue: [^false].
    productions at: aTransitionName symbol ifAbsent: [^false].
    ^true!
  
isGoal: nonterminal
    ^(self productionFor: nonterminal) isGoal!
 
macro: aSymbol
    ^macros at: aSymbol!

isMacro: aSymbol
    macros at: aSymbol ifAbsent: [^false].
    ^true! !

!Grammar methodsFor: 'looping'!

goalProductionsDo: aBlock
    "aGrammar goalProductionsDo: [:production | ... ]"
    ^self productions do: [:production | production isGoal ifTrue: [aBlock value: production]]!
  
nonterminalsDo: aBlock
    "Grammar nonterminalsDo:[:symbol | ... ]"
    productions keysDo: aBlock! !

!Grammar methodsFor: 'finalizing'!
  
 
finalize
    "Can be used to compute first and follow sets for the next assignment."
    ^self! !
   

!Production class methodsFor: 'instance creation'!
  
new

    ^super new initialize! !


!Production methodsFor: 'initializing'!

initialize
    "Nothing so far"! !

!Production methodsFor: 'get/set'!
   
fsm
    ^fsm!
  
 
name: aSymbol
    name := aSymbol!

lookahead: anFSMOrArray
    lookahead := anFSMOrArray!
 
name
    ^name!

fsm: aFiniteStateMachine
    fsm := aFiniteStateMachine!

  
lookahead
    ^lookahead! !

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
