clc;
clear;

filename='iris.csv';
tab=readtable(filename);

x1=tab(:,3);
x2=tab(:,4);

out=