// public variables. free to edit
group_id = -1; // indicates which group this node is a part of. different groups mean different tracks
	// NOTE: a different layer should be made for all the nodes, but they can be part of different groups
	// the code will scan through every instance in a layer, so keep all nodes in their own layer for performance!
order_id = -1; // indicates the order of traversal between track nodes. 
	// 0 means that this is the master node! a path must have one of these nodes order_id set to 0!
// the public variables below only matter if this node's order_id is 0!
tracking_speed = 1; // how fast the tracking_id object moves
track_loop = false; // whether the path should be closed. true if closed. false if open
path_end_action = path_action_reverse; // what to do once the object reaches the end of the path. below are options
	// path_action_stop: the object stops at the end of the path
	// path_action_restart: the object jumps back to the start of the path
	// path_action_continue: the object goes along the path again, starting where it ended
	// path_action_reverse: the object goes backwards to the start, then forwards to the end, etc.
// every element found on this layer will be counted as a node for the scripts used!

// private variables. do not touch!!!
// compute a list of all nodes in this layer
idList = layer_get_all_elements(layer);
runInitScript = true;
next_id = noone; // the node previous to this one
prev_id = noone // the node after this one
tracking_id = noone; // the thing to move onto the track
tracking_path = noone; // use built-in paths (only the 0 indexed node will use this)
previousTrackingX = x; // the tracking_id's x and y positions
previousTrackingY = y;