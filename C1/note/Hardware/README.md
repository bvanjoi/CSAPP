# Hardware Organization of a System

## Organization

![Hardware Organization of a System](https://img-blog.csdnimg.cn/20200908084440832.png)

### Buses

- Buses: carry bytes of information back and forth between the components.

Buses are typically designed to transfer fixed-size chunks of bytes known as **words**.

**word** size is varies across systems. Most machines have word sizes of either 4 bytes or 8 bytes.

### I/O Devices

I/O(Input/Output) devices are the system's connection to hte external world.

Each I/O device is connected to the I/O bus by either a controller or an adapter. And the purpose of controller and adapter is to transfer information back and forth between the I/O bus and an I/O device.

### Main Memory

- Main Memory: a temporary storage device that holds both a program and the date it manipulate while the processor is executing the program. And main memory consists of a collection of **dynamic random access memory**(DRAM) chips.

### Processor

- CPU(central processing unit): CPU appears to operate according to a instruction execution model, defined by its **instruction set architecture**. And it repeatedly executes the instruction pointed at by the PC and updates the PC to point to the **next** instruction.
  - Register file: a *small* storage device that consists of a collection of **word-size** registers, each with its own unique name.
  - ALU(arithmetic/logic unit): it computes new data and address values.
  - PC(program counter): word size storage device.
  - USB(Universal Serial Bus):

The processor reads the instruction from memory point at by the PC, interprets the bits in the instruction, performs some simple operation dictated by the instruction, and then updates the PC to point to the next instruction.
