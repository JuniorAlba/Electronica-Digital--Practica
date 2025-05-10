from itertools import product

def bool_expr(A, B, C, D, E, F):
    not_A = int(not A)
    not_B = int(not B)
    not_C = int(not C)
    not_D = int(not D)
    not_E = int(not E)
    not_F = int(not F)

    term1 = not_A or (B and not_C)
    term2 = not_C or E or not_F

    return term1 and term2

print(" A B C D E F | Y")
print("-"*20)
for bits in product([0, 1], repeat=6):
    A, B, C, D, E, F = bits
    Y = bool_expr(A, B, C, D, E, F)
    print(f" {A}{B}{C}{D}{E}{F} |     {Y}")