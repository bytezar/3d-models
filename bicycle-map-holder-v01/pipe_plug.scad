include <BOSL2/std.scad>

dev_fn=1; // used to fast render during developing, should be power of 2

eps=0.001;
base_cut=0.4;

outer_d=22.0;
outer_ht=1;
fn=256/dev_fn;

inner_d=20.0;
inner_ht=16;

bolt_hole_d=6.1;
bolt_hole_fn=64/dev_fn;
bolt_hole_offset_z=6;

top_th=1.0;

//latch_wth=0.6;
//latch_d=5.0;

pipe_plug();

module pipe_plug()
{
  union()
  {
    difference()
    {
      pipe_plug_main();
      
      bolt_hole();
    }
  }
}

module pipe_plug_main()
{
  zcyl(d1=outer_d-2*base_cut,
    d2=outer_d,h=base_cut,
    $fn=fn,anchor=DOWN);
  
  up(base_cut)
  zcyl(d=outer_d,h=outer_ht-base_cut,
    $fn=fn,anchor=DOWN);
    
  up(outer_ht)
  zcyl(d=inner_d,h=inner_ht,
    $fn=fn,anchor=DOWN);
}


module bolt_hole()
{
  z1=outer_ht+bolt_hole_offset_z;
  z2=outer_ht+inner_ht-top_th-bolt_hole_d/2;
  
  up(z1)
  ycyl(d=bolt_hole_d, h=outer_d,
     $fn=bolt_hole_fn);
  
  up(z2)
  ycyl(d=bolt_hole_d, h=outer_d,
     $fn=bolt_hole_fn);
  
  up(z1)
  cube([bolt_hole_d,outer_d,z2-z1],
      anchor=DOWN);
}

/*
module bolt_hole()
{
  up(outer_ht+bolt_hole_offset_z)
  union()
  {
    ycyl(d=bolt_hole_d,h=outer_d,
      $fn=bolt_hole_fn);
    
    cube([bolt_hole_d,outer_d,inner_ht],
      anchor=DOWN);
  }
}

module latch()
{
  ht=(bolt_hole_d-latch_d)/2;
  
  xflip_copy()
  intersection()
  {
    up(outer_ht+inner_ht)
    left(bolt_hole_d/2)
    prismoid(
      size1=[latch_wth+2*ht,outer_d], 
      size2=[latch_wth,outer_d], 
      h=ht,
      orient=RIGHT,
      anchor=LEFT+DOWN);
    
    up(outer_ht)
    zcyl(d=inner_d,h=inner_ht,
      $fn=fn,anchor=DOWN);
  }
  
}
*/
