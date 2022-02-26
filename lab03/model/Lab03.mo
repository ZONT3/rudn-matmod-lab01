model Lab03
  parameter Real x0 = 120 "Начальная численность X";
  parameter Real y0 = 90 "Начальная численность Y";
  parameter Real a = 0.24 "Коэфф. собств. потерь X";
  parameter Real h = 0.71 "Коэфф. собств. потерь Y";
  parameter Real c = 0.3 "Эффективность X";
  parameter Real b = 0.61 "Эффективность Y";
  
  Real x(start=x0), y(start=y0);
  
equation
  der(x) = - a * x - b * y + sin(2 * time);
  der(y) = - c * x * y - h * y + cos(3 * time);
  
end Lab03;
