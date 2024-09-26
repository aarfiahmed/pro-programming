<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Heap Memory Details in JDK 8 and Above</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1, h2, h3 {
            color: #333;
        }
        p {
            margin: 10px 0;
        }
        code {
            background-color: #eaeaea;
            padding: 2px 4px;
            border-radius: 4px;
        }
        ul {
            margin: 10px 0;
            padding-left: 20px;
        }
        li {
            margin: 5px 0;
        }
        pre {
            background-color: #eaeaea;
            padding: 10px;
            border-radius: 4px;
            overflow: auto;
        }
    </style>
</head>
<body>

<h1>Heap Memory Details in JDK 8 and Above</h1>
<p>The heap is a crucial part of memory management in Java, where objects are allocated during runtime. Understanding how the heap is structured and utilized is essential for optimizing Java applications.</p>

<h2>1. Heap Structure</h2>
<p>In Java, the heap is divided into several areas, particularly in JDK 8 and onwards. The main components of the heap include:</p>

<ul>
    <li><strong>Young Generation:</strong> This area is for newly created objects. It is further divided into three sections:</li>
    <ul>
        <li><code>Eden Space:</code> The area where new objects are allocated.</li>
        <li><code>Survivor Spaces:</code> Two spaces (S0 and S1) that hold objects that survive garbage collection from the Eden space.</li>
    </ul>
    <li><strong>Old Generation:</strong> This area stores objects that have existed for a longer duration and are less frequently collected. Objects are promoted to the old generation after surviving several garbage collection cycles in the young generation.</li>
    <li><strong>Metaspace:</strong> Introduced in JDK 8, Metaspace replaces PermGen and stores class metadata. It uses native memory instead of the heap.</li>
</ul>

<h2>2. Heap Memory Allocation</h2>
<p>When an object is created, it is allocated memory in the heap. The allocation process involves:</p>
<ul>
    <li>When a new object is created, memory is allocated from the <code>Eden Space</code>.</li>
    <li>If the <code>Eden Space</code> fills up, a minor garbage collection occurs, where unreachable objects are cleared, and reachable objects are moved to one of the <code>Survivor Spaces</code>.</li>
    <li>Objects that survive multiple garbage collections in the young generation are promoted to the <code>Old Generation</code>.</li>
</ul>

<h2>3. Example of Heap Memory Usage</h2>
<p>Below is a simple Java example demonstrating object allocation and the implications on heap memory:</p>

<pre>
        public class HeapExample {
            public static void main(String[] args) {
                // Creating objects in the young generation
                for (int i = 0; i < 10000; i++) {
                    String str = new String("Example " + i);
                }
                // At this point, objects are mostly in the Eden space

                // Triggering Garbage Collection
                System.gc(); // Suggest to the JVM to run garbage collection

                // More objects are created
                for (int i = 0; i < 5000; i++) {
                    String str = new String("Another Example " + i);
                }
                // Some objects may now be promoted to Survivor or Old Generation
            }
        }
    </pre>

<h2>4. Visual Representation of Heap Memory</h2>
<p>The following is a simplified representation of the heap structure in Java:</p>
<pre>
    +-----------------------------------+
    |             Heap Memory           |
    +-----------------------------------+
    |        Young Generation            |
    |  +-----------------------------+  |
    |  |       Eden Space           |  |
    |  +-----------------------------+  |
    |  |        Survivor Space S0   |  |
    |  +-----------------------------+  |
    |  |        Survivor Space S1   |  |
    |  +-----------------------------+  |
    +-----------------------------------+
    |           Old Generation          |
    +-----------------------------------+
    |           Metaspace              |
    +-----------------------------------+
    </pre>

<h2>5. Conclusion</h2>
<p>The heap structure in JDK 8 and above has evolved to enhance memory management efficiency, particularly with the introduction of Metaspace. Understanding the heap's components and allocation process is vital for optimizing Java applications and ensuring effective memory usage.</p>

</body>
</html>
