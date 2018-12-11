set(groot,'defaultFigureVisible','off');

%% Q1

addpath('../../Q1');

Q1b;

order = {'mean', 'median', 'mode', 'std'};
xlswrite('resultats.xlsx', stats.dataset.(index{1}){1, order}', 'Feuille 1', 'D2:D5');
xlswrite('resultats.xlsx', stats.dataset.(index{2}){1, order}', 'Feuille 1', 'D6:D9');

Q1c;

order = {'interval', 'proportion'};
xlswrite('resultats.xlsx', stats.dataset.(index{1}){1, order{1}}', 'Feuille 1', 'D10:D11');
xlswrite('resultats.xlsx', stats.dataset.(index{1}){1, order{2}}', 'Feuille 1', 'D12');
xlswrite('resultats.xlsx', stats.dataset.(index{2}){1, order{1}}', 'Feuille 1', 'D13:D14');
xlswrite('resultats.xlsx', stats.dataset.(index{2}){1, order{2}}', 'Feuille 1', 'D15');

Q1d;

order = {'quantile25', 'quantile75'};
xlswrite('resultats.xlsx', stats.dataset.(index{1}){1, order}', 'Feuille 1', 'D16:D17');
xlswrite('resultats.xlsx', stats.dataset.(index{2}){1, order}', 'Feuille 1', 'D18:D19');

Q1e;

order = {'proportion'};
xlswrite('resultats.xlsx', tab{1, order}, 'Feuille 1', 'D20');

Q1f;

order = {'correlation'};
xlswrite('resultats.xlsx', tab{1, order}, 'Feuille 1', 'D21');

rmpath('../../Q1');

%% Q2

addpath('../../Q2');

Q2ai;

order = {'mean', 'median', 'std'};
xlswrite('resultats.xlsx', stats.sample.(index{1}){1, order}', 'Feuille 1', 'D22:D24');
xlswrite('resultats.xlsx', stats.sample.(index{2}){1, order}', 'Feuille 1', 'D25:D27');

Q2aiii;

order = {'ksdist'};
xlswrite('resultats.xlsx', stats.sample.(index{1}){1, order}, 'Feuille 1', 'D28');
xlswrite('resultats.xlsx', stats.sample.(index{2}){1, order}, 'Feuille 1', 'D29');

Q2b;

order = {'mean'};
xlswrite('resultats.xlsx', tab.(index{1}){'mean', order}, 'Feuille 1', 'D30');
xlswrite('resultats.xlsx', tab.(index{2}){'mean', order}, 'Feuille 1', 'D31');
xlswrite('resultats.xlsx', tab.(index{1}){'median', order}, 'Feuille 1', 'D32');
xlswrite('resultats.xlsx', tab.(index{2}){'median', order}, 'Feuille 1', 'D33');
xlswrite('resultats.xlsx', tab.(index{1}){'std', order}, 'Feuille 1', 'D34');
xlswrite('resultats.xlsx', tab.(index{2}){'std', order}, 'Feuille 1', 'D35');

rmpath('../../Q2');

%% Q3

addpath('../../Q3');

Q3a2b;

order = {'gap', 'var'};
xlswrite('resultats.xlsx', tab.(index{1}){'mean', order}', 'Feuille 1', 'D36:D37');
xlswrite('resultats.xlsx', tab.(index{1}){'median', order}', 'Feuille 1', 'D38:D39');

Q3c;

order = {'gap', 'var'};
xlswrite('resultats.xlsx', tab.(index{1}){'mean', order}', 'Feuille 1', 'D40:D41');
xlswrite('resultats.xlsx', tab.(index{1}){'median', order}', 'Feuille 1', 'D42:D43');

Q3d;

order = {'number'};
xlswrite('resultats.xlsx', tab.(index{1}){{'student', 'normal'}, order}, 'Feuille 1', 'D44:D45');

rmpath('../../Q3');

%% Q4

addpath('../../Q4');

Q4;

order = {'Belgium', 'OMS'};
xlswrite('resultats.xlsx', number.(index{1}){1, order}', 'Feuille 1', 'D46:D47');

rmpath('../../Q4');

set(groot,'defaultFigureVisible','on');
