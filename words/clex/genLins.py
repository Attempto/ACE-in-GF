f = open("./Clex.gf")
o = open("./lin.txt", "w")
ls = f.readlines()
c = 0
for l in ls:
    c += 1
    l=l.strip()
    if l == "abstract Clex = ACE ** {" or l == "fun" or l == "}":
        continue
    i = l.index(":")
    w = l[:i].strip()
    t = l[i+1:-1].strip()
    s = w[:w.rindex("_")].replace("_", " ")
    o.write(w + " = ace" + t + " \"" + s + "\" ;\n")