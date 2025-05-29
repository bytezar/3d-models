include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <vars.scad>
use <common.scad>

drill_helper();

module drill_helper()
{
  difference()
  {
    union()
    {
      xflip_copy(holes_distance/2)
      drill_pipe_holder();
      
      connector();
      //small_nut_holders();
      drill_guide_bolt_holders();
    }
    
    small_nut_holes();
    drill_guide_bolt_holes();
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

//---------- DRILL GUIDE BOLTS ----------

module make_for_drill_guide_bolts()
{
  y=drill_guide_bolts_distance/2;
  
  xflip_copy(holes_distance/2)
  yflip_copy(y)
  children();
}

module drill_guide_bolt_holders()
{
  make_for_drill_guide_bolts()
  drill_guide_bolt_holder();
}

module drill_guide_bolt_holder()
{
  d=drill_guide_bolt_hld_d;
  y=drill_guide_bolts_distance/2-pipe_outer_d/2;
  h1=drill_guide_bolt_ht;
  h2=drill_pipe_holder_ht;
  
  zcyl(d=d,h=h1,
    $fn=drill_guide_bolt_hld_fn,
    anchor=DOWN);
  
  cube([d,y,h2],
    anchor=DOWN+BACK);
}

module drill_guide_bolt_holes()
{
  make_for_drill_guide_bolts()
  drill_guide_bolt_hole();
}

module drill_guide_bolt_hole()
{
  d=drill_guide_bolt_d;
  h=drill_guide_bolt_ht;
  
  down(1)
  zcyl(d=d,h=h+2,
    $fn=drill_guide_bolt_fn,
    anchor=DOWN);
  
  down(eps)
  zcyl(d1=d+2*base_cut,d2=d,
    h=base_cut,
    $fn=drill_guide_bolt_fn,
    anchor=DOWN);
}

//---------- SMALL BOLTS ----------

module small_nut_holders()
{
  h=drill_pipe_holder_ht;
  
  make_for_small_bolts()
  small_bolt_holder(h);
}

module small_nut_holes()
{
  make_for_small_bolts()
  small_nut_hole();
}

module small_nut_hole()
{
  hh=drill_pipe_holder_with_thread_ht;
  h=nut_m25_ht+nut_m25_offset_z;
  
  down(1)
  zcyl(d=bolt_m25_d,
    h=hh+2,
    $fn=bolt_m25_fn,
    anchor=DOWN);
  
  down(1)
  zcyl(d=nut_m25_d,
    h=h+1,
    $fn=6,anchor=DOWN);
  
  up(h-eps)
  zcyl(d1=nut_m25_d,
    d2=bolt_m25_d,
    h=nut_m25_cone_ht,
    $fn=6,anchor=DOWN);
  
  down(eps)
  zcyl(d1=nut_m25_d+2*base_cut,
    d2=nut_m25_d,
    h=base_cut,
    $fn=6,anchor=DOWN);
}
