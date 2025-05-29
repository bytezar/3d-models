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
      small_nut_holders();
    }
    
    small_nut_holes();
  }
}

module connector()
{
  l=holes_distance-drill_pipe_holder_with_thread_wth;
  h=drill_pipe_holder_with_thread_offset_z-pipe_d/2;
  
  cube([l,connector_wth,connector_th],
    anchor=DOWN);
  
  cube([l,connector_th,h],
    anchor=DOWN);
}


module drill_pipe_holder()
{
  d1=pipe_d;
  d2=d1+2*wall_th;
  wth=drill_pipe_holder_with_thread_wth;
  ht=drill_pipe_holder_with_thread_ht;
  offset_z=drill_pipe_holder_with_thread_offset_z;
  
  nut(nut_spec,shape=nut_shape,
    thickness=nut_thickness,
    ibevel=false,
    $slop=nut_slop,
    $fn=nut_fn);

  difference()
  {
    cube([wth,d2,ht],anchor=DOWN);
    
    up(offset_z)
    xcyl(d=d1,h=wth+2,
      $fn=pipe_fn);
    
    down(1)
    zcyl(d=drill_guide_d,h=offset_z+1,
      $fn=drill_guide_fn,
      anchor=DOWN);
  }

}

//---------- SMALL BOLTS ----------

module small_nut_holders()
{
  h=drill_pipe_holder_with_thread_ht;
  
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
