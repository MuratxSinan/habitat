--Parameters are not matching. So, I stop here.

UPDATE mushrooms SET cap_shape = mushroom_cap_shape FROM cap_shape 
    WHERE cap_shape = mushroom_cap_shape_code;

UPDATE mushrooms SET cap_color = mushroom_cap_color FROM cap_color 
    WHERE cap_color = mushroom_cap_color_code;

UPDATE mushrooms SET gill_color = mushroom_gill_color FROM gill_color 
    WHERE gill_color = mushroom_gill_color_code;

UPDATE mushrooms SET gill_size = mushroom_gill_size FROM gill_size 
    WHERE gill_size = mushroom_gill_size_code;

UPDATE mushrooms SET habitat = mushroom_habitat FROM habitat 
    WHERE habitat = mushroom_habitat_code;

UPDATE mushrooms SET odor = mushroom_odor FROM odor 
    WHERE odor = mushroom_odor_code;

UPDATE mushrooms SET population = mushroom_population FROM population 
    WHERE population = mushroom_population_code;

UPDATE mushrooms SET ring_type = mushroom_ring_type FROM ring_type 
    WHERE ring_type = mushroom_ring_type_code;

UPDATE mushrooms SET spore_print_color = mushroom_spore_print_color FROM spore_print_color 
    WHERE spore_print_color = mushroom_spore_print_color_code;

UPDATE mushrooms SET stalk_color_above_ring = mushroom_stalk_color_above_ring FROM stalk_color_above_ring 
    WHERE stalk_color_above_ring = mushroom_stalk_color_above_ring_code;

UPDATE mushrooms SET veil_color = mushroom_veil_color FROM veil_color 
    WHERE veil_color = mushroom_veil_color_code;
