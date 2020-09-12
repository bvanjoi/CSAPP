# Amdahl's Law

when we speed up one part of a system, the effect on the overall system performance depends on both how significant this part was and how much it sped up.

Consider a system in which executing some application require time $T_{old}$. Suppose some part of the a system requires a fraction $/alpha$ of this time, and that we improve its performance by a factor of $k$. That is, the component originally required time $\alpha T_{old}$, and it now requires time $\frac{\alpha T_{old}}{k}$.

And the overall execution time would thus be: $T_{new} = (1 - \alpha) T_{old} + (\alpha * T_{old}) / k$.

From above, we can compute the speedup $S = \frac{T_{old}}{T_{new}}$ as $S = \frac{1}{(1 - \alpha + \frac{\alpha}{k})}$

And this law tell us: even though we made a substantial improvement to a major part of system, out net speedup was significantly less than speedup for the one part.

## Special Case

One interesting special case of Amdahl's law is to consider the effect of setting $k$ to $\infty$, and now we are able to take some part fo the system and speed it up to the point at which it takes a negligible amount of time.

We then get: $S_{\infty} = \frac{1}{1 - \alpha}$.

## Summary

Amdahl's law describes a general principle for improving any process. In addition to its application to speeding up computer systems, it can guide a company trying to reduce the cost of manufacturing razor blades, or a student trying to improve his grade point average.

Perhaps it is most meaningful in the world of computers, where we routinely improve performance by factors of 2 or more, Such high factors can only be achieved by optimizing large parts of a system.
