clc;            % Очистка командного окна
clear all;      % Очистка всех переменных из рабочей области
close all;      % Закрытие всех открытых графиков

% Задание параметров системы
a0 = 5;
a1 = 4;
a2 = 2;
a3 = 1;
b0 = 5;

% Приведение системы к форме Коши
A = [0,      1,       0;
     0,      0,       1;
     -a0/a3, -a1/a3,  -a2/a3];

B = [0; 
     0; 
     b0/a3];

% Вывод данных в консоль
fprintf('Параметры системы:\n');
fprintf('a0 = %.2f\n', a0);
fprintf('a1 = %.2f\n', a1);
fprintf('a2 = %.2f\n', a2);
fprintf('a3 = %.2f\n', a3);
fprintf('b0 = %.2f\n\n', b0);

fprintf('Матрица A:\n');
disp(A);

fprintf('Матрица B:\n');
disp(B);
