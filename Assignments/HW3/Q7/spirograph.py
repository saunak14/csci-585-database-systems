import math
import simplekml

Tommy_Trojan = [-118.285445, 34.020551]
R=36
r=9
a=30

spiro_coords = []
t = 0
nRev = 16
# Scaling the spirograph by a factor to fit the spirograph into a map
scale = 0.00001
while t < nRev*math.pi:
    x = (R+r)*math.cos((r/R)*t) - a*math.cos((1+r/R)*t)
    y = (R+r)*math.sin((r/R)*t) - a*math.sin((1+r/R)*t)
    x = x*scale
    y = y*scale
    x = x + Tommy_Trojan[0]
    y = y + Tommy_Trojan[1]
    t = t + 0.01
    spiro_coords.append([x,y])

for coord in spiro_coords:
    print(coord)

kml = simplekml.Kml()
for coord in spiro_coords:
    kml.newpoint(coords=[coord])
kml.save("spiro.kml")
