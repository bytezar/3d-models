include <BOSL2/std.scad>

eps=0.001;
base_th=2;
lth=52;
fn=64;

wall_th=2;
wall_ht=3;

pile_ht=11;
pile_shrink_ht=1;
pile_wth_1=8;
pile_wth_2=6;
pile_lth_0=6;
pile_lth_1=2;
pile_lth_2=1.2;
pile_fn=16;

pile1_offset_y=2;
pile2_offset_x=2;
pile2_offset_y=5;

test_brush_space=36;

//----------------------------

oral_b_stand();

module oral_b_stand()
{
  hearth();
  piles();
  //test();
}

module test()
{
  make_for_piles()
  zcyl(d=test_brush_space,h=wall_ht,
    $fn=64,anchor=DOWN);
}

module hearth()
{
  ht=base_th+wall_ht;
  inner_lth=lth-2*wall_th;
  x=lth*sqrt(2)/4;
  
  difference()
  {
    union()
    {
      zrot(45)
      cube([lth,lth,ht]);
      
      xflip_copy()
      right(x)
      back(3*x)
      zcyl(d=lth,h=ht,anchor=DOWN,$fn=fn);
    }
    
    up(base_th)
    back(wall_th*sqrt(2))
    zrot(45)
    cube([inner_lth,inner_lth,wall_ht+eps]);
    
    xflip_copy()
    right(x)
    back(3*x)
    up(base_th)
    zcyl(d=inner_lth,h=wall_ht+eps,
      anchor=DOWN,$fn=fn);
  }
}

module piles()
{
  make_for_piles()
  pile();
}

module make_for_piles()
{
  x=lth*sqrt(2)/4;
  
  xflip_copy()
  right(x+pile2_offset_x)
  back(3*x+pile2_offset_y)
  up(base_th)
  children();
  
  back(3*x/2+pile1_offset_y)
  up(base_th)
  children();
}

module pile_old()
{
  linear_extrude(pile_ht)
  {
    trapezoid(pile_lth_0,pile_wth_2,pile_wth_1);
    
    back(pile_lth_0/2)
    ellipse(d=[pile_wth_1,pile_lth_1],
      $fn=pile_fn);
    
    fwd(pile_lth_0/2)
    ellipse(d=[pile_wth_2,pile_lth_2],
      $fn=pile_fn);
  }
}

module pile()
{
  hull()
  {
    linear_extrude(pile_ht)
    {
      pile_base();
    }
    
    up(pile_ht)
    linear_extrude(pile_shrink_ht)
    {
      pile_base(pile_shrink_ht);
    }
  }
}

module pile_base(shrink=0)
{
  trapezoid(pile_lth_0-2*shrink,
    pile_wth_2-2*shrink,
    pile_wth_1-2*shrink);
  
  back(pile_lth_0/2-shrink)
  ellipse(d=[pile_wth_1-2*shrink,pile_lth_1],
    $fn=pile_fn);
  
  fwd(pile_lth_0/2-shrink)
  ellipse(d=[pile_wth_2-2*shrink,pile_lth_2],
    $fn=pile_fn);
}