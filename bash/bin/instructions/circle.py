h#!/usr/bin/env python3

import turtle, math
#s = turtle.getscreen()
t = turtle.Turtle()
arr=[['Цель',9],['Отношения',8],['Здоровье',3], ['Обучение', 9], ['Развлечения', 5]]

turtle.bgcolor('#333')
#turtle.color('#0f0')
t.shapesize(3, 3, 3)
t.pensize(3)
angle = 2 *math.pi / len(arr)

def draw(a, i, size):
    t.goto(math.sin(a * i - a/2) * size, math.cos(a * i - a/2) * size)
    t.goto(math.sin(a * i + a/2) * size, math.cos(a * i + a/2) * size)
    t.goto(0,0)
    
t.speed(10)
t.color('#fff', '#555')
t.begin_fill()
for i,x in enumerate(arr):
  draw(angle, i, 300)
t.end_fill()

t.speed(3)
t.color('#0f0', '#777')

for i,x in enumerate(arr):
  t.begin_fill()
  draw(angle, i, 30 * x[1])
  t.end_fill()
  t.penup()
  t.goto(math.sin(angle * i) * 150, math.cos(angle * i) * 150 - 8)
  t.pendown()
  t.write(x[0], align='center', font=('Arial', 6))
  t.penup()
  t.home()
  t.pendown()

turtle.done()
