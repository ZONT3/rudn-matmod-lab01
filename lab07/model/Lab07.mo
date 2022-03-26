model Lab07
  parameter Real N = 1210;
  parameter Real n0 = 13; 

  Real n1(start = n0);
  Real n2(start = n0);
  Real n3(start = n0);
  
  Real dn2;

equation

  der(n1) = (0.7 + 0.00051 * n1) * (N - n1);
  
  der(n2) = (0.00004 + 0.75 * n2) * (N - n2);
  dn2 = der(n2);
  
  der(n3) = (0.75 * sin(0.5 * time) + 0.35 * cos(0.6 * time) * n3) * (N - n3);

end Lab07;