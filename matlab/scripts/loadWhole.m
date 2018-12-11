whole = struct;
whole.sample = table2struct( readtable('..\resources\csv\db_stat14.csv') );
index = fieldnames(whole.sample);
whole.n = size({ whole.sample.(index{1}) }', 1);
