<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Garbage Collectors in JDK 8 and Above</title>
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
    </style>
</head>
<body>

<h1>Garbage Collectors in JDK 8 and Above</h1>
<p>Garbage collection in Java is an automatic process that manages memory by identifying and reclaiming memory that is no longer in use. Since JDK 8, several garbage collectors have been introduced or enhanced to improve memory management and application performance.</p>

<h2>1. Key Garbage Collectors</h2>

<h3>1.1. G1 Garbage Collector (Garbage-First)</h3>
<p>The G1 garbage collector was designed to provide high throughput with predictable pause times, especially suitable for applications with large heaps.</p>
<ul>
    <li><strong>Heap Structure:</strong> G1 divides the heap into multiple regions of equal size, which can belong to the young generation, old generation, or be empty.</li>
    <li><strong>Concurrent Collection:</strong> Most work is done concurrently with application threads, minimizing stop-the-world (STW) pauses.</li>
    <li><strong>Configurable Pause Time:</strong> Developers can set a target pause time using <code>-XX:MaxGCPauseMillis</code>.</li>
</ul>

<h3>1.2. Parallel Garbage Collector</h3>
<p>This collector focuses on maximizing throughput by using multiple threads for garbage collection tasks.</p>
<ul>
    <li><strong>Generations:</strong> Maintains traditional young and old generations.</li>
    <li><strong>Minor and Major GC:</strong> Performs collections in the young generation (minor) and the old generation (major).</li>
    <li><strong>Usage:</strong> Suitable for applications where throughput is prioritized over response time.</li>
</ul>

<h3>1.3. Concurrent Mark-Sweep (CMS) Garbage Collector</h3>
<p>CMS is designed to minimize pause times by performing most of its work concurrently.</p>
<ul>
    <li><strong>Phases:</strong>
        <ul>
            <li><code>Initial Mark</code>: A short pause to mark reachable objects.</li>
            <li><code>Concurrent Mark</code>: Runs concurrently to mark objects.</li>
            <li><code>Remark</code>: Another short pause to finalize marking.</li>
            <li><code>Concurrent Sweep</code>: Reclaims memory from unreachable objects.</li>
        </ul>
    </li>
    <li><strong>Weaknesses:</strong> Can suffer from fragmentation and longer pauses if not tuned properly.</li>
</ul>

<h3>1.4. Epsilon Garbage Collector</h3>
<p>Introduced in JDK 11, Epsilon is a no-op garbage collector that does not reclaim memory, allowing allocation until the application runs out of memory.</p>
<ul>
    <li><strong>Use Cases:</strong> Useful for testing and performance benchmarking, where GC overhead is undesirable.</li>
</ul>

<h3>1.5. Z Garbage Collector (ZGC)</h3>
<p>ZGC is designed for low-latency applications and was introduced in JDK 11 as an experimental feature.</p>
<ul>
    <li><strong>Region-Based Heap:</strong> Manages the heap in regions, focusing on minimizing pause times.</li>
    <li><strong>Concurrent Execution:</strong> Most operations are performed concurrently with the application, achieving low pause times.</li>
    <li><strong>Usage:</strong> Suitable for applications requiring very low pause times.</li>
</ul>

<h3>1.6. Shenandoah Garbage Collector</h3>
<p>Shenandoah was introduced as an experimental feature in JDK 12 and made stable in JDK 14, focusing on low-pause-time collection.</p>
<ul>
    <li><strong>Concurrent Compaction:</strong> Includes a concurrent compaction phase to minimize fragmentation.</li>
    <li><strong>Region-Based Management:</strong> Like ZGC, it works with regions and aims to minimize pause times.</li>
    <li><strong>Usage:</strong> Best for applications that require both low pause times and effective memory reclamation.</li>
</ul>

<h2>2. Tuning Garbage Collectors</h2>
<p>Garbage collectors can be fine-tuned using various JVM flags:</p>
<ul>
    <li><code>-XX:+UseG1GC</code>: Enables the G1 Garbage Collector.</li>
    <li><code>-XX:+UseConcMarkSweepGC</code>: Enables the CMS Garbage Collector.</li>
    <li><code>-XX:+UseEpsilonGC</code>: Enables the Epsilon Garbage Collector.</li>
    <li><code>-XX:MaxGCPauseMillis=<n></code>: Sets a target for maximum pause time for G1.</li>
    <li><code>-XX:G1HeapRegionSize=<size></code>: Sets the size of G1 heap regions.</li>
    <li><code>-XX:MetaspaceSize=<size></code>: Sets the initial size for Metaspace.</li>
</ul>

<h2>3. Conclusion</h2>
<p>Starting from JDK 8, Java has introduced several garbage collectors, each tailored for different performance needs and application types. The evolution from G1, Epsilon, ZGC, to Shenandoah represents significant advancements in Java's memory management capabilities. With ongoing improvements, developers can choose the most suitable garbage collector based on their application requirements, balancing throughput, pause times, and memory usage.</p>

</body>
</html>
