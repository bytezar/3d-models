include<BOSL2/std.scad>
include<vars.scad>

inner_cone();

module inner_cone()
{
  difference()
  {
    main_cone();
    nut_m5_hole();
    bolt_m5_hole();
  }
}

module main_cone()
{
  zcyl(d=inner_cone_d1,
    h=inner_cone_nut_ht,
    $fn=inner_tube_fn,
    anchor=DOWN);
  
  up(inner_cone_nut_ht)
  zcyl(d=inner_cone_d1,
    d2=inner_cone_d2,
    h=inner_cone_ht,
    $fn=inner_tube_fn,
    anchor=DOWN);
}

module nut_m5_hole()
{
  down(1)
  zcyl(d=nut_m5_d,
    h=nut_m5_ht+1,
    $fn=6,
    anchor=DOWN);
  
  //2*sqrt(3) - for angle 30 degree
  ht=(nut_m5_d-bolt_m5_d)/(2*sqrt(3)); 
  up(nut_m5_ht-eps)
  zcyl(d1=nut_m5_d,
    d2=bolt_m5_d,
    h=ht,
    $fn=6,
    anchor=DOWN);
  
  down(eps)
  zcyl(d1=nut_m5_d+2*cut_base,
    d2=nut_m5_d,
    h=cut_base,
    $fn=6,
    anchor=DOWN);
}

module bolt_m5_hole()
{
  ht=inner_cone_nut_ht+inner_cone_ht;
  down(1)
  zcyl(d=bolt_m5_d,
    h=ht+2,
    $fn=bolt_m5_fn,
    anchor=DOWN);
}
