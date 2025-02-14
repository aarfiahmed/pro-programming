<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Multithreading Concepts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }
        pre {
            background-color: #f4f4f4;
            padding: 10px;
            border: 1px solid #ddd;
            overflow-x: auto;
        }
        code {
            font-family: monospace;
            color: #d63384;
        }
        h1, h2, h3 {
            color: #0056b3;
        }
    </style>
</head>
<body>

<h1>Java Multithreading Concepts</h1>

<p>In Java, multithreading is the ability of a program to perform multiple tasks simultaneously by using multiple threads. A <strong>thread</strong> is a lightweight process, and <strong>multithreading</strong> allows multiple threads to run concurrently, which is essential for tasks like parallel processing and improving application performance.</p>

<h2>1. Thread Class and Runnable Interface</h2>

<p>Java provides two main ways to create a thread:</p>
<ul>
    <li>By extending the <code>Thread</code> class.</li>
    <li>By implementing the <code>Runnable</code> interface.</li>
</ul>

<h3>Example: Creating a thread by extending the Thread class</h3>
<pre><code>class MyThread extends Thread {
    public void run() {
        System.out.println("Thread is running.");
    }
}

public class ThreadExample {
    public static void main(String[] args) {
        MyThread thread = new MyThread();
        thread.start();  // Starts the thread and invokes the run() method
    }
}
</code></pre>

<h3>Example: Creating a thread by implementing the Runnable interface</h3>
<pre><code>class MyRunnable implements Runnable {
    public void run() {
        System.out.println("Thread is running via Runnable.");
    }
}

public class RunnableExample {
    public static void main(String[] args) {
        MyRunnable myRunnable = new MyRunnable();
        Thread thread = new Thread(myRunnable);
        thread.start();  // Starts the thread and invokes the run() method of MyRunnable
    }
}
</code></pre>

<h2>2. Thread Lifecycle</h2>

<p>A thread in Java can be in one of the following states:</p>
<ul>
    <li><strong>New</strong>: Thread is created but not yet started.</li>
    <li><strong>Runnable</strong>: Thread is running or ready to run.</li>
    <li><strong>Blocked</strong>: Thread is waiting for a resource (e.g., waiting for a lock).</li>
    <li><strong>Waiting</strong>: Thread is waiting indefinitely for another thread to perform a task.</li>
    <li><strong>Timed Waiting</strong>: Thread is waiting for a specified amount of time.</li>
    <li><strong>Terminated</strong>: Thread has finished execution.</li>
</ul>

<h2>3. Thread Methods</h2>

<p>Some useful thread methods include:</p>
<ul>
    <li><code>start()</code>: Starts the execution of the thread and calls the <code>run()</code> method.</li>
    <li><code>run()</code>: The method executed when a thread is started.</li>
    <li><code>sleep(long millis)</code>: Causes the thread to sleep (pause execution) for the specified duration.</li>
    <li><code>join()</code>: Waits for the thread to die (i.e., complete execution).</li>
    <li><code>interrupt()</code>: Interrupts a thread that is sleeping, waiting, or blocked.</li>
    <li><code>isAlive()</code>: Checks if the thread is alive.</li>
</ul>

<h3>Example: <code>join()</code> and <code>sleep()</code></h3>
<pre><code>class MyRunnable implements Runnable {
    public void run() {
        for (int i = 0; i &lt; 5; i++) {
            System.out.println(Thread.currentThread().getName() + " - " + i);
            try {
                Thread.sleep(1000);  // Sleep for 1 second
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

public class JoinExample {
    public static void main(String[] args) throws InterruptedException {
        Thread t1 = new Thread(new MyRunnable(), "Thread-1");
        Thread t2 = new Thread(new MyRunnable(), "Thread-2");

        t1.start();
        t1.join();  // Main thread waits for t1 to finish before starting t2

        t2.start();
    }
}
</code></pre>

<h2>4. Synchronization</h2>

<p>In multithreaded programming, multiple threads may try to access shared resources concurrently, which can lead to data inconsistencies. <strong>Synchronization</strong> ensures that only one thread can access the shared resource at a time.</p>

<p><code>synchronized</code> blocks or methods ensure that only one thread at a time can execute a particular section of code.</p>

<h3>Example: Synchronized Method</h3>
<pre><code>class Counter {
    private int count = 0;

    public synchronized void increment() {
        count++;  // Critical section
    }

    public int getCount() {
        return count;
    }
}

public class SynchronizationExample {
    public static void main(String[] args) throws InterruptedException {
        Counter counter = new Counter();

        Runnable task = () -> {
            for (int i = 0; i &lt; 1000; i++) {
                counter.increment();
            }
        };

        Thread t1 = new Thread(task);
        Thread t2 = new Thread(task);

        t1.start();
        t2.start();

        t1.join();
        t2.join();

        System.out.println("Final count: " + counter.getCount());  // Will always be 2000 due to synchronization
    }
}
</code></pre>

<h2>5. Locks and ReentrantLock</h2>

<p>Java provides a more flexible mechanism for synchronization using the <code>Lock</code> interface from the <code>java.util.concurrent.locks</code> package. A commonly used implementation is <code>ReentrantLock</code>.</p>

<h3>Example: Using <code>ReentrantLock</code></h3>
<pre><code>import java.util.concurrent.locks.ReentrantLock;

class Counter {
    private int count = 0;
    private final ReentrantLock lock = new ReentrantLock();

    public void increment() {
        lock.lock();  // Acquires the lock
        try {
            count++;
        } finally {
            lock.unlock();  // Releases the lock
        }
    }

    public int getCount() {
        return count;
    }
}

public class ReentrantLockExample {
    public static void main(String[] args) throws InterruptedException {
        Counter counter = new Counter();

        Runnable task = () -> {
            for (int i = 0; i &lt; 1000; i++) {
                counter.increment();
            }
        };

        Thread t1 = new Thread(task);
        Thread t2 = new Thread(task);

        t1.start();
        t2.start();

        t1.join();
        t2.join();

        System.out.println("Final count: " + counter.getCount());  // Will always be 2000 due to locking
    }
}
</code></pre>

<h2>6. Executor Framework</h2>

<p>The <strong>Executor Framework</strong> provides a higher-level alternative to manually creating and managing threads. It is part of the <code>java.util.concurrent</code> package and provides thread pools, allowing the reuse of threads and better resource management.</p>

<h3>Example: Using <code>ExecutorService</code></h3>
<pre><code>import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ExecutorServiceExample {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(3);  // Thread pool with 3 threads

        for (int i = 0; i &lt; 5; i++) {
            Runnable worker = new WorkerThread("" + i);
            executor.execute(worker);  // Submitting tasks to the thread pool
        }

        executor.shutdown();  // Gracefully shutdown the ExecutorService
        while (!executor.isTerminated()) {
        }

        System.out.println("All threads are finished.");
    }
}

class WorkerThread implements Runnable {
    private final String task;

    public WorkerThread(String task) {
        this.task = task;
    }

    public void run() {
        System.out.println(Thread.currentThread().getName() + " is executing task: " + task);
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
</code></pre>

<h2>7. Callable and Future</h2>

<p><code>Callable</code> is similar to <code>Runnable</code> but can return a result and throw a checked exception. The result can be retrieved using the <code>Future</code> object.</p>

<h3>Example: Using <code>Callable</code> and <code>Future</code></h3>
<pre><code>import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class CallableExample {
    public static void main(String[] args) throws InterruptedException, ExecutionException {
        ExecutorService executor = Executors.newFixedThreadPool(2);

        Callable&lt;Integer&gt; task = () -> {
            Thread.sleep(1000);
            return 123;
        };

        Future&lt;Integer&gt; future = executor.submit(task);

        System.out.println("Task submitted. Waiting for result...");
        Integer result = future.get();  // Blocks until the result is available
        System.out.println("Result: " + result);

        executor.shutdown();
    }
}
</code></pre>

<h2>8. ForkJoin Framework</h2>

<p>The <strong>ForkJoin Framework</strong> is designed for divide-and-conquer algorithms where tasks are recursively broken down into smaller tasks. This framework is ideal for tasks that can be solved using parallelism.</p>

<h3>Example: Using <code>ForkJoinPool</code> for parallel sum</h3>
<pre><code>import java.util.concurrent.RecursiveTask;
import java.util.concurrent.ForkJoinPool;

class SumTask extends RecursiveTask&lt;Integer&gt; {
    private static final int THRESHOLD = 10;
    private final int[] array;
    private final int start, end;

    public SumTask(int[] array, int start, int end) {
        this.array = array;
        this.start = start;
        this.end = end;
    }

    @Override
    protected Integer compute() {
        if (end - start &lt;= THRESHOLD) {
            int sum = 0;
            for (int i = start; i &lt; end; i++) {
                sum += array[i];
            }
            return sum;
        } else {
            int mid = (start + end) / 2;
            SumTask leftTask = new SumTask(array, start, mid);
            SumTask rightTask = new SumTask(array, mid, end);

            leftTask.fork();  // Run left task asynchronously
            int rightResult = rightTask.compute();  // Compute right task directly
            int leftResult = leftTask.join();  // Wait for the left task to finish

            return leftResult + rightResult;
        }
    }
}

public class ForkJoinExample {
    public static void main(String[] args) {
        int[] array = new int[100];
        for (int i = 0; i &lt; array.length; i++) {
            array[i] = i + 1;
        }

        ForkJoinPool pool = new ForkJoinPool();
        SumTask task = new SumTask(array, 0, array.length);

        int sum = pool.invoke(task);
        System.out.println("Sum of the array: " + sum);
    }
}
</code></pre>

<h2>9. Producer-Consumer with BlockingQueue</h2>

<p>The <strong>Producer-Consumer</strong> pattern is where one thread produces data, and another thread consumes it. Java's <code>BlockingQueue</code> makes this easy by handling the synchronization required for the producer-consumer relationship.</p>

<h3>Example: Using <code>BlockingQueue</code> for Producer-Consumer</h3>
<pre><code>import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

class Producer implements Runnable {
    private final BlockingQueue&lt;Integer&gt; queue;

    public Producer(BlockingQueue&lt;Integer&gt; queue) {
        this.queue = queue;
    }

    public void run() {
        for (int i = 1; i &lt;= 5; i++) {
            try {
                System.out.println("Produced: " + i);
                queue.put(i);  // Put the item into the queue
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

class Consumer implements Runnable {
    private final BlockingQueue&lt;Integer&gt; queue;

    public Consumer(BlockingQueue&lt;Integer&gt; queue) {
        this.queue = queue;
    }

    public void run() {
        while (true) {
            try {
                Integer item = queue.take();  // Take the item from the queue
                System.out.println("Consumed: " + item);
                if (item == 5) break;
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

public class ProducerConsumerExample {
    public static void main(String[] args) {
        BlockingQueue&lt;Integer&gt; queue = new ArrayBlockingQueue&lt;&gt;(3);  // Queue with capacity 3

        Producer producer = new Producer(queue);
        Consumer consumer = new Consumer(queue);

        Thread producerThread = new Thread(producer);
        Thread consumerThread = new Thread(consumer);

        producerThread.start();
        consumerThread.start();
    }
}
</code></pre>

<h2>Summary of Concepts</h2>
<ol>
    <li><strong>Creating Threads</strong>: <code>Thread</code>, <code>Runnable</code>, <code>Callable</code>, <code>Future</code>.</li>
    <li><strong>Thread Lifecycle</strong>: Understanding different states and transitions.</li>
    <li><strong>Synchronization</strong>: Using <code>synchronized</code> and <code>ReentrantLock</code> to handle critical sections.</li>
    <li><strong>Executor Framework</strong>: Thread pools using <code>ExecutorService</code>.</li>
    <li><strong>ForkJoin Framework</strong>: Divide-and-conquer parallelism using <code>ForkJoinPool</code>.</li>
    <li><strong>Producer-Consumer</strong>: Efficient inter-thread communication using <code>BlockingQueue</code>.</li>
</ol>

</body>
</html>
