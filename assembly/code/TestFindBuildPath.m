function [partXY]=TestFindBuildPath()
%Test cases for FindBuildPath
%%Authors: Sheryl Manzoor, smanzoor2@uh.edu and Aaron T. Becker, atbecker@uh.edu, Oct 19, 2016


%zigzag
%partXY = [1 2;2 2;3 2;4 3;5 3;4 2]; %contains the item positions for the Part


%simplest 1 line and loop
%partXY =[2, 3, 4, 2, 4, 2, 3, 4, ;...
%4, 4, 4, 5, 5, 6, 6, 6, ]';
% partXY =[4, 4, 2, 3, 4, 2, 4, 2, 3, 4, ;...
% 2, 3, 4, 4, 4, 5, 5, 6, 6, 6, ]';
%partXY =[ 3, 4, 4, 2, 3, 4, 2, 4, 2, 3, 4, ;...
% 2, 2, 3, 4, 4, 4, 5, 5, 6, 6, 6, ]';
%partXY =[2, 3, 4, 4, 2, 3, 4, 2, 4, 2, 3, 4, ;...
%2, 2, 2, 3, 4, 4, 4, 5, 5, 6, 6, 6, ]';


%1 line and loop
%partXY =[2, 3, 4, 5, 6, 6, 2, 3, 4, 5, 6, 2, 6, 2, 6, 2, 3, 4, 5, 6, ;...
%2, 2, 2, 2, 2, 3, 4, 4, 4, 4, 4, 5, 5, 6, 6, 7, 7, 7, 7, 7, ]';

%simple spiral
% =[2, 3, 4, 5, 6, 6, 2, 3, 4, 6, 2, 6, 2, 6, 2, 3, 4, 5, 6, ;...
%2, 2, 2, 2, 2, 3, 4, 4, 4, 4, 5, 5, 6, 6, 7, 7, 7, 7, 7, ]';

%2 ring spiral
%partXY = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11, 2, 3, 4, 5, 6, 7, 8, 9, 11, 2, 9, 11, 2, 4, 5, 6, 7, 9, 11, 2, 4, 9, 11, 2, 4, 9, 11, 2, 4, 5, 6, 7, 8, 9, 11, 2, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ;...
%3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, ]';


% '#' shaped part
% partXY=[7 6;9 6;6 7;7 7;8 7;9 7;10 7;7 8;9 8;6 9;7 9;8 9;9 9;10 9;7 10;9 10];
 
% Spiral part inner node [5 5]
% partXY=[4 2;5 2;6 2;7 2; 8 2; 8 3; 8 4; 8 5; 8 6; 8 7; 7 7; 6 7; 5 7; 4 7; 4 3; 4 4;4 5;5 5];    

%         part in BS thesis
%partXY=[5,2;6,2;7,2;8,2;9,2;10,2;5,3;5,4;6,4;7,4;8,4;9,4;10,4;5,5;10,5;5,6;7,6;8,6;10,6;5,7;7,7;10,7;5,8;7,8;8,8;9,8;10,8;10,9;10,10;10,11;10,12;9,10;9,12;8,10;8,12;7,10;7,12;6,10;6,12;5,10;5,11;5,12];

%Two spirals case: returns moveValid 'false'
% partXY=[5 2;6 2;7 2;8 2;9 2;10 2;5 3;5 4;5 5;5 6;6 6;7 6;8 6;8 5;8 4;7 4;10 3;10 4; 10 5;10 6;10 7;10 8;10 9;10 10;10 11;10 12;9 12;8 12;7 12;6 12;5 12;5 11;5 10;5 9;5 8;6 8;7 8;8 8;8 9;8 10;7 10];  

%interesting part
partXY =[    5     2;6     2;     7     2;     8     2;     9     2;     3     3;     4     3;     5     3;     9     3;    10     3;    11     3;     2     4;     3     4;     6     4;     7     4;     8     4;    11     4;    12     4;     2     5;     4     5;     5     5;     6     5;     8     5;     9     5;    10     5;    12     5;    13     5;     2     6;     4     6;     7     6;    10     6;    11     6;    13     6;     2     7;     4     7;     5     7;     6     7;     7     7;     8     7;     9     7;    11     7;    13     7;     2     8;     3     8;     7     8;    10     8;    11     8;    13     8;     3     9;     4     9;     5     9;     6     9;     8     9;     9     9;    10     9;    12     9;    13     9;     1    10;     2    10;     6    10;     7    10;     8    10;    11    10;    12    10;     2    11;     3    11;     4    11;     5    11;     9    11;10    11;11    11;5    12;6    12; 7    12;8    12;9    12];

end