eps=0.001; //epsilon
dev_fn=1; // used to fast render during developing, should be power of 2
base_cut=0.4;

holes_distance=180;

pipe_d=21.8+0.2; //pipe hole diameter
pipe_fn=256/dev_fn;//pipe hole accuracy
pipe_cut=0.4; //cut between two pipe holders

wall_th=2.4;
connector_th=3;
connector_wth=10;

pipe_outer_d=pipe_d+2*wall_th;

pipe_holder_wth=16;
pipe_holder_offset_z=max(connector_th,wall_th)+pipe_d/2;
pipe_holder_ht=pipe_holder_offset_z-pipe_cut/2;


drill_guide_bolt_d=5.15;
drill_guide_bolt_fn=64/dev_fn;
drill_guide_bolt_hld_d=11;
drill_guide_bolt_hld_fn=32/dev_fn;
drill_guide_bolts_distance=58;

drill_m6_big_d=9; // big hole for M6 drill
drill_m6_fn=32/dev_fn;

//---------- SMALL BOLTS ----------

bolt_m25_hld_offset_y=4.0;
bolt_m25_hld_d=10;

nut_m25_offset_z=4;
bolt_m25_cone_head_offset_z=5;

bolt_m25_d=2.75;
bolt_m25_fn=64/dev_fn;

bolt_m25_cone_head_d=5.2;
bolt_m25_cone_head_ht=(bolt_m25_cone_head_d-bolt_m25_d)/2;
bolt_m25_cone_head_fn=64/dev_fn;

nut_m25_d=5.5+0.3;
nut_m25_ht=2.0;
nut_m25_cone_ht=(nut_m25_d-bolt_m25_d)/2;
