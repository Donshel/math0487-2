%% Calls

run('..\Q1\Q1b');

%% Parameters

n = 20;

%% Setup

sub = struct;
sub.sample = whole.sample( randi([1 whole.n], n, 1) );
sub.n = n;