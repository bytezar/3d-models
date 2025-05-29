include <BOSL2/std.scad>
include <vars.scad>

module make_for_small_bolts()
{
  y=pipe_d/2+wall_th+holder_m25_offset_y;
  
  xflip_copy(holes_distance/2)
  yflip_copy(y)
  children();
}

module small_bolt_holder(h)
{
  d=bolt_m25_hld_d;
  y=holder_m25_offset_y;
  
  cube([d,y,h],
    anchor=DOWN+BACK);
  
  zcyl(d=d,h=h,
    $fn=bolt_m25_hld_fn,
    anchor=DOWN);
  
  zcyl(d1=bolt_m25_hld_cone_d,
    d2=d,
    h=bolt_m25_hld_cone_ht,
    $fn=bolt_m25_hld_fn,
    anchor=DOWN);
}
