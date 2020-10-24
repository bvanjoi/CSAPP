# Procedures

Procedures provide a way to package code that implements some functionality with a designated set of arguments and an optional return value.

Procedures come in many guises in different programming languages--functions, methods, subroutines, handlers and so on--but they all provide a clear and concise interface definition of what values will be computed and what effects the procedure will have on the program state.

For example, suppose procedure `P` calls procedure `Q`, and `Q` then executes and returns back to `P`, These actions involve one or more of the following mechanisms:

- *Passing control*: the PC must be st to the starting address of the code for `Q` upon entry and then set to the instruction in `P` following the call to `Q` upon return.
- *Passing data*: `P` must be able to provide one or more parameters to `Q`, and `Q` must be able to return a value back to `P`.
- *Allocating and deallocating memory: `Q` may need to allocate space for local variables when it begin and then free that storage before it returns.

## The Run-Time Stack

![General stack frame structure](https://img-blog.csdnimg.cn/20201018152231636.png)

As described above, the x86-64 stack **grows toward lower addresses** and the stack pointer `%rsp` points to the top element of the stack.

Data can be stored on and retrieved from the stack using the `pushq` and `popq` instructions. Space for data with no specified initial value can be allocated on the stack by simply decrementing the stack pointer by an appropriate amount. Similarly, space can be deallocated by incrementing the stack pointer.

When procedure `P` calls procedure `Q`, it will push the `return address;` onto the stack( this instruction is `call Q`), indicating where within `P` the program should resume execution once Q returns.

| instruction    | description      |
| -              | -                |
| `call Label`   | Procedure call   |
| `call *Operand`| Procedure call   |
| `ret`          | Return from call |

And `P` can pass up to six integral values in register, but if `Q` require more arguments, these can be stored by `P` within its stack frame prior to the call.

Practices:

- [3.32](../../practice/3.32/README.md)
- [3.33](../../practice/3.33/README.md)

## Local Storage in Registers

The set of program register acts as a single resource **shared by all of the procedures**.

So we must make sure that when one procedure calls another, the callee does not overwrite some register value that the caller planned to use later.

By convention, register `%rbx`, `%rbp`, and `%r12` - `%r15` are classified as **callee saved** registers.

Practice:

- [3.34](../../practice/3.34/README.md)

### Recursive Procedures

Calling a function recursively proceeds just like any other function call.

Practice:

- [3.35](../../practice/3.35/README.md)
