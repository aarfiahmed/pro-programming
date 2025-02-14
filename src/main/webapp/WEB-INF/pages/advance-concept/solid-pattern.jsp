<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SOLID Principles in OOP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1, h2 {
            color: #333;
        }
        p {
            margin: 10px 0;
        }
        code {
            background-color: #eaeaea;
            padding: 3px 5px;
            border-radius: 4px;
        }
        .code-block {
            background-color: #333;
            color: black;
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            font-family: monospace;
        }
    </style>
</head>
<body>

<h1>SOLID Principles in Object-Oriented Programming</h1>
<p>SOLID is an acronym that represents five design principles that help developers write clean, maintainable, and scalable code. These principles are essential for writing better object-oriented programs. Let's explore each of the SOLID principles with examples.</p>

<h2>1. Single Responsibility Principle (SRP)</h2>
<p>A class should have only one reason to change, meaning it should have only one job or responsibility.</p>
<p>Example: Instead of having a class that handles both user validation and database operations, you can separate them:</p>

<div class="code-block">
    <code>
        // Not following SRP<br>
        class UserService {<br>
        &nbsp;&nbsp;&nbsp;public void registerUser(String username, String password) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Validate user<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Save to database<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br><br>

        // Following SRP<br>
        class UserValidator {<br>
        &nbsp;&nbsp;&nbsp;public boolean isValid(String username, String password) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Validation logic<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return true;<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br>
        class UserRepository {<br>
        &nbsp;&nbsp;&nbsp;public void saveUser(String username, String password) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Save to database<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br>
    </code>
</div>

<h2>2. Open/Closed Principle (OCP)</h2>
<p>Software entities (classes, modules, functions) should be open for extension but closed for modification.</p>
<p>Example: To extend a system without modifying existing code, you can use interfaces or abstract classes:</p>

<div class="code-block">
    <code>
        // Not following OCP<br>
        class Rectangle {<br>
        &nbsp;&nbsp;&nbsp;public int width, height;<br>
        }<br>
        class AreaCalculator {<br>
        &nbsp;&nbsp;&nbsp;public int calculateArea(Rectangle r) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return r.width * r.height;<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br><br>

        // Following OCP<br>
        interface Shape {<br>
        &nbsp;&nbsp;&nbsp;public int calculateArea();<br>
        }<br>
        class Rectangle implements Shape {<br>
        &nbsp;&nbsp;&nbsp;public int width, height;<br>
        &nbsp;&nbsp;&nbsp;public int calculateArea() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return width * height;<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br>
        class Circle implements Shape {<br>
        &nbsp;&nbsp;&nbsp;public int radius;<br>
        &nbsp;&nbsp;&nbsp;public int calculateArea() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return (int) (Math.PI * radius * radius);<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br>
    </code>
</div>

<h2>3. Liskov Substitution Principle (LSP)</h2>
<p>Objects of a superclass should be replaceable with objects of a subclass without affecting the correctness of the program.</p>
<p>Example: A subclass should override methods in a way that does not break the functionality of the parent class:</p>

<div class="code-block">
    <code>
        // Violating LSP<br>
        class Bird {<br>
        &nbsp;&nbsp;&nbsp;public void fly() {}<br>
        }<br>
        class Ostrich extends Bird {<br>
        &nbsp;&nbsp;&nbsp;public void fly() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Ostrich can't fly, so this violates LSP<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br><br>

        // Following LSP<br>
        class Bird {<br>
        &nbsp;&nbsp;&nbsp;public void move() {}<br>
        }<br>
        class Ostrich extends Bird {<br>
        &nbsp;&nbsp;&nbsp;public void move() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Ostrich walks<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br>
        class Sparrow extends Bird {<br>
        &nbsp;&nbsp;&nbsp;public void move() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Sparrow flies<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br>
    </code>
</div>

<h2>4. Interface Segregation Principle (ISP)</h2>
<p>Clients should not be forced to depend on interfaces they do not use. Instead of having large interfaces, break them into smaller, more specific ones.</p>
<p>Example: Instead of having a single interface that forces classes to implement methods they don’t need:</p>

<div class="code-block">
    <code>
        // Not following ISP<br>
        interface Worker {<br>
        &nbsp;&nbsp;&nbsp;public void work();<br>
        &nbsp;&nbsp;&nbsp;public void eat();<br>
        }<br>
        class Robot implements Worker {<br>
        &nbsp;&nbsp;&nbsp;public void work() {}<br>
        &nbsp;&nbsp;&nbsp;public void eat() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Robots don't eat, this violates ISP<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br><br>

        // Following ISP<br>
        interface Workable {<br>
        &nbsp;&nbsp;&nbsp;public void work();<br>
        }<br>
        interface Eatable {<br>
        &nbsp;&nbsp;&nbsp;public void eat();<br>
        }<br>
        class Robot implements Workable {<br>
        &nbsp;&nbsp;&nbsp;public void work() {}<br>
        }<br>
        class Human implements Workable, Eatable {<br>
        &nbsp;&nbsp;&nbsp;public void work() {}<br>
        &nbsp;&nbsp;&nbsp;public void eat() {}<br>
        }<br>
    </code>
</div>

<h2>5. Dependency Inversion Principle (DIP)</h2>
<p>High-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details; details should depend on abstractions.</p>
<p>Example: Rather than having high-level modules depend on specific implementations, you can depend on abstractions (interfaces):</p>

<div class="code-block">
    <code>
        // Not following DIP<br>
        class Light {<br>
        &nbsp;&nbsp;&nbsp;public void turnOn() {}<br>
        }<br>
        class Switch {<br>
        &nbsp;&nbsp;&nbsp;private Light light;<br>
        &nbsp;&nbsp;&nbsp;public Switch(Light light) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.light = light;<br>
        &nbsp;&nbsp;&nbsp;}<br>
        &nbsp;&nbsp;&nbsp;public void operate() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;light.turnOn();<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br><br>

        // Following DIP<br>
        interface Switchable {<br>
        &nbsp;&nbsp;&nbsp;public void turnOn();<br>
        }<br>
        class Light implements Switchable {<br>
        &nbsp;&nbsp;&nbsp;public void turnOn() {}<br>
        }<br>
        class Fan implements Switchable {<br>
        &nbsp;&nbsp;&nbsp;public void turnOn() {}<br>
        }<br>
        class Switch {<br>
        &nbsp;&nbsp;&nbsp;private Switchable device;<br>
        &nbsp;&nbsp;&nbsp;public Switch(Switchable device) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.device = device;<br>
        &nbsp;&nbsp;&nbsp;}<br>
        &nbsp;&nbsp;&nbsp;public void operate() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;device.turnOn();<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br>
    </code>
</div>

</body>
</html>
