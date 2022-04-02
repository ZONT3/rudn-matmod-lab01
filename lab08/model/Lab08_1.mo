model Lab08_1
  parameter Real N = 24 "Целевое число потребителей";
  parameter Real pcr = 21 "Критическая стоимость продукта";
  parameter Real q = 1 "Макс. потребность одного человека";
  parameter Real tau1 = 17 "(1) Длительность производственного цикла";
  parameter Real tau2 = 2 "(2) Длительность производственного цикла";
  parameter Real p1 = 14 "(1) Себестоимость продукта";
  parameter Real p2 = 12 "(2) Себестоимость продукта";

  parameter Real a1 = pcr / (tau1^2 * p1^2 * N * q);
  parameter Real a2 = pcr / (tau2^2 * p2^2 * N * q);
  parameter Real b = pcr / (tau1^2 * p1^2 * tau2^2 * p2^2 * N * q);
  parameter Real c1 = (pcr - p1) / (tau1 * p1);
  parameter Real c2 = (pcr - p2) / (tau2 * p2);
  
  Real theta;
  Real M1(start = 2.6) "(1) Оборотные средства";
  Real M2(start = 1.9) "(2) Оборотные средства";

equation

  der(M1) = M1 - M1 * M2 * b / c1 - M1^2 * a1 / c1;
  der(M2) = M2 * c2 / c1 - M1 * M2 * b / c1 - M2^2 * a2 / c1;
  
  theta = time / c1;
end Lab08_1;
