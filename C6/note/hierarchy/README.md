# The Memory Hierarchy

![The memory hierarchy](https://img-blog.csdnimg.cn/20201204092239627.png)

## Cache Memories

- cache hit:
- cache miss:
  - cold cache miss: if the cache at level k is empty, then any access of any data object will miss. It also called *compulsory misses*.
  - conflict cache miss: data objects map tp the same cache block.
  - capacity cache miss: the cache is too small to handle this particular working set.

The essence  of the memory hierarchy is that the storage device at each level is a cache for the next lower level.

LRU, least recently used replacement policy, if cache miss, it would choose the block that was **last** accessed the furthest in the past.

### Generic Cache Memory Organization

Consider a computer system where each memory address has $m$ bits that form $M = 2^m$ unique address.

![General organization of caches (S, E, B, m)](https://img-blog.csdnimg.cn/20201205114936738.png)

![The cache organization](https://img-blog.csdnimg.cn/20201205115244588.png)

The set index bits tell us which set the word must be contained in, the $t$ tag bits in A tell us which line in the set contains the word.

|Parameter        | Description |
| -               | -           |
| $S = 2^s$       | Numbers of sets|
| $E$             | Number of lines per set|
| $B=2^b$         | Block size(bytes)|
| $m = log_2(M)$  | Number of physical(main memory) address bits|
| $M = 2^m$       | Maximum number of unique memory addresses|
| $s = log_2(S)$  | Number of set index bits |
| $b = log_2(B)$  | Number of block offset bits |
| $t = m - (s+b)$ | Number of tag bits |
| $C = B *E* S$ | Cache size(bytes), not including overhead such as the valid and tag bits |

Practice:

- [6.9](../../practice/6.9/README.md)

### Direct-Mapped Caches

Caches are grouped into different classes based on $E$, the number of cache lines per set.

if a cache with exactly one line per set $E = 1$, is known as a *direct-mapped* cache.

![direct-mapped cache](https://img-blog.csdnimg.cn/20201205122154495.png)

When the CPU executes an instruction that reads a memory word $q$, the process that a cache goes through of determining whether a request is a hit or a miss and then extracting the requested word consists of three steps:

![set selection in a direct-mapped cache](https://img-blog.csdnimg.cn/20201205151504643.png)

![Line matching and word selection in a direct-mapped cache](https://img-blog.csdnimg.cn/20201205151542875.png)

1. set selection: the cache extracts the $s$ set index bits from the middle of the address for $w$, these bits are interpreted as an unsigned integer corresponds to a set number.
2. line matching: now we had selected some set $i$, the next step is to determine if a copy of the word $w$ is stored in one of the cache lines contained in set $i$. In a direct-mapped cache, this is easy and fast because there is exactly one line per set. A copy of $w$ is contained in the line if and only if the valid bit is set and the tag in the cache line matches the tag in the address of $w$.
3. word extraction: once hit, this last step determines where the desired word starts in the block. If missed, then ite needs to retrieve the requested block from the next level in the memory hierarchy and store the new block in one of the cache lines of the set indicated by the set index bits.

Replacement policy of direct-mapped cache: The current line is replaced by the newly fetched line.

Practices:

- [6.10](../../practice/6.10/README.md)
- [6.11](../../practice/6.11/README.md)

### Set Associative Caches

- E-way set associative cache: A cache with $1 < E < C/B$, we will discuss the special case, where $E=C/B$.

![Set associative cache](https://img-blog.csdnimg.cn/20201206091745611.png)

![Set selection in a set associative cache](https://img-blog.csdnimg.cn/20201206091819672.png)

![Line matching and word selection in a set associative cache](https://img-blog.csdnimg.cn/20201206092027481.png)

### Fully Associative Cache

- A full associative cache consists of a single set that contains all of the cache lines.

![Fully associative cache](https://img-blog.csdnimg.cn/20201207090327768.png)

![Set selection in a fully associative cache](https://img-blog.csdnimg.cn/20201207090358972.png)

![Line matching and word selection in a fully associative cache](https://img-blog.csdnimg.cn/20201207090437877.png)

Practices:

- [6.12](../../practice/6.12/README.md)
- [6.13](../../practice/6.13/README.md)
- [6.14](../../practice/6.14/README.md)
- [6.15](../../practice/6.15/README.md)
- [6.16](../../practice/6.16/README.md)

## Writes

- write-through: if we write a word $w$ that is already cache, after the cache updates its copy of $w$, we will immediately write $w$'s cache block to the next lower level. While write-through is simple, but it will causing traffic with every write.
- write-back: if we write a word $w$ that is already cache, after the cache updates its copy of $w$, we will defer the write back. Because of locality, write-back can significantly reduce the amount of bus traffic, but it has the disadvantage of additional complexity. The cache must maintain an additional **dirty bit** for each cache line that indicates whether or not the cache block has been modified.

- write-allocate: To deal with write misses, loads the corresponding block from the next lower level into the cache and then updates the cache block.
- no-write-allocate:  bypasses the cache and writes the word directly to the next lower level.

## Performance Impact of Cache Parameters

- Miss rate
- Hit rate
- Hit time
- Miss penalty

Practices:

- [6.17](../../practice/6.17/README.md)
- [6.18](../../practice/6.18/README.md)
- [6.19](../../practice/6.19/README.md)
- [6.20](../../practice/6.20/README.md)

