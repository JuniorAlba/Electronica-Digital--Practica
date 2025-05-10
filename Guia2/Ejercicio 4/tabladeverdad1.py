from itertools import product

def bool_expr(A, B, C, D, E, F):
    not_A = int(not A)
    not_D = int(not D)
    not_E = int(not E)
    not_F = int(not F)

    term1 = not_A or B
    term2 = C or not_D
    term3 = not_E or not_F

    return term1 and term2 and term3

print(" A B C D E F | Y")
print("-"*20)
for bits in product([0, 1], repeat=6):
    A, B, C, D, E, F = bits
    Y = bool_expr(A, B, C, D, E, F)
    print(f" {A}{B}{C}{D}{E}{F} |     {Y}")