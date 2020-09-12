# Systems Communicate with Other Systems Using Networks

Up to this point in our tour of system, we have treated a system as an isolated collection of hardware and software. In practice, modern systems are often linked to other systems by networks.

From the point of view of an individual system, the network can be viewed as just another I/O device.
![A network is another I/O device](https://img-blog.csdnimg.cn/20200911082952919.png)

For example, we could use the familiar telnet application to run hello on a remote machine:

1. Suppose we use a telnet client running on our local machine to connect to a telnet server on a remote machine. After we log in to the remote machine and run a shell, the remote shell is waiting to receive an input command.
2. After we type in the hello string to the telnet client and hit the enter key, the client sends the string to the telnet server.
3. After the telnet server receives the string from the network, it passes it along to the remote shell program.
4. Next, the remote shell runs the hello program and passes the output line back to the telnet server.
5. Finally, the telnet server forward the output string across the network to the telnet client, which prints the output string on our local terminal.
