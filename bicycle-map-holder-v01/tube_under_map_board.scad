include <BOSL2/std.scad>

eps=0.001;
base_cut=0.4;

ht=64;

tube_d=10;
tube_fn=128;

bottom_cone_d=14;
bottom_cone_h=bottom_cone_d-tube_d;

top_cone_d=11;
top_cone_h=2*(top_cone_d-tube_d);

hole_d=6.1;
hole_fn=128;

tube_under_map_board();

module tube_under_map_board()
{
  difference()
  {
    main_tube();
    hole();
  }
}

module main_tube()
{
  zcyl(d=tube_d,h=ht,
    $fn=tube_fn,anchor=DOWN);
  
  zcyl(d1=bottom_cone_d,d2=tube_d,
    h=bottom_cone_h,$fn=tube_fn,
    anchor=DOWN);
  
  up(ht)
  zcyl(d1=tube_d,d2=top_cone_d,
    h=top_cone_h,$fn=tube_fn,
    anchor=UP);
}

module hole()
{
  down(1)
  zcyl(d=hole_d,h=ht+2,
    $fn=64,anchor=DOWN);
  
  down(eps)
  zcyl(d1=hole_d+2*base_cut,d2=hole_d,
    h=base_cut,$fn=hole_fn,anchor=DOWN);
}
