# 4.28

| order | position | throughput | latency |
| -     |   -      |  -         |   -     |
| A     | after C  |  5.26 GIPS |   380ps |
| B     | after B and after D   |  7.69 GIPS |   390ps |
| C     | after A and after C and  after D   |  9.09 GIPS |   440ps |

D. The optimal design is five-stage pipeline(insert after A and after B and after C and after D), the latency is 500ps, but the throughput is 1/(100e-12) 10GIPS.
