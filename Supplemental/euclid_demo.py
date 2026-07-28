import math, time, random
random.seed(20260727)

def rand_digits(n):
    return random.randrange(10**(n-1), 10**n)

g = rand_digits(100)                 # planted common factor, 100 digits
a = g * rand_digits(100)             # ~200 digits
b = g * rand_digits(100)             # ~200 digits

def euclid(x, y):
    steps = 0
    while y:
        x, y = y, x % y
        steps += 1
    return x, steps

t0 = time.perf_counter()
d, steps = euclid(a, b)
t1 = time.perf_counter()

print(f"a has {len(str(a))} digits")
print(f"b has {len(str(b))} digits")
print(f"gcd has {len(str(d))} digits")
print(f"Euclid steps        : {steps}")
print(f"Euclid elapsed      : {(t1-t0)*1e6:.0f} microseconds")
print(f"agrees with math.gcd: {d == math.gcd(a,b)}")
print(f"divides both exactly: {a % d == 0 and b % d == 0}")
print()
print(f"trial division to sqrt(a) would need ~10^{len(str(a))//2} operations")
