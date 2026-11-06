% Lab Activity - Name Game

% Type: "start_game." to run the program.

:- dynamic letter/1.

% Start
start_game :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl, nl,
    menu.

% Menu
menu :-
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    write('|: '),
    read(Choice),
    nl,
    process_choice(Choice).

% 1: Show
process_choice(1) :-
    write('Current letters:'), nl,
    (   letter(L), write(L), write(' '), fail
    ;   nl, nl
    ),
    menu.

% 2: Add
process_choice(2) :-
    write('Enter letter to add: '),
    read(L),
    assert(letter(L)),
    write('Letter added successfully.'), nl, nl,
    menu.

% 3: Add top
process_choice(3) :-
    write('Enter letter to add at the top: '),
    read(L),
    asserta(letter(L)),
    write('Letter added at the top successfully.'), nl, nl,
    menu.

% 4: Add bottom
process_choice(4) :-
    write('Enter letter to add at the bottom: '),
    read(L),
    assertz(letter(L)),
    write('Letter added at the bottom successfully.'), nl, nl,
    menu.

% 5: Delete
process_choice(5) :-
    write('Enter letter to delete: '),
    read(L),
    (   retract(letter(L))
    ->  write('Letter deleted successfully.'), nl, nl
    ;   write('Letter not found in the current set.'), nl, nl
    ),
    menu.

% 6: Delete all
process_choice(6) :-
    retractall(letter(_)),
    write('All letters deleted successfully.'), nl, nl,
    menu.

% 7: Exit
process_choice(7) :-
    write('Exiting the game. Goodbye!'), nl.

% Wrong choice
process_choice(_) :-
    write('Invalid choice! Please try again.'), nl, nl,     
    menu.