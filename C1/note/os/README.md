# The Operating System Manages the Hardware

Back to *hello* example. When the shell loaded and ran the *hello* program, and when the *hello* program printed its message, neither program accessed to the keyboard, display, disk, or main directly. Rather, they relied on the services provided by the **operating system**.

We can think of the os as a layer of software interposed  between the application program and the hardware.

![Layered view of a computer system](https://img-blog.csdnimg.cn/20200909091601289.png)

The purposes of the operating system:

- to protect the hardware from misuse by runaway applications.
- to provide applications with simple and uniform mechanisms for manipulating complicated and often wildly different low-level hardware devices.

The operating system achieves above goals via the fundamental abstractions: **processes**,  **virtual memory**, **files**.

![Abstractions provided by an operating system](https://img-blog.csdnimg.cn/20200909092055925.png)

## Processes

When a Program running, the operating system provides the illusion that the program is the **only one** running on the system. The program appears to have exclusive use of both the processor, main memory and I/O devices. The processor appears to execute the instructions in the program, one after the other, without interruption. And the code and data of the program appear to be the only objects in the system's memory.

A process is the operating system's abstraction for a running program. Multiple processes can run **concurrently** on the same system, and each process appears to have exclusive use of the hardware.

And **concurrently** mean that the instructions of one process are interleaved with the instructions of another process. But at any point in time, a uniprocessor system can only execute th ecode for a single process.

But in most systems, there are more processes to run than there are CPUs to run them. Traditional systems could only execute one program at time, while multi-core processors can execute several programs simultaneously.

*In either case, a single CPU an appear to execute multiple processes concurrently by having the processor switch among them.* The operating system performs this interleaving with a mechanism, know as **context switching**.

The operating system keeps track of all the state information that the process needs in order to run. This state, which is known as the **context**, includes information such as the current values of the PC, the register file, and the contents of main memory. When the operating system decides to transfer control from the current process to some other process, it performs a context switch by saving the context of the current process, restoring the context of the new process, and then passing control to the new process.

![Process context switching](https://img-blog.csdnimg.cn/20200910085341212.png)

As above Figure indicates, the transition from one process to another is managed by the operating system **kernel**.

The **kernel** is the portions of the operating system code that is always resident in memory. When an application program requires some action by the operating system, it executes a special **system call** instruction, transferring control to the kernel. The kernel then performs the requested operation and returns back to the application program. Node that the kernel is not a separate process. Instead, it is a collection of code and data structures that the system uses to manage all the processes.

## Threads

Although we normally think of a process as having a single control flow, *in modern systems a process can actually consist of multiple execution units*, called **threads**, each running in the context of the process and sharing the same code and global data.

## Virtual Memory

**Virtual Memory** is an abstraction that provides each process with the illusion that it has exclusive use of th main memory. Each process has the same uniform view of memory, which is known as its **virtual address space**.

![Process virtual address space](https://img-blog.csdnimg.cn/20200910091449611.png)

From above figure, we know that: the topmost region of the address space is reserved for code and data in th e operating system that is common to all processes. The lower region of the address space holds the code and data defined by the user's process. Node that *addresses in the figure increase from the bottom to the top*.

- Program code and data: Code begins at the same fixed address for all processes. The code and data areas are initialized directly from the contents of an executable object file.
- Heap: The code and data areas are followed immediately by the run-time heap. Unlike the code and data areas, which are fixed in size once the process begins running, the heap expands and contracts dynamically at run time as a result of calls to C standard library routines such as `malloc` and `free`.
- Shared Libraries: Near the middle of the address space is an area that holds the code and data for shared libraries such as C standard library and the math library.
- Stack: At the top of the user's virtual address space is the user stack that the compiler uses to implement function calls. Like the heap, the user stack expands and contracts dynamically during hte execution of the program. In particular, each time we call a function, the stack grows; Each time we return from a function, it contracts.
- Kernel Virtual Memory: The top region of the address space is reserved for the kernel. Application programs are not allowed to read or write the contents of this area or directly call functions defined in the kernel code. Instead, they must invoke the kernel to perform these operations.

## Files

A **file** is a sequence of bytes, nothing more and nothing less.

Every I/O device, including disks, keyboards, displays, and even networks, is modeled as a file. All input and output ini the system is performed by reading and writing files, using a small set of system calls known as *Unix I/O*.
