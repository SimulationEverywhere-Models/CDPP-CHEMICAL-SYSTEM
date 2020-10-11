#include(Constants.inc)
[top]
components : Chemical

[Chemical]
type : cell
dim : (30,30)
delay : transport
defaultDelayTime : 50
border : wrapped
neighbors :								   Chemical(-2,0)
neighbors : 	      	   Chemical(-1,-1) Chemical(-1,0) Chemical(-1,1) 
neighbors : Chemical(0,-2) Chemical(0,-1)  Chemical(0,0)  Chemical(0,1) Chemical(0,2)
neighbors :			       Chemical(1,-1)  Chemical(1,0)  Chemical(1,1)
neighbors :								   Chemical(2,0)
initialvalue : 0
initialCellsValue : Chemi.val
localtransition : ChemRules

[ChemRules]

%receiving a moving cell towards an empty one

rule : { 2 } 50 { (0,0) = 0  and 
((0,1) = 10 or (0,-1) = 9 or (-1,0) = 11 or (1,0) = 12) }

rule : { 1 } 50 { (0,0) = 0  and 
((0,1) = 6 or (0,-1) = 5 or (-1,0) = 7 or (1,0) = 8) }

rule : { if((0,1) = 0, 0, 2) } 50 { (0,0) = 9 }
rule : { if((0,-1) = 0, 0, 2) } 50 { (0,0) = 10 }
rule : { if((1,0) = 0, 0, 2) } 50 { (0,0) = 11 }
rule : { if((-1,0) = 0, 0, 2) } 50 { (0,0) = 12 }

rule : { if((0,1) = 0, 0, 1) } 50 { (0,0) = 5 }
rule : { if((0,-1) = 0, 0, 1) } 50 { (0,0) = 6 }
rule : { if((1,0) = 0, 0, 1) } 50 { (0,0) = 7 }
rule : { if((-1,0) = 0, 0, 1) } 50 { (0,0) = 8 }


%Transition rule(ex. molecules change from one tautomeric form to another)
rule : { 2 } 50 {#Macro(TPxy) and (0,0) = 1}
rule : { 1 } 50 {#Macro(TPyx) and (0,0) = 2}


%Breaking rule

rule : { if( (0,1) = 2 and (0,-1) = 0, 6 ,if( (0,-1) = 2 and (0,1) = 0, 5 ,if( (1,0) = 2 and (-1,0) = 0, 8 ,if( (-1,0) = 2 and (1,0) = 0, 7 ,1)))) } 50 {#Macro(BPxy) and (0,0) = 1 and #Macro(CountState21) }
%rule : { if( ((0,1) = 0 and (0,-1) = 0), 8 , if( ((1,0) = 0 and (-1,0) = 0), (1+((randInt(1)+3)*0.1)) , if( ((0,1) = 0 and (1,0) = 0), 7 , if( ((0,1) = 0 and (-1,0) = 0), 8 , if( ((0,-1) = 0 and (1,0) = 0), (1+((randInt(1)+2)*0.1)) , 8 )))))  } 50 {#Macro(BP2xy) and (0,0) = 1 and stateCount(2) = 2 }
rule : { if( (0,1) = 1, 10 ,if( (0,-1) = 1, 9 ,if( (1,0) = 1, 12 ,11))) } 50 {#Macro(BPyx) and (0,0) = 2 and #Macro(CountState11) }
%rule : { if( ((0,1) = 0 and (0,-1) = 0), 12 , if( ((1,0) = 0 and (-1,0) = 0), (2+((randInt(1)+3)*0.1)) , if( ((0,1) = 0 and (1,0) = 0), 11 , if( ((0,1) = 0 and (-1,0) = 0), 12 , if( ((0,-1) = 0 and (1,0) = 0), (2+((randInt(1)+2)*0.1)) , 12 )))))  } 50 {#Macro(BP2yx) and (0,0) = 2 and #Macro(CountState12) }

rule : { if( (0,1) = 1, 6 ,if( (0,-1) = 1, 5 ,if( (1,0) = 1, 8 ,7))) } 50 {#Macro(BPxx) and #Macro(CountState11) and (0,0) = 1 and #Macro(CountState20) }
%rule : { if( ((0,1) = 0 and (0,-1) = 0), 8 , if( ((1,0) = 0 and (-1,0) = 0), (1+((randInt(1)+3)*0.1)) , if( ((0,1) = 0 and (1,0) = 0), 7 , if( ((0,1) = 0 and (-1,0) = 0), 8 , if( ((0,-1) = 0 and (1,0) = 0), (1+((randInt(1)+2)*0.1)) , 8 )))))  } 50 {#Macro(BP2xx) and #Macro(CountState20) and stateCount(1) = 3 and (0,0) = 1 }

rule : { if( (0,1) = 2, 10 ,if( (0,-1) = 2, 9 ,if( (1,0) = 2, 12 ,11))) } 50 {#Macro(BPyy) and #Macro(CountState10) and #Macro(CountState21) and (0,0) = 2 }
%rule : { if( ((0,1) = 0 and (0,-1) = 0), 12 , if( ((1,0) = 0 and (-1,0) = 0), (2+((randInt(1)+3)*0.1)) , if( ((0,1) = 0 and (1,0) = 0), 11 , if( ((0,1) = 0 and (-1,0) = 0), 12 , if( ((0,-1) = 0 and (1,0) = 0), (2+((randInt(1)+2)*0.1)) , 12 )))))  } 50 {#Macro(BP2yy) and #Macro(CountState10) and stateCount(2) = 3 and (0,0) = 2 }

%joining rules
rule : {5} 50 {#Macro(Jxy) and (0,2) = 2 and (0,0) = 1 and (0,1) = 0 }
rule : {6} 50 {#Macro(Jxy) and (0,-2) = 2 and (0,0) = 1 and (0,-1) = 0 }
rule : {7} 50 {#Macro(Jxy) and (2,0) = 2 and (0,0) = 1 and (1,0) = 0 }
rule : {8} 50 {#Macro(Jxy) and (-2,0) = 2 and (0,0) = 1 and (-1,0) = 0 }

rule : {9} 50 {#Macro(Jyx) and (0,2) = 1 and (0,0) = 2 and (0,1) = 0 }
rule : {10} 50 {#Macro(Jyx) and (0,-2) = 1 and (0,0) = 2 and (0,-1) = 0 }
rule : {11} 50 {#Macro(Jyx) and (2,0) = 1 and (0,0) = 2 and (1,0) = 0 }
rule : {12} 50 {#Macro(Jyx) and (-2,0) = 1 and (0,0) = 2 and (-1,0) = 0 }

rule : {9} 50 {#Macro(Jyy) and (0,2) = 2 and (0,0) = 2 and (0,1) = 0 }
rule : {10} 50 {#Macro(Jyy) and (0,-2) = 2 and (0,0) = 2 and (0,-1) = 0 }
rule : {11} 50 {#Macro(Jyy) and (2,0) = 2 and (0,0) = 2 and (1,0) = 0 }
rule : {12} 50 {#Macro(Jyy) and (-2,0) = 2 and (0,0) = 2 and (-1,0) = 0 }

rule : {5} 50 {#Macro(Jxx) and (0,2) = 1 and (0,0) = 1 and (0,1) = 0 }
rule : {6} 50 {#Macro(Jxx) and (0,-2) = 1 and (0,0) = 1 and (0,-1) = 0 }
rule : {7} 50 {#Macro(Jxx) and (2,0) = 1 and (0,0) = 1 and (1,0) = 0 }
rule : {8} 50 {#Macro(Jxx) and (-2,0) = 1 and (0,0) = 1 and (-1,0) = 0 }

%Free move


rule : {5} 50 {(0,0) = 1 and (0,1) = 0 and #Macro(FM1)}
rule : {6} 50 {(0,0) = 1 and (0,-1) = 0 and #Macro(FM2) }
rule : {7} 50 {(0,0) = 1 and (1,0) = 0 and #Macro(FM3)}
rule : {8} 50 {(0,0) = 1 and (-1,0) = 0 and #Macro(FM4)}

rule : {9} 50 {(0,0)=2 and (0,1) = 0 and #Macro(FM1)}
rule : {10} 50 {(0,0)=2 and (0,-1) = 0 and #Macro(FM2)}
rule : {11} 50 {(0,0)=2 and (1,0) = 0 and #Macro(FM3)}
rule : {12} 50 {(0,0)=2 and (-1,0) = 0 and #Macro(FM4)}


%Reaction Rule
%rule : { 3 } 50 { (stateCount(2) >= 1) and #Macro(RPxy)and (0,0) = 1 }


rule : {(0,0)} 50 { t }