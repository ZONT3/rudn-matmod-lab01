model Lab05
  parameter Real a = 0.21;
  parameter Real b = 0.049;
  parameter Real c = 0.41;
  parameter Real d = 0.037;
    
  Real x(start = 14) "Хищники";
  Real y(start = 19) "Жертвы";
  
  Real x_stat;
  Real y_stat;

equation
  der(x) = - a * x + b * x * y;
  der(y) = c * y - d * x * y;
  
  x_stat = c / d;
  y_stat = a / b;
end Lab05;
