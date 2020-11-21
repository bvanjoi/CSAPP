# Logic Design and Hardware Control Language

Three major components are required to implement a digital system:

- combinational logic
- memory elements
- clock signals

HLC expressions are shown below the gates for the operator in C: `&&`, `||`, `!`.(Don't mixed the bit operation `&`, `|`, `~` in C).

Practices:

- [4.9](../../practice/4.9/README.md)
- [4.10](../../practice/4.10/README.md)

## HLC expressions

- A case expression has the following general form:

```HCL
[
    select1: expr1;
    select2: expr2;
    selectn: exprn;
]
```

Unlike `switch` statement in C, we don't require the different selection expressions to be mutually exclusive. Logically, the selection expression are evaluated in sequence, and the case for the first one yielding 1 is selected.

For example, the second selection expression is simply 1, indicating that this case should be selected if no prior one has been.

```HCL
word Out = [
    s: A;
    1: B;
]
```

- The form set membership test is:

```HSL
iexpr in {iexpr1, ..., iexprk}
```

Practices:

- [4.11](../../practice/4.11/README.md)
- [4.12](../../practice/4.12/README.md)
