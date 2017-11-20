/* CPSC 449 - Programming Paradigms
** Spring 2017
** Professor: Dr. Ben Stephenson
**
** Assignment 3: Computer Science Courses through Prolog
** The purpose of this assignment is to develop a knowledge-base that contains
** facts and rules about the prerequisite relationships between courses in 
** Computer Science at the University of Calgary.
** 
** 
*/

library(apply).

/*
** ============================================================================
** Prerequisite information for non-computer science courses.
** ============================================================================
*/

prereqFor(amat217, []).
prereqFor(amat219, X) :-
  member(X, [[amat217], [math249], [math251], [math281, math211]]).
prereqFor(math211, []).
prereqFor(math213, []).
prereqFor(math249, []).
prereqFor(math251, []).
prereqFor(math253, [X]) :-
  member(X, [math249, math251, math281, amat217]).
prereqFor(math265, []).
prereqFor(math267, [X]) :-
  member(X, [math249, math265, math275, math281, amat217]).
prereqFor(math275, []).
prereqFor(math277, [X]) :-
  member(X, [math275, amat217]).
prereqFor(math281, []).
prereqFor(math283, [math281]).
prereqFor(math271, [math211]).
prereqFor(math273, []).
prereqFor(math321, [X]) :-
  member(X, [math253, math263, math283, amat219]).
prereqFor(stat205, []).
prereqFor(stat211, []).
prereqFor(stat213, []).
prereqFor(stat321, [X]) :-
  member(X, [math267, math277, math253, math283, amat219]).
prereqFor(phil279, []).
prereqFor(phil377, []).
prereqFor(pmat315, [X]) :-
  member(X, [math211, math213]).
prereqFor(pmat331, []).
prereqFor(ensf409, [encm339]).
prereqFor(ensf480, [ensf409, encm369]).
prereqFor(encm339, [engg233]).
prereqFor(encm369, [encm339, enel353]).
prereqFor(enel353, X) :-
  member(X, [[admission_to_enel_or_ensf], [cpsc233, math271]]).
prereqFor(seng300, [X]) :-
  member(X, [cpsc319, cpsc331]).
prereqFor(seng301, [X]) :-
  member(X, [cpsc319, cpsc331]).
prereqFor(engg233, []).

/*
** Courses that require consent of the department should include consent
** followed by the course number in their prerequisite lists.
*/
prereqFor(consent235, []).
prereqFor(consent399, []).
prereqFor(consent499, []).
prereqFor(consent502, []).
prereqFor(consent503, []).
prereqFor(consent527, []).
prereqFor(consent528, []).
prereqFor(consent550, []).
prereqFor(consent568, []).
prereqFor(consent581, []).
prereqFor(consent584, []).
prereqFor(consent585, []).
prereqFor(consent594, []).
prereqFor(consent598, []).
prereqFor(consent599, []).
prereqFor(admission_to_enel_or_ensf, []).

/*
** Prerequisites for computer science courses that can only have their
** prerequisites satisfied in one way.
*/
prereqFor(cpsc105, []).
prereqFor(cpsc203, []).
prereqFor(cpsc217, []).
prereqFor(cpsc219, [cpsc217]).
prereqFor(cpsc231, []).
prereqFor(cpsc233, [cpsc231]).
prereqFor(cpsc235, [consent235]).
prereqFor(cpsc399, [consent399]).
prereqFor(cpsc499, [consent499]).
prereqFor(cpsc502, [consent502]).
prereqFor(cpsc503, [consent503]).
prereqFor(cpsc511, [cpsc413]).
prereqFor(cpsc513, [cpsc313]).
prereqFor(cpsc517, [cpsc413]).
prereqFor(cpsc522, [cpsc522]).
prereqFor(cpsc526, [cpsc441]).
prereqFor(cpsc527, [cpsc313, cpsc457, consent527]).
prereqFor(cpsc528, [cpsc313, cpsc457, consent528]).
prereqFor(cpsc550, [cpsc457, consent550]).
prereqFor(cpsc559, [cpsc457]).
prereqFor(cpsc561, [cpsc413]).
prereqFor(cpsc565, [cpsc433]).
prereqFor(cpsc567, [cpsc457, cpsc433]).
prereqFor(cpsc568, [cpsc433, consent568]).
prereqFor(cpsc571, [cpsc461, cpsc471]).
prereqFor(cpsc572, [cpsc571]).
prereqFor(cpsc581, [cpsc481, consent581]).
prereqFor(cpsc584, [cpsc481, consent584]).
prereqFor(cpsc585, [cpsc453, consent585]).
prereqFor(cpsc587, [cpsc453]).
prereqFor(cpsc589, [cpsc453]).
prereqFor(cpsc591, [cpsc453]).
prereqFor(cpsc594, [consent594]).
prereqFor(cpsc598, [consent598]).
prereqFor(cpsc599, [consent599]).

/*
** ============================================================================
** Part 1: Prerequisites for Computer Science Courses
** ============================================================================
*/

prereqFor(cpsc313, [M, P, C]) :-
  member(M, [math271, math273]),
  member(P, [phil279,phil377]),
  member(C, [cpsc219, cpsc233, cpsc235]).
  
prereqFor(cpsc319, [C]) :-
  member(C, [cpsc219,cpsc233,cpsc235, encm339]).
  
prereqFor(cpsc329,[C]) :-
  member(C, [cpsc219,cpsc233,cpsc235, engg233]).
  
prereqFor(cpsc331, [M, C]) :- 
  member(M, [math271, math273]), 
  member(C, [cpsc219, cpsc233, cpsc235, encm339]).
  
prereqFor(cpsc335, [C]) :-
  member(C, [cpsc319,cpsc331]).

prereqFor(cpsc355, [C]) :-
  member(C, [cpsc219, cpsc233, cpsc235]).
  
prereqFor(cpsc359, [cpsc355, P]) :-
  member(P, [phil279,phil377]).

prereqFor(cpsc409, [cpsc355]).

prereqFor(cpsc411, [C]) :-
  member(C, [cpsc319,cpsc331]).
  
prereqFor(cpsc413, [cpsc313, cpsc331]).
prereqFor(cpsc413, [cpsc313, cpsc319, cpsc105]).
  
prereqFor(cpsc418, [C, M]) :-
  member(C, [cpsc331]),
  member(M, [math271,math273,pmat315]).
prereqFor(cpsc418, [C, M]) :-
  member(C, [cpsc319,cpsc105]),
  member(M, [math271,math273,pmat315]).
  
prereqFor(cpsc433, [C,P]) :-
  member(C, [cpsc313]),
  member(P, [phil279, phil377]).
  
prereqFor(cpsc441, [C1, C2]) :-
  member(C1, [cpsc331,cpsc319]),
  member(C2, [cpsc325,cpsc359,encm369]).
  
prereqFor(cpsc449, [C,P]) :-
  member(C, [cpsc319,cpsc331]),
  member(P, [phil279,phil377]).
  
prereqFor(cpsc453, [C,M1,M2]) :-
  member(C, [cpsc319,cpsc331]),
  member(M1, [math211,math213]),
  member(M2, [math253,math267,math277,math283,amat219]).  

prereqFor(cpsc457, [C1,C2]) :-
  member(C1, [cpsc319,cpsc331]),
  member(C2, [cpsc325,cpsc359,encm369]).
  
prereqFor(cpsc461, [cpsc355, C]) :-
  member(C, [cpsc319,cpsc331]).
  
prereqFor(cpsc471, [C]) :-
  member(C, [cpsc319,cpsc331]).
  
prereqFor(cpsc481, [C]) :-
  member(C, [seng300,seng301,seng480]).
  
prereqFor(cpsc491, [C, M1, M2]) :-
  member(C, [cpsc319,cpsc331]),
  member(M1, [math211,math213]),
  member(M2, [math249,math251,math265,math275,math281,amat217]).
  
prereqFor(cpsc501, [C]) :-
  member(C, [cpsc349,cpsc449]).
  
prereqFor(cpsc518, [C, M]) :-
  member(C, cpsc413),
  member(M, [math211,math213]).

prereqFor(cpsc519, [C, M]) :-
  member(C, [cpsc413]),
  member(M, [math211,math313]). 

prereqFor(cpsc521, [cpsc313, C]) :-
  member(C, [cpsc349,cpsc449]).
  
prereqFor(cpsc525, [cpsc457, M]) :-
  member(M, [math271,math273]).
  
prereqFor(cpsc530, [C, M, S]) :-
  member(C, [cpsc219,cpsc233,cpsc235]),
  member(M, [math271,math273,pmat315]),
  member(S, [stat205,stat211,stat213,stat321,math321]).
  
prereqFor(cpsc531, [cpsc457, S]) :-
  member(S, [math321,stat205,stat211,stat213,stat321]).

prereqFor(cpsc535, [M]) :-
  member(M, [math311,math313,math331,amat307,amat311,pmat331]).
  
prereqFor(cpsc583, [C]) :-
  member(C, [cpsc319,cpsc331]).
  
/*
** --------------------------------------------------------
** Course Antirequisites
** --------------------------------------------------------
*/
antireqs([cpsc215, cpsc217, cpsc231, cpsc235, engg233]).
antireqs([cpsc215, cpsc217, cpsc231, cpsc235, encm339]).
antireqs([cpsc219, cpsc233, cpsc235, enel497, encm493]).
antireqs([cpsc319, cpsc331]).
antireqs([cpsc355, cpsc265, encm369]).
antireqs([cpsc359, cpsc325, cpsc455, encm415]).
antireqs([cpsc418, cpsc429, cpsc557, pmat329, pmat418]).
antireqs([cpsc441, enel573]).
antireqs([cpsc471, btma331]).
antireqs([cpsc491, amat491, amat493, engg407]).
antireqs([cpsc502, cpsc503, ensf599, ensf591]).
antireqs([cpsc525, cpsc529]).
antireqs([cpsc526, cpsc529]).
antireqs([math271, math273]).
antireqs([math253, math263, math283, amat219]).
antireqs([math253, math267, math277, math283, amat219]).
antireqs([math249, math251, math265, math275, math281, amat217]).
antireqs([math211, math213, math221]).
antireqs([math267, math277, math349, amat219]).
antireqs([stat205, stat211, stat213]).
antireqs([phil279, phil377]).
antireqs([math315, math317]).
antireqs([ensf480, seng300, seng301, seng311, seng411, cpsc301, cpsc333, cpsc451]).
antireqs([ensf409, enel409, encm493]).
antireqs([enel353, cpsc321]).


/*
** ============================================================================
** Part 2: allPrereqFor Implementation
** ============================================================================
*/


/* 
** allPrereqsFor : Show be read as Course has AllPrereqs.
** Uses recursion and a helper rule, appendPrereqs, to find all prerequisites
** for Course (that is, every possible permutation).
*/

allPrereqFor(Course, AllPrereqs) :-
   prereqFor(Course, X),
   appendPrereqs(X, S), 
   append(X, S, UnsortedList),
   sort(UnsortedList, AllPrereqs).

/* 
** appendPrereqs : Rule in which the first term is a list of courses, 
** and the second term is a list of all the courses which are prerequisites
** for them. 
*/   
	
appendPrereqs([],[]). 
appendPrereqs(List, AppendedList) :-
   List = [Head | Tail],
   allPrereqFor(Head, X),
   appendPrereqs(Tail, Z),
   append(X, Z, AppendedList).
	 

/*
** ============================================================================
** Part 3: allPrereqFor_NoAnti Implementation
** ============================================================================
*/


/* 
** antireqFor(A,B) should be read as "A has list B of anti-requisites."
*/

antireqFor(A,B) :-
   antireqs(X),
   member(A,X),
   subtract(X, [A], B).
   
/* 
** antireqForList(A,B) should be read as "List of courses A has list B of anti-requisites."
*/

antireqForList([],[]).
antireqForList(A,B) :- 
   A = [Head | Tail],
   antireqFor(Head, X),
   antireqForList(Tail, Y),
   append(X, Y, Z),
   removeDuplicates(Z, B).

/* 
** isAntireq(A,B) should be read as "A is an antirequisite of B".
*/
isAntireq(A,B) :-
    antireqs(X), 
	member(A, X),
	member(B, X), !,
	A \= B.

/* 
** containsAntireq(A) should be read as "List A contains two or more courses which 
** are anti-requisites of one another".
*/

containsAntireq(A) :-
   member(X, A),
   member(Y, A),
   X \= Y,
   isAntireq(X,Y), !.
   
/* 
** allPrereqFor_NoAnti(Course, PrereqList) - a rule which should be read as: 
** "Course has the following permutations of lists of prerequisite courses,
** of which none are anti-requisites of one another."
*/
 
allPrereqFor_NoAnti(C,L) :-
   allPrereqFor(C, L),
   \+ containsAntireq(L).
   

/*
** ============================================================================
** Part 4: neededCourses Implementation
** ============================================================================
*/

/*
** neededCourses(CoursesCompleted, Course, RemainingCourses)
** This 3-arity rule reads as follows:
** "RemainingCourses is defined as the full list of possible course paths 
** to take a Course, minus the CoursesCompleted, and not including 
** any anti-requisites of CoursesCompleted."
**
** neededCoursesHelper contains all the logic for the above
** goal. neededCourses(A,B,C) gets the process started, by creating a list
** of all courses which meet the above criteria, then removing all duplicates
** from that list. 
*/

neededCourses(A,B,C) :-
   findall(L, neededCoursesHelper(A,B,L), List),
   removeDuplicates(List, D),
   member(C, D).
   
neededCoursesHelper(CoursesCompleted, Course, RemainingCourses) :-
   allPrereqFor(Course, L),
   \+ containsAntireq(L),
   antireqForList(CoursesCompleted, A),
   \+ containsCourse(L, A),
   subtract(L, CoursesCompleted, RemainingCourses).
 
/* 
** containsCourse(A,B): True if any element in one list matches any element in second list.
*/
containsCourse(A,B) :-
   member(X, A),
   member(Y, B),
   X = Y, !.   

/*
** removeDuplicates : List B is list A without duplicate elements.
** This is used throughout the assignment as a helper.
*/

removeDuplicates([], []).
removeDuplicates([H|T], [H|T1]) :- 
    removeItem(H, T, T2),
    removeDuplicates(T2, T1).

removeItem(_, [], []).
removeItem(X, [X|T], T1) :- removeItem(X, T, T1).
removeItem(X, [H|T], [H|T1]) :-
    X \= H,
    removeItem(X, T, T1).
   