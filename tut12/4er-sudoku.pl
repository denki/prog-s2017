all_member([], _).
all_member([X|Xs], Ys)
  :- member(X, Ys) , all_member(Xs, Ys).

all_distinct([]).
all_distinct([X|Xs])
  :- not(member(X, Xs)) , all_distinct(Xs).

sudoku( X11, X12, X13, X14
      , X21, X22, X23, X24
      , X31, X32, X33, X34
      , X41, X42, X43, X44 )
  :- all_member( [ X11, X12, X13, X14
                 , X21, X22, X23, X24
                 , X31, X32, X33, X34
                 , X41, X42, X43, X44 ]
               , [1,2,3,4] )
     , all_distinct([X11, X12, X13, X14])
     , all_distinct([X21, X22, X23, X24])
     , all_distinct([X31, X32, X33, X34])
     , all_distinct([X41, X42, X43, X44])
     , all_distinct([X11, X21, X31, X41])
     , all_distinct([X12, X22, X32, X42])
     , all_distinct([X13, X23, X33, X43])
     , all_distinct([X14, X24, X34, X44])
     , all_distinct([X11, X12, X21, X22])
     , all_distinct([X13, X14, X23, X24])
     , all_distinct([X31, X32, X41, X42])
     , all_distinct([X33, X34, X43, X44]).
