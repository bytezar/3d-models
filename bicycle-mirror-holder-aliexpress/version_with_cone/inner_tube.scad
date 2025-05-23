include<BOSL2/std.scad>
include<vars.scad>

inner_tube();

module inner_tube()
{
  difference()
  {
    main_tube();
    cut_cube();
  }
}

module main_tube()
{
  d1=inner_tube_d;
  d2=d1-2*inner_tube_cyl_th;
  d3=d2-2*inner_tube_cone_th;
  
  tube(
    od=d1,id=d2,
    h=inner_tube_cyl_ht,
    $fn=inner_tube_fn,
    anchor=DOWN
  );
  
  h1=inner_tube_cone_ht1;
  h2=inner_tube_cone_ht2;
  h3=inner_tube_cone_ht3;
  
  zflip_copy(z=inner_tube_cyl_ht/2)
  union()
  {
    tube(
      od=d1,id1=d2,id2=d3,
      h=h1,
      $fn=inner_tube_fn,
      anchor=DOWN
    );
    
    up(h1)
    tube(
      od=d1,id=d3,
      h=h2,
      $fn=inner_tube_fn,
      anchor=DOWN
    );
    
    up(h1+h2)
    tube(
      od=d1,id1=d3,id2=d2,
      h=h3,
      $fn=inner_tube_fn,
      anchor=DOWN
    );
  }
}

module cut_cube()
{
  down(1)
  cube([inner_tube_wth,
      inner_tube_d/2+1,
      inner_tube_cyl_ht+2],
    anchor=DOWN+BACK);
}
