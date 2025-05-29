include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <vars.scad>
use <common.scad>

drill_helper_bottom();

module drill_helper_bottom()
{
  difference()
  {
    union()
    {
      xflip_copy(holes_distance/2)
      drill_pipe_holder();
      
      connector();
      small_bolt_holders();
    }
    
    small_bolt_holes();
  }
}


module connector()
{
  l=holes_distance-drill_pipe_holder_wth;
  h=drill_pipe_holder_with_thread_offset_z-pipe_d/2;
  
  cube([l,connector_wth,connector_th],
    anchor=DOWN);
}

module drill_pipe_holder()
{
  d1=pipe_d;
  d2=d1+2*wall_th;
  wth=drill_pipe_holder_wth;
  offset_z=drill_pipe_holder_offset_z;
  ht=drill_pipe_holder_ht;

  difference()
  {
    cube([wth,d2,ht],
      anchor=DOWN);
    
    up(offset_z)
    xcyl(d=d1,h=wth+2,$fn=pipe_fn);
    
    down(1)
    zcyl(d=drill_m6_big_d,h=offset_z+1,
      $fn=drill_m6_fn,anchor=DOWN);
  }
}

//---------- SMALL BOLTS ----------

module small_bolt_holders()
{
  h=drill_pipe_holder_ht;
  
  make_for_small_bolts()
  small_bolt_holder(h);
}

module small_bolt_holes()
{
  make_for_small_bolts()
  small_bolt_hole();
}

module small_bolt_hole()
{
  h=drill_pipe_holder_ht;
  head_d=bolt_m25_cone_head_d;
  
  down(1)
  zcyl(d=bolt_m25_d,
    h=h+2,
    $fn=bolt_m25_fn,
    anchor=DOWN);
  
  down(1)
  zcyl(
    d=head_d,
    h=bolt_m25_cone_head_offset_z+1,
    $fn=bolt_m25_cone_head_fn,
    anchor=DOWN);
  
  up(bolt_m25_cone_head_offset_z-eps)
  zcyl(
    d1=head_d,
    d2=bolt_m25_d,
    h=bolt_m25_cone_head_ht,
    $fn=bolt_m25_cone_head_fn,
    anchor=DOWN);
  
  down(eps)
  zcyl(d1=head_d+2*base_cut,
    d2=head_d,
    h=base_cut,
    $fn=bolt_m25_cone_head_fn,
    anchor=DOWN);
}
