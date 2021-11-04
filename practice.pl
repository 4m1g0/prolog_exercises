% monkey banana

move(state(middle, onbox, middle, hasnot),
    grasp,
    state(middle, onbox, middle, has)).

move(state(X, onfloor, X, H),
    climb,
    state(X, onbox, X, H)).

move(state(X, onfloor, X, H),
    push(X, Y),
    state(Y, onfloor, Y, H)).

move(state(X, onfloor, A, H),
    walk(X, Y),
    state(Y, onfloor, A, H)).

canget(state(_, _, _, has)).

canget(State1):-
    move(State1, _,State2),
    canget(State2).

% concatenation of 2 lists
concatenation([], L1, L1).
concatenation([X1|L1], L2, [X1|L3]):- concatenation(L1, L2, L3).


% interm convert from numbers to literals
interm(0, zero).
interm(1, one).

inwords([], []).
inwords([X1|L1], [A|L2]):- interm(X1, A), inwords(L1, L2).

% return all possible permutations of a given list
% this is a weird delete, that removes only the first occurence of an element on a list
delete(A, [A|L1], L1).
delete(A, [H1|L1], [H1| L2]):- delete(A, L1, L2).

list_permutation([], []).
list_permutation(L1, [X2|L2]):- delete(X2, L1, L3), list_permutation(L3, L2).

% append an element to the end of a list
append(A, [], [A]).
append(A, [H1|L1], [H1|L2]):- append(A, L1, L2).

% get the last element of a list
last_element([A|[]], A).
last_element([_|L1], X):- last_element(L1, X).

% check if an element appears in a list
appear(A, [A|_]).
appear(A, [_|L1]):- appear(A, L1).

% check if a list has diplicate elements
duplicates([H1|[H1|_]]).
duplicates([_|[_|L1]]):- duplicates(L1).

% remove an element from a list
remove(_, [], []).
remove(A, [A|L1], L2):- remove(A, L1, L2), !.
remove(A, [H1|L1], [H1|L2]):- remove(A, L1, L2).

remove_doubles([], []).
remove_doubles([H1|L1], [H1|L3]):- remove(H1, L1, L2), remove_doubles(L2, L3).

% insert A in all possible positions
insert(A, L1, L2):- delete(A, L2, L1).

% reverse a list
reverse([], []).
reverse([H1|L1], L3):- reverse(L1, L2), append(H1, L2, L3).

% check if a list is a palindrome
palindrome(L1):- reverse(L1, L1).

% check if length is odd or even
oddlength([_|[]]).
oddlength([_|L1]):- evenlength(L1).

evenlength([]).
evenlength([_|L1]):- oddlength(L1).

% shift a list circularly
shift([], []).
shift([H1|L1], L2):- append(H1, L1, L2).

% subsets of a list
subset([], []).
subset([H1|L1],[H1|L2]):- subset(L1, L2). % retain first
subset([_|L1],L2):- subset(L1, L2). % remove first


clone(H,[H,H]).

max([H1|L1], H1):-
    max(l1, X),
    X <= H1,
    !.

max([_|L1], X):-
    max(L1, X),
    !.




