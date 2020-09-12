# Running the *hello* Program

1. Initially, the shell program is executing its instructions, waiting for us to type a command. And after we type `./hello`, the shell program reads each one into a register and then stores it in memory. And then, we hit enter key, the shell knows that we have finished typing.
![Reading the hello command form the keyboard](https://img-blog.csdnimg.cn/20200908092944620.png)

2. The shell load the executable hello file by executing a sequence of instructions that **copies** the code and data in the hello object file form disk to main memory. And the data includes the string of characters *hello,world\n* that will eventually be printed out.
![Loading the executable from disk into main memory](https://img-blog.csdnimg.cn/20200909082051723.png)

3. Once the code and data in the *hello* object file are loaded into memory, the processor begins executing the machine-language instructions in the hello program's main routine. The instructions copy the bytes in the *hello,world\n* string from memory to the register file, and from there to display device.
![Writing the output string from memory to the display](https://img-blog.csdnimg.cn/20200909082536784.png)

## Caches Matter

From above all, we know that the system spends a lot of time moving information from one to another:

- The machine instructions in the program are originally stored on disk, and when the program is loaded, they are copied to main memory.
- As the processor runs the program, instructions are copied from main memory into the processor.
- The data string *hello,world\n*, originally on disk, is copied to main memory and then copied from main memory to the display device.

And we know, much of this copying is overhead that slows down the 'real work' of the program. Thus, a major goal for system designers is to make these copy operations run as fast as possible.

And there is physical laws: **Larger storage devices are slower than smaller storage devices**. For example, the disk drive on a typical system might be 1,000 times larger than the main memory, but it might take the processor 10,000,000 times longer to read a word from disk than from memory. Similarly, a typical register file stores only a few hundred bytes of information, as opposed to billions of bytes in the main memory, however, the processor can read data from the register file almost 100 times faster than from memory.

To deal with the processor-memory gap, system designer include smaller, faster storage device call **cache memories** that serve as temporary staging areas for information that the processor is likely to need in the near future.
![Cache memories](https://img-blog.csdnimg.cn/20200909084840719.png)

The idea behind caching is that a system can get the effect of both a very large memory and a very fast one by exploiting **locality**, the tendency for programs to access data and code in localized regions.

- L1 cache: holds tens of thousands of bytes and can be accessed nearly as fast as the register file.
- L2 cache: with hundreds of thousands to millions of bytes is connected to the processor by a special bus. It might take 5 times longer for the processor to access the L2 cache than the L1 cache, but this is still 5 to 19 times faster than accessing the main memory.

The L1 and L2 caches are implemented with a hardware technology known as *static random access memory*(SRAM).

![An example of memory hierarchy](https://img-blog.csdnimg.cn/20200909085718407.png)
