if (runInitScript) { // only runs once. needs to be run after create
	runInitScript = false;
	// the node with order id 0 is the master node. it will be the one to manage all other nodes
	// N^2 algorithm... but it's the easiest way to handle this, and it only runs once anyway
	if (order_id == 0) 
	{
		for (var ind = 0; ind < array_length_1d(idList); ind++;)
		{
			nodeId = layer_instance_get_instance(idList[ind]);
			// the found nodes must share the same group id!
			if (group_id != nodeId.group_id) {
				continue;
			}
			// calculate the next_id and the prev_id values for this node
			for (var subind = 0; subind < array_length_1d(idList); subind++;)
			{
				otherNodeId = layer_instance_get_instance(idList[subind]);		
				// the found nodes must share the same group id!
				if (group_id != otherNodeId.group_id) {
					continue;
				}
				if ((nodeId.order_id + 1) == otherNodeId.order_id)
				{ // found the next higher order id relative to this node
					nodeId.next_id = otherNodeId
				}
				if ((nodeId.order_id - 1) == otherNodeId.order_id)
				{ // found the previous lower order id relative to this node
					nodeId.prev_id = otherNodeId
				}					
			}

		}
		// initial collision check. anything touching this node will be carried onto the track
		tracking_id = instance_place(x, y, all);

		// generate the path with the now ordered points
		tracking_path = path_add();
		path_set_closed(tracking_path, track_loop);
		path_add_point(tracking_path, x, y, 100);
		next = next_id
		while (next != noone) 
		{
			path_add_point(tracking_path, next.x, next.y, 100);
			// update the next point
			next = next.next_id;
		}
		// now the path is created! assign it to the tracking_id
		with (tracking_id) {
			path_start(other.tracking_path, other.tracking_speed, other.path_end_action, true);
			other.previousTrackingX = x;
			other.previousTrackingY = y;
		}
			
	}
}