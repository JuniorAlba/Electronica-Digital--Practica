from itertools import product

def bool_expr(A, B, C, D, E, F):
    not_A = int(not A)
    not_B = int(not B)
    not_C = int(not C)
    not_D = int(not D)
    not_E = int(not E)
    not_F = int(not F)

    term1 = A and B
    term2 = (not_C or not_D) and (E or not_F)
    term3 = A and B and C and D

    return term1 or term2 or term3

print(" A B C D E F | Y")
print("-"*20)
for bits in product([0, 1], repeat=6):
    A, B, C, D, E, F = bits
    Y = bool_expr(A, B, C, D, E, F)
    print(f" {A}{B}{C}{D}{E}{F} |     {Y}")