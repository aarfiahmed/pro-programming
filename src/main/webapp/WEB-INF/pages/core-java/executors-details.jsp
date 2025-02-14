<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Executors in Java</title>
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

<h1>Executors in Java</h1>

<p>The <strong>Executor Framework</strong> in Java is part of the <code>java.util.concurrent</code> package, and it provides a higher-level API for managing threads. It simplifies the process of creating, managing, and controlling a group of threads to execute tasks concurrently.</p>

<h2>Key Concepts of Executor Framework</h2>

<p>The main components of the Executor Framework include:</p>
<ul>
    <li><strong>Executor</strong>: A simple interface that has a single method <code>execute(Runnable task)</code>. It is a base for other more complex executor interfaces.</li>
    <li><strong>ExecutorService</strong>: A sub-interface of <code>Executor</code> that adds more functionalities like thread lifecycle management, task submission, and termination.</li>
    <li><strong>ScheduledExecutorService</strong>: Extends <code>ExecutorService</code> and allows for scheduling tasks with delays or periodic execution.</li>
    <li><strong>ThreadPoolExecutor</strong>: A class that implements <code>ExecutorService</code> and provides thread pooling.</li>
</ul>

<h2>1. Simple Executor Example</h2>

<p>The <code>Executor</code> interface allows us to execute a <code>Runnable</code> task without manually creating a thread. Here’s a basic example of how it works:</p>

<pre><code>import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class SimpleExecutorExample {
    public static void main(String[] args) {
        // Create an Executor using Executors helper class
        Executor executor = Executors.newSingleThreadExecutor();

        // Create a task to be executed
        Runnable task = () -> {
            System.out.println("Task is being executed by: " + Thread.currentThread().getName());
        };

        // Execute the task using the Executor
        executor.execute(task);
    }
}
</code></pre>

<h2>2. ExecutorService</h2>

<p><code>ExecutorService</code> is a more advanced interface that provides methods for managing tasks, such as submitting tasks, shutting down the executor, and retrieving task results.</p>

<h3>Key Methods of <code>ExecutorService</code>:</h3>
<ul>
    <li><code>submit()</code>: Submits a task for execution and returns a <code>Future</code> representing the task's result.</li>
    <li><code>shutdown()</code>: Initiates an orderly shutdown of the ExecutorService.</li>
    <li><code>shutdownNow()</code>: Attempts to stop all actively executing tasks immediately.</li>
    <li><code>invokeAll()</code>: Executes a collection of tasks and waits for all to complete.</li>
</ul>

<h3>Example: Using <code>ExecutorService</code> to Manage a Thread Pool</h3>

<pre><code>
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class ExecutorServiceExample {
    public static void main(String[] args) {
        // Create a thread pool with 3 threads
        ExecutorService executorService = Executors.newFixedThreadPool(3);

        // Create 5 tasks to be executed
        for (int i = 1; i <= 5; i++) {
            Runnable task = new Task("" + i);
            executorService.submit(task);
        }

        // Initiate shutdown
        executorService.shutdown();


        try{
            executorService.awaitTermination(1, TimeUnit.MINUTES);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("All tasks finished.");
    }
}

class Task implements Runnable {
    private String taskName;

    public Task(String taskName) {
        this.taskName = taskName;
    }

    @Override
    public void run() {
        System.out.println(Thread.currentThread().getName() + " is executing task " + taskName);
        try {
            Thread.sleep(1000);  // Simulating work with sleep
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
</code></pre>

<h2>3. ScheduledExecutorService</h2>

<p><code>ScheduledExecutorService</code> allows you to schedule tasks to run after a delay or to run periodically.</p>

<h3>Example: Scheduling Tasks with <code>ScheduledExecutorService</code></h3>

<pre><code>import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ScheduledExecutorServiceExample {
    public static void main(String[] args) {
        // Create a ScheduledExecutorService with a pool of 2 threads
        ScheduledExecutorService scheduledExecutorService = Executors.newScheduledThreadPool(2);

        // Schedule a task to run after a 3-second delay
        Runnable task = () -> {
            System.out.println("Executing task after 3 seconds: " + Thread.currentThread().getName());
        };

        scheduledExecutorService.schedule(task, 3, TimeUnit.SECONDS);

        // Schedule a periodic task to run every 2 seconds, with an initial delay of 1 second
        scheduledExecutorService.scheduleAtFixedRate(() -> {
            System.out.println("Executing periodic task: " + Thread.currentThread().getName());
        }, 1, 2, TimeUnit.SECONDS);

        // Optionally shutdown the scheduler after 10 seconds
        scheduledExecutorService.schedule(() -> {
            scheduledExecutorService.shutdown();
            System.out.println("Scheduler shut down.");
        }, 10, TimeUnit.SECONDS);
    }
}
</code></pre>

<h2>4. Different Types of Executors</h2>

<p>The <code>Executors</code> class provides factory methods for creating different types of thread pools:</p>
<ul>
    <li><code>newSingleThreadExecutor()</code>: Creates a single-threaded executor.</li>
    <li><code>newFixedThreadPool(int n)</code>: Creates a thread pool with a fixed number of threads.</li>
    <li><code>newCachedThreadPool()</code>: Creates a thread pool that creates new threads as needed, but will reuse previously constructed threads.</li>
    <li><code>newScheduledThreadPool(int n)</code>: Creates a thread pool that can schedule commands to run after a delay or periodically.</li>
</ul>

<h3>Example: Fixed Thread Pool</h3>

<pre><code>import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class FixedThreadPoolExample {
    public static void main(String[] args) {
        // Create a fixed thread pool with 4 threads
        ExecutorService executorService = Executors.newFixedThreadPool(4);

        // Submit multiple tasks to the executor
        for (int i = 0; i < 6; i++) {
            executorService.submit(() -> {
                System.out.println("Task executed by: " + Thread.currentThread().getName());
                try {
                    Thread.sleep(2000);  // Simulate task
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            });
        }

        // Shutdown the executor
        executorService.shutdown();
    }
}
</code></pre>

<h2>5. Callable and Future</h2>

<p>While <code>Runnable</code> does not return a result, <code>Callable</code> does. The result of the execution can be retrieved using <code>Future</code>. This is helpful when you need to retrieve results after a background task is complete.</p>

<h3>Example: Using <code>Callable</code> and <code>Future</code></h3>

<pre><code>import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class CallableFutureExample {
    public static void main(String[] args) {
        ExecutorService executorService = Executors.newSingleThreadExecutor();

        // Create a Callable task that returns a result
        Callable&lt;Integer&gt; task = () -> {
            System.out.println("Calculating sum in: " + Thread.currentThread().getName());
            Thread.sleep(1000);
            return 123;
        };

        // Submit the task and retrieve the Future
        Future&lt;Integer&gt; future = executorService.submit(task);

        try {
            // Block until the result is available
            Integer result = future.get();
            System.out.println("Result from the Callable task: " + result);
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }

        // Shutdown the executor
        executorService.shutdown();
    }
}
</code></pre>

<h2>Summary</h2>

<p>The <strong>Executor Framework</strong> provides a powerful mechanism for managing threads in Java. It simplifies multi-threading by offering various options for thread pools, scheduling tasks, and handling concurrent execution. Additionally, the use of <code>Callable</code> and <code>Future</code> allows for returning results from asynchronous tasks.</p>

</body>
</html>
