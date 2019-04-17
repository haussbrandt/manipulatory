function p = platform(a, b, g, x0, y0, z0, dx, dy)
x1 = dx + x0 + dy*(cosd(a)*sind(g) - cosd(g)*sind(a)*sind(b)) - dx*cosd(b)*cosd(g);
y1 = dy + y0 - dy*(cosd(a)*cosd(g) + sind(a)*sind(b)*sind(g)) - dx*cosd(b)*cosd(g);
z1 = z0 + dx*sind(b) - dy*cosd(b)*sind(a);

x2 = x0 - dx + dy*(cosd(a)*sind(g) - cosd(g)*sind(a)*sind(b)) + dx*cosd(b)*cosd(g);
y2 = dy + y0 - dy*(cosd(a)*cosd(g) + sind(a)*sind(b)*sind(g)) + dx*cosd(b)*cosd(g);
z2 = z0 - dx*sind(b) - dy*cosd(b)*sind(a);

x3 = dx - x0/2 + (3^(1/2)*y0)/2 - (dx/2 + (3^(1/2)*dy)/2)*((cosd(b)*cosd(g))/2 - (3^(1/2)*cosd(b)*cosd(g))/2) + (dy/2 - (3^(1/2)*dx)/2)*((3^(1/2)*(cosd(a)*cosd(g) + sind(a)*sind(b)*sind(g)))/2 + (cosd(a)*sind(g))/2 - (cosd(g)*sind(a)*sind(b))/2);
y3 = dy - y0/2 - (3^(1/2)*x0)/2 - (dx/2 + (3^(1/2)*dy)/2)*((cosd(b)*cosd(g))/2 + (3^(1/2)*cosd(b)*cosd(g))/2) - (dy/2 - (3^(1/2)*dx)/2)*((cosd(a)*cosd(g))/2 - (3^(1/2)*(cosd(a)*sind(g) - cosd(g)*sind(a)*sind(b)))/2 + (sind(a)*sind(b)*sind(g))/2);
z3 = z0 - sind(b)*(dx/2 + (3^(1/2)*dy)/2) + cosd(b)*sind(a)*(dy/2 - (3^(1/2)*dx)/2);

x4 = (3^(1/2)*y0)/2 - x0/2 - dx + (dx/2 - (3^(1/2)*dy)/2)*((cosd(b)*cosd(g))/2 - (3^(1/2)*cosd(b)*cosd(g))/2) + (dy/2 + (3^(1/2)*dx)/2)*((3^(1/2)*(cosd(a)*cosd(g) + sind(a)*sind(b)*sind(g)))/2 + (cosd(a)*sind(g))/2 - (cosd(g)*sind(a)*sind(b))/2);
y4 = dy - y0/2 - (3^(1/2)*x0)/2 + (dx/2 - (3^(1/2)*dy)/2)*((cosd(b)*cosd(g))/2 + (3^(1/2)*cosd(b)*cosd(g))/2) - (dy/2 + (3^(1/2)*dx)/2)*((cosd(a)*cosd(g))/2 - (3^(1/2)*(cosd(a)*sind(g) - cosd(g)*sind(a)*sind(b)))/2 + (sind(a)*sind(b)*sind(g))/2);
z4 = z0 + sind(b)*(dx/2 - (3^(1/2)*dy)/2) + cosd(b)*sind(a)*(dy/2 + (3^(1/2)*dx)/2);

x5 = dx - x0/2 - (3^(1/2)*y0)/2 - (dx/2 - (3^(1/2)*dy)/2)*((cosd(b)*cosd(g))/2 + (3^(1/2)*cosd(b)*cosd(g))/2) - (dy/2 + (3^(1/2)*dx)/2)*((3^(1/2)*(cosd(a)*cosd(g) + sind(a)*sind(b)*sind(g)))/2 - (cosd(a)*sind(g))/2 + (cosd(g)*sind(a)*sind(b))/2);
y5 = dy - y0/2 + (3^(1/2)*x0)/2 - (dx/2 - (3^(1/2)*dy)/2)*((cosd(b)*cosd(g))/2 - (3^(1/2)*cosd(b)*cosd(g))/2) - (dy/2 + (3^(1/2)*dx)/2)*((cosd(a)*cosd(g))/2 + (3^(1/2)*(cosd(a)*sind(g) - cosd(g)*sind(a)*sind(b)))/2 + (sind(a)*sind(b)*sind(g))/2);
z5 = z0 - sind(b)*(dx/2 - (3^(1/2)*dy)/2) + cosd(b)*sind(a)*(dy/2 + (3^(1/2)*dx)/2);

x6 = (dx/2 + (3^(1/2)*dy)/2)*((cosd(b)*cosd(g))/2 + (3^(1/2)*cosd(b)*cosd(g))/2) - x0/2 - (3^(1/2)*y0)/2 - dx - (dy/2 - (3^(1/2)*dx)/2)*((3^(1/2)*(cosd(a)*cosd(g) + sind(a)*sind(b)*sind(g)))/2 - (cosd(a)*sind(g))/2 + (cosd(g)*sind(a)*sind(b))/2);
y6 = dy - y0/2 + (3^(1/2)*x0)/2 + (dx/2 + (3^(1/2)*dy)/2)*((cosd(b)*cosd(g))/2 - (3^(1/2)*cosd(b)*cosd(g))/2) - (dy/2 - (3^(1/2)*dx)/2)*((cosd(a)*cosd(g))/2 + (3^(1/2)*(cosd(a)*sind(g) - cosd(g)*sind(a)*sind(b)))/2 + (sind(a)*sind(b)*sind(g))/2);
z6 = z0 + sind(b)*(dx/2 + (3^(1/2)*dy)/2) + cosd(b)*sind(a)*(dy/2 - (3^(1/2)*dx)/2);

p = [x1, y1, z1;
     x2, y2, z2;
     x3, y3, z3;
     x4, y4, z4;
     x5, y5, z5;
     x6, y6, z6];
end