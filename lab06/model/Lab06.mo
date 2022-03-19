model Lab06
  parameter Real N = 15500;
  parameter Real I0 = 115;
  parameter Real R0 = 15;
  parameter Real S0 = N - I0 - R0;
  
  parameter Real a = 0.01;
  parameter Real b = 0.02;
  
  Real I1(start = I0);
  Real R1(start = R0);
  Real S1(start = S0);
  Real I2(start = I0);
  Real R2(start = R0);
  Real S2(start = S0);

equation
  der(S1) = 0;
  der(I1) = - b * I1;
  der(R1) = b * I1;
  
  der(S2) = - a * S2;
  der(I2) = a * S2 - b * I2;
  der(R2) = b * I2;
end Lab06;