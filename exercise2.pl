link(a,b).
link(b,a).
link(b,c).
link(c,b).
link(b,d).
link(d,b).
link(c,d).
link(d,c).

/*neighbor*/
neighbor(X,Y):-link(X,Y).

/*path which will never end in circles*/
path(X,Y):-link(X,Y);link(X,T),path(T,Y).

/*path which avoid circles*/
path2(X,Y):-path2Helper(X,Y,[X]).
path2Helper(X,Y,V):-link(X,Y),\+(member(Y,V));link(X,T),\+(member(T,V)),path2Helper(T,Y,[T|V]).

/*expotional complexity*/
fibs(0,0).
fibs(1,1).
fibs(N,Value):-N1 is N-1, fibs(N1,Value1), N2 is N-2,fibs(N2,Value2),Value is Value1+Value2.

/*only store the last two*/
fibs2(N,Value):-N = 1, Value = 0; N = 2, Value = 1; N > 2, fibs2(N,0,1,Value,3).
fibs2(N,Value1,Value2,Value,N):-Value is Value1 + Value2.
fibs2(N,Value1,Value2,Value,Cnt):-Temp is Value2 + Value1,Cnt1 is Cnt + 1, fibs2(N,Value2,Temp, Value, Cnt1).
