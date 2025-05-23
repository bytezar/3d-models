include<BOSL2/std.scad>
include<vars.scad>

mirror_holder();

module mirror_holder()
{
  difference()
  {
    union()
    {
      main_cylinder();
      inner_cylinder();
      mirror_holder_cylinder();
    }
    
    bolt_m5_hole();
    mirror_rod_hole();
    mirror_rod_screw_hole();
  }
}

module main_cylinder()
{
  zcyl(d=outer_d,h=holder_d,
    $fn=cyl_fn,anchor=DOWN);
}

module mirror_holder_cylinder()
{
  xcyl(d=holder_d,h=holder_ht,
    $fn=holder_fn,anchor=DOWN+LEFT);
}

module inner_cylinder()
{
  union()
  {
    up(holder_d)
    zcyl(d=inner_cone_d1,
      h=inner_cone_holder_ht,
      $fn=inner_cone_fn,anchor=DOWN);
    
    up(holder_d+inner_cone_holder_ht)
    zcyl(
      d1=inner_cone_d1,
      d2=inner_cone_d2,
      h=inner_cone_ht,
      $fn=inner_cone_fn,anchor=DOWN);
    
    up(holder_d)
    zcyl(d1=inner_big_cone_d,
      d2=inner_cone_d1,
      h=inner_big_cone_ht,
      $fn=inner_cone_fn,anchor=DOWN);
  }
}

module bolt_m5_hole()
{
  h=holder_d+inner_cone_holder_ht+inner_cone_ht;
  
  down(1)
  zcyl(
    d=bolt_m5_d,
    h=h+2,
    $fn=bolt_m5_fn,
    anchor=DOWN);
  
  down(1)
  zcyl(
    d=washer_m5_d,
    h=bolt_m5_head_hole_ht+1,
    $fn=bolt_m5_head_hole_fn,
    anchor=DOWN);
  
  up(bolt_m5_head_hole_ht-eps)
  zcyl(
    d1=washer_m5_d,
    d2=bolt_m5_d,
    h=bolt_m5_head_cone_hole_ht,
    $fn=bolt_m5_head_hole_fn,
    anchor=DOWN);
}

module mirror_rod_hole()
{
  right(holder_ht+1)
  up(holder_d/2)
  xrot(-mirror_rod_angle)
  difference()
  {
    xcyl(
      d=mirror_rod_hole_d,
      h=mirror_rod_hole_ht+1,
      $fn=mirror_rod_hole_fn,
      anchor=RIGHT);
    
    right(1)
    back(1+mirror_rod_hole_d/2)
    cube([mirror_rod_hole_ht+3,
      mirror_rod_cylinder_cut,
      mirror_rod_hole_d+2],
      anchor=RIGHT+BACK);
  }
}

module mirror_rod_screw_hole()
{
  up(holder_d/2)
  xrot(-mirror_rod_angle)
  back(holder_d/2)
  right(holder_ht-screw_hole_offset_x)
  union()
  {
    back(1)
    ycyl(
      d=screw_d,
      h=holder_d/2,
      $fn=screw_fn,
      anchor=BACK);
    
    back(1)
    ycyl(
      d=screw_head_d,
      h=screw_head_hole_offset_y+1,
      $fn=screw_head_fn,
      anchor=BACK);
    
    ht=(screw_head_d-screw_d)/2;
    fwd(screw_head_hole_offset_y-eps)
    ycyl(
      d1=screw_d,
      d2=screw_head_d,
      h=ht,
      $fn=screw_head_fn,
      anchor=BACK);
  }
}
