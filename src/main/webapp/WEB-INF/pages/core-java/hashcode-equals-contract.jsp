<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Equals and HashCode Contract</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
            padding: 2px 5px;
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

<h1>Contract between <code>equals()</code> and <code>hashCode()</code> Methods in Java</h1>

<p>The <code>equals()</code> and <code>hashCode()</code> methods are essential for comparing objects in Java. Both methods are used in collections like <code>HashSet</code>, <code>HashMap</code>, and <code>Hashtable</code>. These methods must follow a strict contract to ensure the correctness of operations involving hashing. Let’s explore the contract between these two methods.</p>

<h2>The Contract</h2>
<p>The contract between <code>equals()</code> and <code>hashCode()</code> is as follows:</p>

<ul>
    <li>If two objects are equal according to the <code>equals()</code> method, they must have the same <code>hashCode()</code> value.</li>
    <li>If two objects have the same <code>hashCode()</code> value, they are not necessarily equal according to the <code>equals()</code> method.</li>
    <li>If an object’s state changes in a way that affects its <code>equals()</code> comparison, the <code>hashCode()</code> must also change.</li>
</ul>

<p>This contract ensures that objects that are equal will hash to the same bucket in a hash-based collection like <code>HashMap</code> or <code>HashSet</code>.</p>

<h2>Example: Breaking the Contract</h2>
<p>Consider a class where only <code>equals()</code> is overridden, but <code>hashCode()</code> is not:</p>

<div class="code-block">
    <code>
        class Person {<br>
        &nbsp;&nbsp;&nbsp;private String name;<br>
        &nbsp;&nbsp;&nbsp;private int age;<br><br>
        &nbsp;&nbsp;&nbsp;public Person(String name, int age) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.name = name;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.age = age;<br>
        &nbsp;&nbsp;&nbsp;}<br><br>

        &nbsp;&nbsp;&nbsp;@Override<br>
        &nbsp;&nbsp;&nbsp;public boolean equals(Object obj) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (this == obj) return true;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (obj == null || getClass() != obj.getClass()) return false;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Person person = (Person) obj;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return name.equals(person.name) && age == person.age;<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br><br>

        // Usage in HashMap<br>
        public class TestPerson {<br>
        &nbsp;&nbsp;&nbsp;public static void main(String[] args) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Person p1 = new Person("John", 25);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Person p2 = new Person("John", 25);<br><br>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Adding to HashMap<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HashMap&lt;Person, String&gt; map = new HashMap&lt;&gt;();<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;map.put(p1, "Person 1");<br>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Trying to get the value using p2<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(map.get(p2));  // Output will be null!<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }
    </code>
</div>

<p>In this example, the <code>equals()</code> method is overridden, but <code>hashCode()</code> is not. When adding <code>p1</code> to the <code>HashMap</code>, a hash code is calculated for <code>p1</code>. When trying to retrieve the value using <code>p2</code>, even though <code>p1</code> and <code>p2</code> are equal according to <code>equals()</code>, they have different hash codes, so the <code>HashMap</code> can't find <code>p2</code>.</p>

<h2>Example: Respecting the Contract</h2>
<p>Now, let’s override both <code>equals()</code> and <code>hashCode()</code> correctly:</p>

<div class="code-block">
    <code>
        class Person {<br>
        &nbsp;&nbsp;&nbsp;private String name;<br>
        &nbsp;&nbsp;&nbsp;private int age;<br><br>
        &nbsp;&nbsp;&nbsp;public Person(String name, int age) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.name = name;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.age = age;<br>
        &nbsp;&nbsp;&nbsp;}<br><br>

        &nbsp;&nbsp;&nbsp;@Override<br>
        &nbsp;&nbsp;&nbsp;public boolean equals(Object obj) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (this == obj) return true;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (obj == null || getClass() != obj.getClass()) return false;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Person person = (Person) obj;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return name.equals(person.name) && age == person.age;<br>
        &nbsp;&nbsp;&nbsp;}<br><br>

        &nbsp;&nbsp;&nbsp;@Override<br>
        &nbsp;&nbsp;&nbsp;public int hashCode() {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return Objects.hash(name, age);<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }<br><br>

        // Usage in HashMap<br>
        public class TestPerson {<br>
        &nbsp;&nbsp;&nbsp;public static void main(String[] args) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Person p1 = new Person("John", 25);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Person p2 = new Person("John", 25);<br><br>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Adding to HashMap<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HashMap&lt;Person, String&gt; map = new HashMap&lt;&gt;();<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;map.put(p1, "Person 1");<br>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// Retrieving using p2<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(map.get(p2));  // Output will be "Person 1"<br>
        &nbsp;&nbsp;&nbsp;}<br>
        }
    </code>
</div>

<p>In this corrected example, both <code>p1</code> and <code>p2</code> have the same hash code and are equal according to the <code>equals()</code> method, so retrieving the value from the <code>HashMap</code> works as expected.</p>

<h2>Summary of the Contract</h2>
<ul>
    <li>If two objects are equal, they must have the same hash code.</li>
    <li>If two objects have the same hash code, they may or may not be equal.</li>
    <li>Overriding both <code>equals()</code> and <code>hashCode()</code> correctly ensures proper behavior in collections like <code>HashSet</code> and <code>HashMap</code>.</li>
</ul>

</body>
</html>
