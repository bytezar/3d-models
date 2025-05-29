include <BOSL2/std.scad>
include <vars.scad>

all_drill_helpers();
//top_drill_helper();
//bottom_drill_helper();

//test(0);

module all_drill_helpers()
{
  offset_y=10;
  
  fwd(drill_guide_bolts_distance/2+offset_y)
  top_drill_helper();
  
  back(drill_guide_bolts_distance/2+offset_y)
  bottom_drill_helper();
}

module top_drill_helper()
{
  make_drill_helper()
  top_pipe_holder();
}

module bottom_drill_helper()
{
  make_drill_helper()
  bottom_pipe_holder();
}

module make_drill_helper()
{
  union()
  {
    xflip_copy(holes_distance/2)
    children();
    
    connector();
  }
}

module connector()
{
  l=holes_distance-pipe_holder_wth;
  
  cube([l,connector_wth,connector_th],
    anchor=DOWN);
}

//---------- PIPE HOLDERS ----------

module top_pipe_holder()
{
  make_pipe_holder()
  small_bolt_holes();
}

module bottom_pipe_holder()
{
  make_pipe_holder()
  small_nut_holes();
}

module make_pipe_holder()
{
  difference()
  {
    union()
    {
      pipe_holder_main();
      
      bolt_holders();
    }
    
    drill_guide_bolt_holes();
    children();
  }
}

module pipe_holder_main()
{
  d1=pipe_d;
  d2=pipe_outer_d;
  wth=pipe_holder_wth;
  offset_z=pipe_holder_offset_z;
  ht=pipe_holder_ht;

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
  
  yflip_copy(y)
  children();
}

module bolt_holders()
{
  make_for_drill_guide_bolts()
  bolt_holder();
}

module bolt_holder()
{
  d1=drill_guide_bolt_hld_d;
  d2=bolt_m25_hld_d;
  y=drill_guide_bolts_distance/2-pipe_outer_d/2;
  
  h=pipe_holder_ht;
  
  zcyl(d=d1,h=h,
    $fn=drill_guide_bolt_hld_fn,
    anchor=DOWN);
  
  cube([d2,y,h],
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
  h=pipe_holder_ht;
  
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

module make_for_small_bolts()
{
  y=pipe_outer_d/2+bolt_m25_hld_offset_y;
  
  yflip_copy(y)
  children();
}

module small_nut_holders()
{
  h=pipe_holder_ht;
  
  make_for_small_bolts()
  small_bolt_holder(h);
}

module small_nut_holes()
{
  make_for_small_bolts()
  zrot(30)
  small_nut_hole();
}

module small_nut_hole()
{
  hh=pipe_holder_ht;
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

module small_bolt_holes()
{
  make_for_small_bolts()
  small_bolt_hole();
}

module small_bolt_hole()
{
  h=pipe_holder_ht;
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

//---------- TEST ----------

// 0 - all
// 1 - only top
// 2 - only bottom
module test(z)
{
  if (z == 0 || z == 1)
  {
    left(20)
    top_pipe_holder();
  }

  if (z == 0 || z == 2)
  {
    right(20)
    bottom_pipe_holder();
  }
}
