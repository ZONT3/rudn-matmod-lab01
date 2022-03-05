model Lab04
  Real x1(start = -2);
  Real y1(start = 0);
  
  Real x2(start = -2);
  Real y2(start = 0);
  
  Real x3(start = -2);
  Real y3(start = 0);
  
equation
  der(x1) = y1;
  der(y1) + 5.5 * x1 = 0;
  
  der(x2) = y2;
  der(y2) + 20 * y2 + 2 * x2 = 0;
  
  der(x3) = y3;
  der(y3) + y3 + 9 * x3 = 2 * sin(time);
  
end Lab04;
