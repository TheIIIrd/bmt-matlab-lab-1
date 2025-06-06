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

% Параметры моделирования
T = 25;                     % Общее время моделирования
h = 1e-2;                   % Шаг по времени
t = linspace(0, T, T/h);    % Временной вектор
x = zeros(3, length(t));    % Инициализация матрицы состояния

% Воздействие на систему
y = @(tx) 2 * sin(tx);      % Функция воздействия

% Начальные условия
x(:, 1) = [1; 0.5; -1];     % Начальные значения для x1, x2, x3

% Моделирование с использованием метода Рунге-Кутты 4-го порядка
for k = 2:length(t)
    % Вычисление первого приближения с учетом воздействия
    F1 = A * x(:, k-1) + B * y(t(k-1));

    % Вычисление второго приближения
    F2 = A * (x(:, k-1) + 2/3 * h * F1) + B * y(t(k-1) + 2/3 * h);

    % Обновление состояния
    x(:, k) = x(:, k-1) + h/4 * (F1 + 3 * F2);
end

% Построение графиков
figure;
plot(t, x(1, :), '-', 'Color', 'blue', 'LineWidth', 2);     % График x1
hold on;                                                    % Удерживаем текущую фигуру
plot(t, x(2, :), '--', 'Color', 'green', 'LineWidth', 2);   % График x2
grid on;                                                    % Включение сетки
xlabel('t');                                                % Подпись оси X
ylabel('X_1, X_2');                                         % Подпись оси Y
title('y = 2*sin(t), x0 = [1; 0.5; -1]');                   % Заголовок графика

% Добавление легенды
legend('x_1(t)', 'x_2(t)', 'Location', 'best');

% Создание папки graphics, если она не существует
folderName = 'graphics';
if ~exist(folderName, 'dir')
    mkdir(folderName);  % Создание папки
    fprintf('Папка "%s" была создана.\n', folderName);

else
    fprintf('Папка "%s" уже существует.\n', folderName);
end

% Сохранение графика в формате PNG
filePath = fullfile(folderName, 'plot_3.png'); % Полный путь к файлу
try
    saveas(gcf, filePath);
    fprintf('График успешно сохранен в "%s".\n', filePath);

catch ME
    fprintf('Ошибка при сохранении графика: %s\n', ME.message);
end
