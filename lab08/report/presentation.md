---
marp: true

mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
---

<style>
section.titleslide h6
{
    text-align: right;
}
section.titleslide
{
    text-align: center;
}
</style>

<!-- _class: titleslide -->

#### РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ
#### Факультет физико-математических и естественных наук  
#### Кафедра прикладной информатики и теории вероятностей 
#### ПРЕЗЕНТАЦИЯ ПО ЛАБОРАТОРНОЙ РАБОТЕ №8
#### "Модель конкуренции двух фирм"

###### дисциплина: Математическое моделирование
###### Преподователь: Кулябов Дмитрий Сергеевич
###### Студент: Вейценфельд Даниил Анатольевич
###### Группа: НФИбд-01-19
МОСКВА
2022 г.

---

# **Структура**

- Теоретическое введение
- Работа в OpenModelica

---

# **Цель работы**

Построить графики оборотных средств двух фирм без учета потоянных
издержек и с введенной нормировкой для двух случаев.

---

# **Задачи для выполнения лабораторной работы**

1. Постройте графики изменения оборотных средств фирмы 1 и фирмы 2 без
учета постоянных издержек и с веденной нормировкой для случая 1.
2. Постройте графики изменения оборотных средств фирмы 1 и фирмы 2 без
учета постоянных издержек и с веденной нормировкой для случая 2

Параметры для задачи:

$M_0^1 = 2.6, M_0^2 = 1.9$

$p_{cr} = 21, N = 24, q = 1$

$\tau_1 = 17, \tau_2 = 2$

$\tilde{p}_1 = 14, \tilde{p}_2 = 12$

---

# **Модель конкуренции двух фирм. Первый случай**

$$
\begin{aligned}
&\frac{d M_{1}}{d \theta}=M_{1}-\frac{b}{c_{1}} M_{1} M_{2}-\frac{a_{1}}{c_{1}} M_{1}^{2} \\
&\frac{d M_{2}}{d \theta}=\frac{c_{2}}{c_{1}} M_{2}-\frac{b}{c_{1}} M_{1} M_{2}-\frac{a_{2}}{c_{1}} M_{2}^{2}
\end{aligned}
$$

$a_{1}=\frac{p_{c r}}{\tau_{1}^{2} \tilde{p}_{1}^{2} N q}$, $a_{2}=\frac{p_{c r}}{\tau_{2}^{2} \tilde{p}_{2}^{2} N q}$, 

$b=\frac{p_{c r}}{\tau_{1}^{2} \tilde{p}_{1}^{2} \tau_{2}^{2} \tilde{p}_{2}^{2} N q}$, 

$c_{1}=\frac{p_{c r}-\tilde{p}_{1}}{\tau_{1} \tilde{p}_{1}}$, $c_{2}=\frac{p_{c r}-\tilde{p}_{2}}{\tau_{2} \tilde{p}_{2}}$.

Также введена нормировка $t = c_1 \theta$

---

# **Модель в OpenModelica**

```m
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
```

---

```m
equation

  der(M1) = M1 - M1 * M2 * b / c1 - M1^2 * a1 / c1;
  der(M2) = M2 * c2 / c1 - M1 * M2 * b / c1 - M2^2 * a2 / c1;
  
  theta = time / c1;
end Lab08_1;
```

---

# **Объемы продаж**

![График оборотных средств в фирмах 1 и 2](assets/2022-04-02-17-22-08.png){ width=100% }

---

# **Модель конкуренции двух фирм. Второй случай**

$$
\begin{aligned}
&\frac{d M_{1}}{d \theta}=M_{1}-\left(\frac{b}{c_{1}}+0,0018\right) M_{1} M_{2}-\frac{a_{1}}{c_{1}} M_{1}^{2} \\
&\frac{d M_{2}}{d \theta}=\frac{c_{2}}{c_{1}} M_{2}-\frac{b}{c_{1}} M_{1} M_{2}-\frac{a_{2}}{c_{1}} M_{2}^{2}
\end{aligned}
$$

---

# **Модель**

```m
model Lab08_2
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
```

---

```m
equation

  der(M1) = M1 - M1 * M2 * (b / c1 + 0.0018) - M1^2 * a1 / c1;
  der(M2) = M2 * c2 / c1 - M1 * M2 * b / c1 - M2^2 * a2 / c1;
  
  theta = time / c1;
end Lab08_2;
```

---

# **Объемы продаж**

![График первого и второго случаев.](assets/2022-04-02-17-44-00.png){ width=100% }

---

# Выводы


