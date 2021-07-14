---
title: Combinatoric selections
---
# Problem 53

There are exactly ten ways of selecting three from five, 12345:

$$123, 124, 125, 134, 135, 145, 234, 235, 245, \text{ and } 345$$

In combinatorics, we use the notation, $^5C_3 = 10$.

In general,

$$^nC_r = \frac{n!}{r!(n-r)!}, \text{ where } r \leq n, n! = n\times(n-1)\times...\times3\times2\times1, \text{ and } 0! = 1.$$

It is not until $n = 23$, that a value exceeds one-million: $^{23}C_{10} = 1144066$.

How many, not necessarily distinct, values of  $^nC_r$, for $1 \leq n \leq 100$, are greater than one-million?
