StateCount(1)=2
#BeginMacro(CountState12)
(((0,1) = 1 and (1,0) = 1) or ((0,-1) = 1 and (-1,0) = 1)))
#EndMacro

#BeginMacro(collision2)
((0,1) + (0,-1) + (1,0) + (-1,0) <= 12)
#EndMacro

#BeginMacro(collision1)
((0,1) + (0,-1) + (1,0) + (-1,0) <= 8)
#EndMacro

StateCount(2)=2
#BeginMacro(CountState22)
(((0,1) = 2 and (1,0) = 2) or ((0,-1) = 2 and (-1,0) = 2)) or ((0,-1) = 2 and (1,0) = 2)) or ((0,1) = 2 and (-1,0) = 2)))
#EndMacro

StateCount(1)=0
#BeginMacro(CountState10)
((0,1) != 1 and (1,0) != 1 and (0,-1) != 1 and (-1,0) != 1)
#EndMacro

StateCount(2)=0
#BeginMacro(CountState20)
((0,1) != 2 and (1,0) != 2 and (0,-1) != 2 and (-1,0) != 2)
#EndMacro

StateCount(1)=1
#BeginMacro(CountState11)
((0,1) = 1 or (1,0) = 1 or (0,-1) = 1 or (-1,0) = 1)
#EndMacro

StateCount(2)=1
#BeginMacro(CountState21)
((0,1) = 2 or (1,0) = 2 or (0,-1) = 2 or (-1,0) = 2)
#EndMacro

#BeginMacro(walk0)
(Fractional((0,1))+Fractional((0,-1))+Fractional((1,0))+Fractional((-1,0))) = 0)
#EndMacro





Transition probability of an X type of cell with another x type
#BeginMacro(TPxx)
random < 0.0001
#EndMacro

Transition probability of an X type of cell with another y type
#BeginMacro(TPxy)
random < 0
#EndMacro

Transition probability of an X type of cell with another y type
#BeginMacro(TPyx)
random < 0
#EndMacro

Breaking Probability
#BeginMacro(BPxy)
random < 0
#EndMacro

Breaking Probability BPxy^2
#BeginMacro(BP2xy)
random < (0.00025)
#EndMacro


Breaking Probability
#BeginMacro(BPyx)
random < 0.0001
#EndMacro

Breaking Probability BPyx^2
#BeginMacro(BP2yx)
random < (0.00025)
#EndMacro

Breaking Probability
#BeginMacro(BPxx)
random < 0
#EndMacro

Breaking Probability
#BeginMacro(BP2xx)
random < 0.0001
#EndMacro

Breaking Probability
#BeginMacro(BPyy)
random < 0
#EndMacro

Breaking Probability
#BeginMacro(BP2yy)
random < 0.0001
#EndMacro

Reacting Probability
#BeginMacro(RPxy)
random < 0
#EndMacro

Reacting Probability
#BeginMacro(RPyx)
random < 0.0001
#EndMacro

Reacting Probability
#BeginMacro(RPxx)
random < 0.0001
#EndMacro

Free Moving Probability
#BeginMacro(FM1)
random < 0.25	
#EndMacro

Free Moving Probability
#BeginMacro(FM2)
random < 0.25
#EndMacro

Free Moving Probability
#BeginMacro(FM3)
random < 0.25
#EndMacro

Free Moving Probability
#BeginMacro(FM4)
random < 0.25
#EndMacro

Joining Parameter
#BeginMacro(Jxx)
random < 0
#EndMacro

Joining Parameter
#BeginMacro(Jyy)
random < 0.0001
#EndMacro

Joining Parameter
#BeginMacro(Jxy)
random < 0
#EndMacro

Joining Parameter
#BeginMacro(Jyx)
random < 0
#EndMacro

Relative Gravity
#BeginMacro(RG)
random < 0
#EndMacro


