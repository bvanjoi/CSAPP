# Chapter6: The Memory Hierarchy

In practice, a **memory system** is a hierarchy of storage devices with different capacities, costs, and access times.

- CPU registers hold the most frequently used data.
- Small, fast cache memories nearby the CPU act as staging areas for a subset of the data and instructions stored in the relatively slow main memory.
- The main memory stages data stored on large, slow disks, which in turn often serve as staging areas for data stored on the disks or tapes of other machines connected by networks.

This idea center around a fundamental property of computer programs known as **locality**.

- [Storage Technologies](./storage/README.md)
- [Locality](./locality/README.md)
- [The Memory Hierarchy](./hierarchy/README.md)
