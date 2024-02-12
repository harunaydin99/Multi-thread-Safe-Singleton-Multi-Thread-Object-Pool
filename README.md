# Multi-thread-Safe-Singleton-Multi-Thread-Object-Pool
In this project, an attempt was made to implement a multi-thread safe system using a multi-thread object pool using the Swift language with the singleton design pattern.

15 threads (called "queue" in Swift language) want to use objects to connect to a database. However, the generation of connection objects that will perform this connection process takes a long time. Therefore, objects are collected in a pool and threads are given free objects from that pool.

There are 15 threads and 10 connection objects in total. 10 of these threads make a request and use the object and then release it into the pool. The remaining 5 threads are waiting during this period. When there are objects in the pool again, these remaining five threads take the objects and use them and then drop them into the pool.

Since it takes time to create and run connection objects, the object pool design pattern was applied in this project. At the same time, the singleton design pattern allows us to create objects that we use in more than one place in our application or that we need constantly. In this project, the task of distributing the connection object proceeds through the "Connection" class, which is a Multi thread safe singleton class.
