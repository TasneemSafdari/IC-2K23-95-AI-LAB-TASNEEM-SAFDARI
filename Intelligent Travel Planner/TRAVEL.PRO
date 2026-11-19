
DOMAINS
    city = symbol
    citylist = city*
    route_data = result(citylist, integer, integer, integer)
    route_list = route_data*
    inputstr = string

PREDICATES
    connection(city, city, integer, integer, integer)
    road(city, city, integer, integer, integer)
    route(city, city, citylist, citylist, integer, integer, integer)
    not_member(city, citylist)
    safe_route(city, city, city, citylist, integer, integer, integer)
    safe_route_data(city, city, city, route_data)
    get_routes(city, city, city, route_list)
    best_route(route_list, symbol, route_data)
    select_best(route_list, symbol, route_data, route_data)
    score(route_data, symbol, integer)
    start
    plan(city, city, symbol, city)
    str_symbol(string, city)

CLAUSES

connection(a,b,100,2,250).
connection(b,f,250,4,600).
connection(a,c,120,2,400).
connection(c,f,200,3,700).
connection(b,d,150,3,350).
connection(d,e,100,2,200).
connection(e,f,180,3,450).
connection(c,e,160,2,300).

str_symbol(X,Y) :-
    Y = X.

road(X,Y,D,T,C) :-
    connection(X,Y,D,T,C).

road(X,Y,D,T,C) :-
    connection(Y,X,D,T,C).

route(D,D,_,[D],0,0,0).

route(S,D,Visited,[S|Path],Distance,Time,Cost) :-
    road(S,X,D1,T1,C1),
    not_member(X,Visited),
    route(X,D,[X|Visited],Path,D2,T2,C2),
    Distance = D1+D2,
    Time = T1+T2,
    Cost = C1+C2.

not_member(_,[]).

not_member(X,[Y|T]) :-
    X <> Y,
    not_member(X,T).

safe_route(S,D,Avoid,Path,Dist,Time,Cost) :-
    route(S,D,[S],Path,Dist,Time,Cost),
    not_member(Avoid,Path).

safe_route_data(S,D,Avoid,R) :-
    safe_route(S,D,Avoid,Path,Dist,Time,Cost),
    R = result(Path,Dist,Time,Cost).

get_routes(S,D,Avoid,Routes) :-
    findall(R,safe_route_data(S,D,Avoid,R),Routes).

best_route([R|Rest],Preference,Best) :-
    select_best(Rest,Preference,R,Best).

select_best([],_,Best,Best).

select_best([R|Rest],Preference,Current,Best) :-
    score(R,Preference,S1),
    score(Current,Preference,S2),
    S1 < S2,
    select_best(Rest,Preference,R,Best).

select_best([R|Rest],Preference,Current,Best) :-
    score(R,Preference,S1),
    score(Current,Preference,S2),
    S1 >= S2,
    select_best(Rest,Preference,Current,Best).

score(result(_,_,_,Cost),cheapest,Cost).
score(result(_,Dist,_,_),shortest,Dist).
score(result(_,_,Time,_),fastest,Time).

start :-
    write("INTELLIGENT TRAVEL PLANNER"),nl,
    write("Enter source city (a to f): "),
    readln(SourceName),
    str_symbol(SourceName,Source),
    write("Enter destination city (a to f): "),
    readln(DestinationName),
    str_symbol(DestinationName,Destination),
    write("Enter city to avoid (or none): "),
    readln(AvoidName),
    str_symbol(AvoidName,Avoid),
    write("Enter preference (cheapest, shortest, fastest): "),
    readln(PreferenceName),
    str_symbol(PreferenceName,Preference),
    plan(Source,Destination,Preference,Avoid).

plan(Source,Destination,_,Avoid) :-
    get_routes(Source,Destination,Avoid,Routes),
    Routes = [],
    write("No route available."),nl.

plan(Source,Destination,Preference,Avoid) :-
    get_routes(Source,Destination,Avoid,Routes),
    Routes = [_|_],
    best_route(Routes,Preference,result(Path,D,T,C)),
    nl,
    write("RECOMMENDED ROUTE"),nl,
    write("Route: ",Path),nl,
    write("Total Distance: ",D," km"),nl,
    write("Total Time: ",T," hours"),nl,
    write("Total Cost: Rs. ",C),nl,
    write("Preference: ",Preference),nl.

GOAL
    start.

