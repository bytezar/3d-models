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
  difference()
  {
    union()
    {
      up(holder_d)
      zcyl(d=inner_d,h=inner_ht,
        $fn=cyl_fn,anchor=DOWN);
      
      up(holder_d)
      zcyl(d1=inner_cone_d,
        d2=inner_d,
        h=inner_cone_ht,
        $fn=cyl_fn,anchor=DOWN);
    }
    
    right(inner_d/2-inner_cut_offset_x)
    up(holder_d+inner_ht)
    yrot(inner_cut_angle)
    cube([2*inner_d,inner_d+2,100],
      anchor=UP+RIGHT);
  }
}

module bolt_m5_hole_with_space(d,h,$fn)
{
  x=bolt_m5_hole_x;
  
  zcyl(d=d,h=h,$fn=$fn,
    anchor=DOWN);
  
  left(bolt_m5_hole_x)
  zcyl(d=d,h=h,$fn=$fn,
    anchor=DOWN);
  
  cube([bolt_m5_hole_x,d,h],
    anchor=RIGHT+DOWN);
}

module bolt_m5_cone_hole_with_space(d1,d2,h,$fn)
{
  x=bolt_m5_hole_x;
  
  zcyl(d1=d1,d2=d2,h=h,$fn=$fn,
    anchor=DOWN);
  
  left(x)
  zcyl(d1=d1,d2=d2,h=h,$fn=$fn,
    anchor=DOWN);
  
  prismoid([x,d1],[x,d2],h=h,
    anchor=RIGHT+DOWN);
}

module bolt_m5_hole()
{
  down(1)
  bolt_m5_hole_with_space(
    d=bolt_m5_d,
    h=holder_d+inner_ht+2,
    $fn=bolt_m5_fn);
  
  down(1)
  bolt_m5_hole_with_space(
    d=washer_m5_d,
    h=bolt_m5_head_hole_ht+1,
    $fn=bolt_m5_head_hole_fn);
  
  up(bolt_m5_head_hole_ht-eps)
  bolt_m5_cone_hole_with_space(
    d1=washer_m5_d,
    d2=bolt_m5_d,
    h=bolt_m5_head_cone_hole_ht,
    $fn=bolt_m5_head_hole_fn);
  
  down(eps)
  bolt_m5_cone_hole_with_space(
    d1=washer_m5_d+2*cut_base,
    d2=washer_m5_d,
    h=cut_base,
    $fn=bolt_m5_head_hole_fn);
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
