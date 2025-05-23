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
mirror_rod_cylinder_cut=2.8; //cut in mirror rod cylinder
mirror_rod_angle=15; //angle placement of mirror rod 

screw_d=3.0+0.3; //screw hole diameter
screw_fn=16/dev_fn; //screw hole accuracy
screw_hole_offset_x=12; //screw hole x-offset
screw_head_d=5.5+0.5; //screw head hole diameter
screw_head_fn=32/dev_fn; //screw head hole accuracy
screw_head_hole_offset_y=2.5;//screw head hole y-offset


inner_d=18.2; //handlebar inner cylinder diameter
inner_cone_d=19.5; //handlebar inner cylinder diameter
inner_cone_ht=(inner_cone_d-inner_d)/2; //handlebar inner cylinder diameter (45 degree)
inner_ht=28; //handlebar inner cylinder height
inner_cut_angle=30; // inner cylinder angle of cut
inner_cut_offset_x=3;  // inner cylinder cut x-offset


bolt_m5_d=5.0+0.4; //bolt M5 hole diameter
bolt_m5_fn=32/dev_fn; //bolt M5 hole accuracy
bolt_m5_hole_x=1.6; //bolt M5 hole x-space

washer_m5_d=10.0+0.3; //washer M5 hole diameter
bolt_m5_head_hole_ht=8; //bolt M5 head hole diameter (with washer)
bolt_m5_head_hole_fn=64/dev_fn; //bolt M5 head hole accuracy
bolt_m5_head_cone_hole_ht=(washer_m5_d-bolt_m5_d)/(2*sqrt(3)); //bolt M5 head cone hole height (30 degree)

nut_m5_d=8.8+0.25; //nut M5 hole diameter
nut_m5_ht=4.0+0.4; //nut M5 hole height
nut_m5_cone_ht=(nut_m5_d-bolt_m5_d)/(2*sqrt(3)); //nut M5 cone hole height (30 degree)
cut_base=0.4; //first layers are wider, so to put nut we need wider hole.
