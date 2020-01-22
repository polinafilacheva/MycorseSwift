import UIKit
import Darwin.C.math

//про квадратное уравнение
var a = 7.0
var b = 23.0
var c = 3.0
var x1 = 6.0
var x2 = 9.0

var D = pow(b,2)-4*a*c

if (D<0) {
    print("Нет корней")
}

if (D==0) {
x1 = (-b+sqrt(D))/(2*a)
}

if (D>0) {
    x1 = (-b-sqrt(D))/(2*a)
    x2 = (-b+sqrt(D))/(2*a)
}

//про прямоугольный треугольник

var a1 = 6.0
var b1 = 14.0

var c1 = sqrt(pow(b1,2)+pow(a1,2))
var S = 0.5*(a1*b1)
var P = a1+b1+c1
print(c1)
print(S)
print(P)

//



