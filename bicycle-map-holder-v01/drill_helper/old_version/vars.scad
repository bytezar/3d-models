eps=0.001; //epsilon
dev_fn=1; // used to fast render during developing, should be power of 2
base_cut=0.4;

holes_distance=180;

pipe_d=21.8+0.2; //pipe hole diameter
pipe_fn=128/dev_fn;//pipe hole accuracy
pipe_cut=0.8; //cut between two pipe holders

wall_th=2.4;
connector_th=3;
connector_wth=10;

pipe_outer_d=pipe_d+2*wall_th;

drill_pipe_holder_wth=16;
drill_pipe_holder_offset_z=max(connector_th,wall_th)+pipe_d/2;
drill_pipe_holder_ht=drill_pipe_holder_offset_z-pipe_cut/2;

drill_pipe_holder_with_thread_wth=22;
drill_pipe_holder_with_thread_offset_z=22.6;
drill_pipe_holder_with_thread_ht=drill_pipe_holder_with_thread_offset_z-pipe_cut/2;
drill_guide_d=15; //drill guide hole diameter
drill_guide_fn=64/dev_fn; 

drill_guide_bolt_d=6.3;
drill_guide_bolt_fn=32/dev_fn;
drill_guide_bolt_ht=21;
drill_guide_bolt_hld_d=12;
drill_guide_bolt_hld_fn=32/dev_fn;
drill_guide_bolts_distance=58;

drill_m6_big_d=9;
drill_m6_fn=32/dev_fn;

nut_spec="M14x1.5";
nut_shape="square";
nut_thickness="normal";
nut_slop=0.15;
nut_fn=128/dev_fn;

//---------- SMALL BOLTS ----------

holder_m25_offset_y=3.2;

nut_m25_offset_z=4;
bolt_m25_cone_head_offset_z=5;

// Values for version with thread:
//nut_m25_offset_z=13;
//bolt_m25_cone_head_offset_z=5;

bolt_m25_d=2.8;
bolt_m25_fn=32/dev_fn;

bolt_m25_cone_head_d=5.2;
bolt_m25_cone_head_ht=(bolt_m25_cone_head_d-bolt_m25_d)/2;
bolt_m25_cone_head_fn=32/dev_fn;

nut_m25_d=5.5+0.5;
nut_m25_ht=2.0;
nut_m25_cone_ht=(nut_m25_d-bolt_m25_d)/2;

bolt_m25_hld_d=10;
bolt_m25_hld_fn=32/dev_fn;
bolt_m25_hld_cone_d=12;
bolt_m25_hld_cone_ht=(bolt_m25_hld_cone_d-bolt_m25_hld_d)/2;
