data = table2struct(readtable('resources/csv/db_stat14.csv'));
index = fieldnames(data);
l = size(index, 1);
h = size({data(:).(index{1})}', 1);