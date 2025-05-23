include<BOSL2/std.scad>
include<vars.scad>

inner_wedge();

module inner_wedge()
{
  difference()
  {
    main_wedge();
    
    bolt_m5_hole();
    nut_m5_hole();
  }
}

module main_wedge()
{
  difference()
  {
    zcyl(d=inner_d,h=inner_ht,
      $fn=cyl_fn,anchor=DOWN);
    
    right(inner_d/2-inner_cut_offset_x)
    up(inner_ht)
    yrot(inner_cut_angle)
    cube([2*inner_d,inner_d+2,100],
      anchor=UP+RIGHT);
  }
}

module bolt_m5_hole()
{
  down(1)
  zcyl(d=bolt_m5_d,
    h=inner_ht+2,
    $fn=bolt_m5_fn,
    anchor=DOWN);
}

module nut_m5_hole()
{
  down(1)
  zcyl(d=nut_m5_d,
    h=nut_m5_ht+1,
    $fn=6,
    anchor=DOWN);
  
  up(nut_m5_ht-eps)
  zcyl(d1=nut_m5_d,
    d2=bolt_m5_d,
    h=nut_m5_cone_ht,
    $fn=6,
    anchor=DOWN);
  
  down(eps)
  zcyl(d1=nut_m5_d+2*cut_base,
    d2=nut_m5_d,
    h=cut_base,
    $fn=6,
    anchor=DOWN);
}
