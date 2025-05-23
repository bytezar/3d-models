eps=0.001; //epsilon
dev_fn=1; // used to fast render during developing, should be power of 2

outer_d=22; //handelbar outer cylinder diameter
cyl_fn=128/dev_fn; //handelbar outer cylinder accuracy

holder_d=22; //mirror rod holder diameter, should not exceed outer_d
holder_ht=22; //mirror rod holder diameter
holder_fn=128/dev_fn; //mirror rod holder accuracy

mirror_rod_hole_d=15; //mirror rod holder hole diameter
mirror_rod_hole_ht=16.2; //mirror rod holder hole height
mirror_rod_hole_fn=64/dev_fn; //mirror rod holder hole accuracy
mirror_rod_cylinder_cut=2.2; //cut in mirror rod cylinder
mirror_rod_angle=15; //angle placement of mirror rod 

screw_d=3.0 + 0.3; //screw hole diameter
screw_fn=16/dev_fn; //screw hole accuracy
screw_hole_offset_x=12; //screw hole x-offset
screw_head_d=5.5+0.5; //screw head hole diameter
screw_head_fn=32/dev_fn; //screw head hole accuracy
screw_head_hole_offset_y=2;//screw head hole y-offset

inner_tube_d=18.5; //handlebar inner tube diameter
inner_tube_fn=128/dev_fn; //handlebar inner tube accuracy
inner_tube_cyl_ht=20; //handlebar inner tube cylinder height
inner_tube_cyl_th=2.4; //handlebar inner tube cylinder thickness
inner_tube_cone_th=2.4; //handlebar inner tube cone thickness
inner_tube_cone_ht1=inner_tube_cone_th*sqrt(3); //handlebar inner tube bottom cone height (60 degree)
inner_tube_cone_ht2=2; //handlebar inner tube cylinder height
inner_tube_cone_ht3=inner_tube_cone_th; //handlebar inner tube top cone height (45 degree)
inner_tube_wth=2.0;//handlebar inner tube cut width

inner_cone_d1=16.0; //handlebar inner cone big diameter
inner_cone_d2=10.0; //handlebar inner cone small diameter
inner_cone_fn=128/dev_fn; //handlebar inner cone accuracy
inner_cone_ht=(inner_cone_d1-inner_cone_d2)*sqrt(3)/2; // cone height (60 degree)
inner_cone_nut_ht=6; //handlebar inner cone nut holder height

inner_cone_holder_ht=4; // inner cylinder in holder part height
inner_big_cone_d=19.5; // inner big cone diameter
inner_big_cone_ht=(inner_big_cone_d-inner_cone_d1)/2; // inner big cone height (45 degree)

bolt_m5_d=5.0+0.4; //bolt M5 hole diameter
bolt_m5_fn=32/dev_fn; //bolt M5 hole accuracy
nut_m5_d=8.8+0.3; //nut M5 hole diameter
nut_m5_ht=4.0+0.4; //nut M5 hole height

cut_base=0.6; //first layers are wider, so to put nut we need wider hole.

washer_m5_d=10.0+0.5; //washer M5 hole diameter
bolt_m5_head_hole_ht=8; //bolt M5 head hole diameter (with washer)
bolt_m5_head_hole_fn=64/dev_fn; //bolt M5 head hole accuracy
bolt_m5_head_cone_hole_ht=(washer_m5_d-bolt_m5_d)/(2*sqrt(3)); //bolt M5 head cone hole height (30 degree)

