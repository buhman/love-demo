local collada_types = require 'collada_types'

local ns = {}
ns.light_environmentambientlight = {
  type = collada_types.light_type.AMBIENT,
  color = {0.0, 0.0, 0.0},
}
ns.images = {
}
ns.effect_cockpit = {
  type = collada_types.effect_type.BLINN,
  blinn = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.5882353, 0.8235295, 0.8666667, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.5882353, 0.8235295, 0.8666667, 1.0},
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    shininess = 10.0,
    reflective = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    reflectivity = 0.0,
    transparent = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 1.0, 1.0, 1.0},
    },
    transparency = 1.0,
    index_of_refraction = 0.0,
  }
}
ns.effect_detail = {
  type = collada_types.effect_type.BLINN,
  blinn = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.8784314, 0.6117647, 0.5921569, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.8784314, 0.6117647, 0.5921569, 1.0},
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    shininess = 10.0,
    reflective = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    reflectivity = 0.0,
    transparent = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 1.0, 1.0, 1.0},
    },
    transparency = 1.0,
    index_of_refraction = 0.0,
  }
}
ns.effect_frontarms = {
  type = collada_types.effect_type.BLINN,
  blinn = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.7803922, 0.5960785, 0.8980393, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.7803922, 0.5960785, 0.8980393, 1.0},
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    shininess = 10.0,
    reflective = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    reflectivity = 0.0,
    transparent = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 1.0, 1.0, 1.0},
    },
    transparency = 1.0,
    index_of_refraction = 0.0,
  }
}
ns.effect_coloreffectr204g204b204 = {
  type = collada_types.effect_type.PHONG,
  phong = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 0.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.8, 0.8, 0.8, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.8, 0.8, 0.8, 1.0},
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 1.0, 1.0, 1.0},
    },
    shininess = 10.0,
    reflective = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    reflectivity = 0.0,
    transparent = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 1.0, 1.0, 1.0},
    },
    transparency = 1.0,
    index_of_refraction = 0.0,
  }
}
ns.effect_frontarmssupports = {
  type = collada_types.effect_type.BLINN,
  blinn = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.5882353, 0.6901961, 0.8039216, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.5882353, 0.6901961, 0.8039216, 1.0},
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    shininess = 10.0,
    reflective = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    reflectivity = 0.0,
    transparent = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 1.0, 1.0, 1.0},
    },
    transparency = 1.0,
    index_of_refraction = 0.0,
  }
}
ns.effect_frontarmsseparated = {
  type = collada_types.effect_type.BLINN,
  blinn = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.8313726, 0.8235295, 0.5882353, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.8313726, 0.8235295, 0.5882353, 1.0},
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    shininess = 10.0,
    reflective = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    reflectivity = 0.0,
    transparent = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 1.0, 1.0, 1.0},
    },
    transparency = 1.0,
    index_of_refraction = 0.0,
  }
}
ns.effect_armorpaneltrim = {
  type = collada_types.effect_type.BLINN,
  blinn = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.588, 0.588, 0.588, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.588, 0.588, 0.588, 1.0},
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    shininess = 10.0,
    reflective = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    reflectivity = 0.0,
    transparent = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 1.0, 1.0, 1.0},
    },
    transparency = 1.0,
    index_of_refraction = 0.0,
  }
}
ns.material_coloreffectr204g204b204_material = {
  effect = ns.effect_coloreffectr204g204b204,
}
ns.material_cockpit_material = {
  effect = ns.effect_cockpit,
}
ns.material_detail_material = {
  effect = ns.effect_detail,
}
ns.material_frontarms_material = {
  effect = ns.effect_frontarms,
}
ns.material_frontarmssupports_material = {
  effect = ns.effect_frontarmssupports,
}
ns.material_frontarmsseparated_material = {
  effect = ns.effect_frontarmsseparated,
}
ns.material_armorpaneltrim_material = {
  effect = ns.effect_armorpaneltrim,
}
ns.input_elements_position_0_3_normal_0_3_texcoord_0_3 = {
  {
    semantic = "POSITION",
    semantic_index = 0,
    format = collada_types.input_format.FLOAT3,
  },
  {
    semantic = "NORMAL",
    semantic_index = 0,
    format = collada_types.input_format.FLOAT3,
  },
  {
    semantic = "TEXCOORD",
    semantic_index = 0,
    format = collada_types.input_format.FLOAT3,
  },
}
ns.triangles_geom_armor_panels_001 = {
  {
    count = 172, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_armor_panels_001 = {
  mesh = {
    triangles = ns.triangles_geom_armor_panels_001,
    triangles_count = 1,

    vertex_buffer_offset = 0,
    vertex_buffer_size = 24768,

    index_buffer_offset = 0,
    index_buffer_size = 2064,
  }
}
ns.triangles_geom_cockpit_pipes = {
  {
    count = 168, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_cockpit_pipes = {
  mesh = {
    triangles = ns.triangles_geom_cockpit_pipes,
    triangles_count = 1,

    vertex_buffer_offset = 24768,
    vertex_buffer_size = 24192,

    index_buffer_offset = 2064,
    index_buffer_size = 2016,
  }
}
ns.triangles_geom_cockpit_detail_radiator = {
  {
    count = 92, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_cockpit_detail_radiator = {
  mesh = {
    triangles = ns.triangles_geom_cockpit_detail_radiator,
    triangles_count = 1,

    vertex_buffer_offset = 48960,
    vertex_buffer_size = 13248,

    index_buffer_offset = 4080,
    index_buffer_size = 1104,
  }
}
ns.triangles_geom_cockpit_detail = {
  {
    count = 80, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_cockpit_detail = {
  mesh = {
    triangles = ns.triangles_geom_cockpit_detail,
    triangles_count = 1,

    vertex_buffer_offset = 62208,
    vertex_buffer_size = 11520,

    index_buffer_offset = 5184,
    index_buffer_size = 960,
  }
}
ns.triangles_geom_front_arm_slot_detail = {
  {
    count = 360, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_front_arm_slot_detail = {
  mesh = {
    triangles = ns.triangles_geom_front_arm_slot_detail,
    triangles_count = 1,

    vertex_buffer_offset = 73728,
    vertex_buffer_size = 51840,

    index_buffer_offset = 6144,
    index_buffer_size = 4320,
  }
}
ns.triangles_geom_wings_detail = {
  {
    count = 168, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_wings_detail = {
  mesh = {
    triangles = ns.triangles_geom_wings_detail,
    triangles_count = 1,

    vertex_buffer_offset = 125568,
    vertex_buffer_size = 24192,

    index_buffer_offset = 10464,
    index_buffer_size = 2016,
  }
}
ns.triangles_geom_fin_carbon_fiber = {
  {
    count = 1444, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_fin_carbon_fiber = {
  mesh = {
    triangles = ns.triangles_geom_fin_carbon_fiber,
    triangles_count = 1,

    vertex_buffer_offset = 149760,
    vertex_buffer_size = 207936,

    index_buffer_offset = 12480,
    index_buffer_size = 17328,
  }
}
ns.triangles_geom_rear_exhaust_detail = {
  {
    count = 600, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_rear_exhaust_detail = {
  mesh = {
    triangles = ns.triangles_geom_rear_exhaust_detail,
    triangles_count = 1,

    vertex_buffer_offset = 357696,
    vertex_buffer_size = 86400,

    index_buffer_offset = 29808,
    index_buffer_size = 7200,
  }
}
ns.triangles_geom_rear_exhaust = {
  {
    count = 120, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_rear_exhaust = {
  mesh = {
    triangles = ns.triangles_geom_rear_exhaust,
    triangles_count = 1,

    vertex_buffer_offset = 444096,
    vertex_buffer_size = 17280,

    index_buffer_offset = 37008,
    index_buffer_size = 1440,
  }
}
ns.triangles_geom_front_arm_separated_supports = {
  {
    count = 448, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_front_arm_separated_supports = {
  mesh = {
    triangles = ns.triangles_geom_front_arm_separated_supports,
    triangles_count = 1,

    vertex_buffer_offset = 461376,
    vertex_buffer_size = 64512,

    index_buffer_offset = 38448,
    index_buffer_size = 5376,
  }
}
ns.triangles_geom_front_arm_separated = {
  {
    count = 272, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_front_arm_separated = {
  mesh = {
    triangles = ns.triangles_geom_front_arm_separated,
    triangles_count = 1,

    vertex_buffer_offset = 525888,
    vertex_buffer_size = 39168,

    index_buffer_offset = 43824,
    index_buffer_size = 3264,
  }
}
ns.triangles_geom_front_arm_detail = {
  {
    count = 1008, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_front_arm_detail = {
  mesh = {
    triangles = ns.triangles_geom_front_arm_detail,
    triangles_count = 1,

    vertex_buffer_offset = 565056,
    vertex_buffer_size = 145152,

    index_buffer_offset = 47088,
    index_buffer_size = 12096,
  }
}
ns.triangles_geom_front_arms = {
  {
    count = 856, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_front_arms = {
  mesh = {
    triangles = ns.triangles_geom_front_arms,
    triangles_count = 1,

    vertex_buffer_offset = 710208,
    vertex_buffer_size = 123264,

    index_buffer_offset = 59184,
    index_buffer_size = 10272,
  }
}
ns.triangles_geom_rear_center_engine = {
  {
    count = 224, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_rear_center_engine = {
  mesh = {
    triangles = ns.triangles_geom_rear_center_engine,
    triangles_count = 1,

    vertex_buffer_offset = 833472,
    vertex_buffer_size = 32256,

    index_buffer_offset = 69456,
    index_buffer_size = 2688,
  }
}
ns.triangles_geom_armor_panels = {
  {
    count = 492, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_armor_panels = {
  mesh = {
    triangles = ns.triangles_geom_armor_panels,
    triangles_count = 1,

    vertex_buffer_offset = 865728,
    vertex_buffer_size = 70848,

    index_buffer_offset = 72144,
    index_buffer_size = 5904,
  }
}
ns.triangles_geom_guns = {
  {
    count = 356, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_guns = {
  mesh = {
    triangles = ns.triangles_geom_guns,
    triangles_count = 1,

    vertex_buffer_offset = 936576,
    vertex_buffer_size = 51264,

    index_buffer_offset = 78048,
    index_buffer_size = 4272,
  }
}
ns.triangles_geom_wings = {
  {
    count = 852, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_wings = {
  mesh = {
    triangles = ns.triangles_geom_wings,
    triangles_count = 1,

    vertex_buffer_offset = 987840,
    vertex_buffer_size = 122688,

    index_buffer_offset = 82320,
    index_buffer_size = 10224,
  }
}
ns.triangles_geom_cockpit = {
  {
    count = 406, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_cockpit = {
  mesh = {
    triangles = ns.triangles_geom_cockpit,
    triangles_count = 1,

    vertex_buffer_offset = 1110528,
    vertex_buffer_size = 58464,

    index_buffer_offset = 92544,
    index_buffer_size = 4872,
  }
}
ns.geometries = {
  ns.geometry_geom_armor_panels_001,
  ns.geometry_geom_cockpit_pipes,
  ns.geometry_geom_cockpit_detail_radiator,
  ns.geometry_geom_cockpit_detail,
  ns.geometry_geom_front_arm_slot_detail,
  ns.geometry_geom_wings_detail,
  ns.geometry_geom_fin_carbon_fiber,
  ns.geometry_geom_rear_exhaust_detail,
  ns.geometry_geom_rear_exhaust,
  ns.geometry_geom_front_arm_separated_supports,
  ns.geometry_geom_front_arm_separated,
  ns.geometry_geom_front_arm_detail,
  ns.geometry_geom_front_arms,
  ns.geometry_geom_rear_center_engine,
  ns.geometry_geom_armor_panels,
  ns.geometry_geom_guns,
  ns.geometry_geom_wings,
  ns.geometry_geom_cockpit,
}
ns.transforms_node_environmentambientlight = {
}
ns.instance_geometries_node_environmentambientlight = {
}
ns.instance_controllers_node_environmentambientlight = {
}
ns.instance_lights_node_environmentambientlight = {
  {
    light = ns.light_environmentambientlight,
  }
}
ns.node_channels_node_environmentambientlight = {
}
ns.node_node_environmentambientlight = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_environmentambientlight,
  transforms_count = 0,

  instance_geometries = ns.instance_geometries_node_environmentambientlight,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_environmentambientlight,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_environmentambientlight,
  instance_lights_count = 1,

  channels = ns.node_channels_node_environmentambientlight,
  channels_count = 0,
}
ns.transforms_node_armor_panels_001 = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_armor_panels_001_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_cockpit_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_armor_panels_001 = {
  {
    geometry = ns.geometry_geom_armor_panels_001,

    instance_materials = ns.instance_geometry_instance_materials_node_armor_panels_001_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_armor_panels_001 = {
}
ns.instance_lights_node_armor_panels_001 = {
}
ns.node_channels_node_armor_panels_001 = {
}
ns.node_node_armor_panels_001 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_armor_panels_001,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_armor_panels_001,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_armor_panels_001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_armor_panels_001,
  instance_lights_count = 0,

  channels = ns.node_channels_node_armor_panels_001,
  channels_count = 0,
}
ns.transforms_node_cockpit_pipes = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {0.0, -36.14023, 0.0},
  },
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_cockpit_pipes_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_detail_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_cockpit_pipes = {
  {
    geometry = ns.geometry_geom_cockpit_pipes,

    instance_materials = ns.instance_geometry_instance_materials_node_cockpit_pipes_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_cockpit_pipes = {
}
ns.instance_lights_node_cockpit_pipes = {
}
ns.node_channels_node_cockpit_pipes = {
}
ns.node_node_cockpit_pipes = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_cockpit_pipes,
  transforms_count = 2,

  instance_geometries = ns.instance_geometries_node_cockpit_pipes,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_cockpit_pipes,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_cockpit_pipes,
  instance_lights_count = 0,

  channels = ns.node_channels_node_cockpit_pipes,
  channels_count = 0,
}
ns.transforms_node_cockpit_detail_radiator = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_cockpit_detail_radiator_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_detail_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_cockpit_detail_radiator = {
  {
    geometry = ns.geometry_geom_cockpit_detail_radiator,

    instance_materials = ns.instance_geometry_instance_materials_node_cockpit_detail_radiator_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_cockpit_detail_radiator = {
}
ns.instance_lights_node_cockpit_detail_radiator = {
}
ns.node_channels_node_cockpit_detail_radiator = {
}
ns.node_node_cockpit_detail_radiator = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_cockpit_detail_radiator,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_cockpit_detail_radiator,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_cockpit_detail_radiator,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_cockpit_detail_radiator,
  instance_lights_count = 0,

  channels = ns.node_channels_node_cockpit_detail_radiator,
  channels_count = 0,
}
ns.transforms_node_cockpit_detail = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-0.5615555, -64.91759, 21.61353},
  },
  {
    type = collada_types.transform_type.SCALE,
    scale = {10.6387, 7.055854, 7.055854},
  },
}
ns.instance_geometry_instance_materials_node_cockpit_detail_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_detail_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_cockpit_detail = {
  {
    geometry = ns.geometry_geom_cockpit_detail,

    instance_materials = ns.instance_geometry_instance_materials_node_cockpit_detail_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_cockpit_detail = {
}
ns.instance_lights_node_cockpit_detail = {
}
ns.node_channels_node_cockpit_detail = {
}
ns.node_node_cockpit_detail = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_cockpit_detail,
  transforms_count = 2,

  instance_geometries = ns.instance_geometries_node_cockpit_detail,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_cockpit_detail,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_cockpit_detail,
  instance_lights_count = 0,

  channels = ns.node_channels_node_cockpit_detail,
  channels_count = 0,
}
ns.transforms_node_front_arm_slot_detail = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_front_arm_slot_detail_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_detail_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_front_arm_slot_detail = {
  {
    geometry = ns.geometry_geom_front_arm_slot_detail,

    instance_materials = ns.instance_geometry_instance_materials_node_front_arm_slot_detail_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_front_arm_slot_detail = {
}
ns.instance_lights_node_front_arm_slot_detail = {
}
ns.node_channels_node_front_arm_slot_detail = {
}
ns.node_node_front_arm_slot_detail = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_front_arm_slot_detail,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_front_arm_slot_detail,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_front_arm_slot_detail,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_front_arm_slot_detail,
  instance_lights_count = 0,

  channels = ns.node_channels_node_front_arm_slot_detail,
  channels_count = 0,
}
ns.transforms_node_wings_detail = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_wings_detail_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_detail_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_wings_detail = {
  {
    geometry = ns.geometry_geom_wings_detail,

    instance_materials = ns.instance_geometry_instance_materials_node_wings_detail_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_wings_detail = {
}
ns.instance_lights_node_wings_detail = {
}
ns.node_channels_node_wings_detail = {
}
ns.node_node_wings_detail = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_wings_detail,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_wings_detail,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_wings_detail,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_wings_detail,
  instance_lights_count = 0,

  channels = ns.node_channels_node_wings_detail,
  channels_count = 0,
}
ns.transforms_node_fin_carbon_fiber = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_fin_carbon_fiber_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_frontarms_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_fin_carbon_fiber = {
  {
    geometry = ns.geometry_geom_fin_carbon_fiber,

    instance_materials = ns.instance_geometry_instance_materials_node_fin_carbon_fiber_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_fin_carbon_fiber = {
}
ns.instance_lights_node_fin_carbon_fiber = {
}
ns.node_channels_node_fin_carbon_fiber = {
}
ns.node_node_fin_carbon_fiber = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_fin_carbon_fiber,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_fin_carbon_fiber,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_fin_carbon_fiber,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_fin_carbon_fiber,
  instance_lights_count = 0,

  channels = ns.node_channels_node_fin_carbon_fiber,
  channels_count = 0,
}
ns.transforms_node_rear_exhaust_detail = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_rear_exhaust_detail_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_detail_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_rear_exhaust_detail = {
  {
    geometry = ns.geometry_geom_rear_exhaust_detail,

    instance_materials = ns.instance_geometry_instance_materials_node_rear_exhaust_detail_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_rear_exhaust_detail = {
}
ns.instance_lights_node_rear_exhaust_detail = {
}
ns.node_channels_node_rear_exhaust_detail = {
}
ns.node_node_rear_exhaust_detail = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_rear_exhaust_detail,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_rear_exhaust_detail,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_rear_exhaust_detail,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_rear_exhaust_detail,
  instance_lights_count = 0,

  channels = ns.node_channels_node_rear_exhaust_detail,
  channels_count = 0,
}
ns.transforms_node_rear_exhaust = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_rear_exhaust_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_coloreffectr204g204b204_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_rear_exhaust = {
  {
    geometry = ns.geometry_geom_rear_exhaust,

    instance_materials = ns.instance_geometry_instance_materials_node_rear_exhaust_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_rear_exhaust = {
}
ns.instance_lights_node_rear_exhaust = {
}
ns.node_channels_node_rear_exhaust = {
}
ns.node_node_rear_exhaust = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_rear_exhaust,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_rear_exhaust,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_rear_exhaust,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_rear_exhaust,
  instance_lights_count = 0,

  channels = ns.node_channels_node_rear_exhaust,
  channels_count = 0,
}
ns.transforms_node_front_arm_separated_supports = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_front_arm_separated_supports_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_frontarmssupports_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_front_arm_separated_supports = {
  {
    geometry = ns.geometry_geom_front_arm_separated_supports,

    instance_materials = ns.instance_geometry_instance_materials_node_front_arm_separated_supports_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_front_arm_separated_supports = {
}
ns.instance_lights_node_front_arm_separated_supports = {
}
ns.node_channels_node_front_arm_separated_supports = {
}
ns.node_node_front_arm_separated_supports = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_front_arm_separated_supports,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_front_arm_separated_supports,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_front_arm_separated_supports,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_front_arm_separated_supports,
  instance_lights_count = 0,

  channels = ns.node_channels_node_front_arm_separated_supports,
  channels_count = 0,
}
ns.transforms_node_front_arm_separated = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_front_arm_separated_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_frontarmsseparated_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_front_arm_separated = {
  {
    geometry = ns.geometry_geom_front_arm_separated,

    instance_materials = ns.instance_geometry_instance_materials_node_front_arm_separated_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_front_arm_separated = {
}
ns.instance_lights_node_front_arm_separated = {
}
ns.node_channels_node_front_arm_separated = {
}
ns.node_node_front_arm_separated = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_front_arm_separated,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_front_arm_separated,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_front_arm_separated,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_front_arm_separated,
  instance_lights_count = 0,

  channels = ns.node_channels_node_front_arm_separated,
  channels_count = 0,
}
ns.transforms_node_front_arm_detail = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {0.0, -69.02815, 0.0},
  },
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 35.50438, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_front_arm_detail_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_detail_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_front_arm_detail = {
  {
    geometry = ns.geometry_geom_front_arm_detail,

    instance_materials = ns.instance_geometry_instance_materials_node_front_arm_detail_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_front_arm_detail = {
}
ns.instance_lights_node_front_arm_detail = {
}
ns.node_channels_node_front_arm_detail = {
}
ns.node_node_front_arm_detail = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_front_arm_detail,
  transforms_count = 2,

  instance_geometries = ns.instance_geometries_node_front_arm_detail,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_front_arm_detail,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_front_arm_detail,
  instance_lights_count = 0,

  channels = ns.node_channels_node_front_arm_detail,
  channels_count = 0,
}
ns.transforms_node_front_arms = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_front_arms_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_frontarms_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_front_arms = {
  {
    geometry = ns.geometry_geom_front_arms,

    instance_materials = ns.instance_geometry_instance_materials_node_front_arms_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_front_arms = {
}
ns.instance_lights_node_front_arms = {
}
ns.node_channels_node_front_arms = {
}
ns.node_node_front_arms = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_front_arms,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_front_arms,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_front_arms,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_front_arms,
  instance_lights_count = 0,

  channels = ns.node_channels_node_front_arms,
  channels_count = 0,
}
ns.transforms_node_rear_center_engine = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_rear_center_engine_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_detail_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_rear_center_engine = {
  {
    geometry = ns.geometry_geom_rear_center_engine,

    instance_materials = ns.instance_geometry_instance_materials_node_rear_center_engine_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_rear_center_engine = {
}
ns.instance_lights_node_rear_center_engine = {
}
ns.node_channels_node_rear_center_engine = {
}
ns.node_node_rear_center_engine = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_rear_center_engine,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_rear_center_engine,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_rear_center_engine,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_rear_center_engine,
  instance_lights_count = 0,

  channels = ns.node_channels_node_rear_center_engine,
  channels_count = 0,
}
ns.transforms_node_armor_panels = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_armor_panels_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_armorpaneltrim_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_armor_panels = {
  {
    geometry = ns.geometry_geom_armor_panels,

    instance_materials = ns.instance_geometry_instance_materials_node_armor_panels_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_armor_panels = {
}
ns.instance_lights_node_armor_panels = {
}
ns.node_channels_node_armor_panels = {
}
ns.node_node_armor_panels = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_armor_panels,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_armor_panels,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_armor_panels,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_armor_panels,
  instance_lights_count = 0,

  channels = ns.node_channels_node_armor_panels,
  channels_count = 0,
}
ns.transforms_node_guns = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_guns_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_cockpit_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_guns = {
  {
    geometry = ns.geometry_geom_guns,

    instance_materials = ns.instance_geometry_instance_materials_node_guns_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_guns = {
}
ns.instance_lights_node_guns = {
}
ns.node_channels_node_guns = {
}
ns.node_node_guns = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_guns,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_guns,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_guns,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_guns,
  instance_lights_count = 0,

  channels = ns.node_channels_node_guns,
  channels_count = 0,
}
ns.transforms_node_wings = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_wings_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_cockpit_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_wings = {
  {
    geometry = ns.geometry_geom_wings,

    instance_materials = ns.instance_geometry_instance_materials_node_wings_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_wings = {
}
ns.instance_lights_node_wings = {
}
ns.node_channels_node_wings = {
}
ns.node_node_wings = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_wings,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_wings,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_wings,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_wings,
  instance_lights_count = 0,

  channels = ns.node_channels_node_wings,
  channels_count = 0,
}
ns.transforms_node_cockpit = {
  {
    type = collada_types.transform_type.SCALE,
    scale = {39.37008, 39.37008, 39.37008},
  },
}
ns.instance_geometry_instance_materials_node_cockpit_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_cockpit_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_cockpit = {
  {
    geometry = ns.geometry_geom_cockpit,

    instance_materials = ns.instance_geometry_instance_materials_node_cockpit_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_cockpit = {
}
ns.instance_lights_node_cockpit = {
}
ns.node_channels_node_cockpit = {
}
ns.node_node_cockpit = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_cockpit,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_cockpit,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_cockpit,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_cockpit,
  instance_lights_count = 0,

  channels = ns.node_channels_node_cockpit,
  channels_count = 0,
}
ns.nodes = {
  ns.node_node_environmentambientlight, -- 0
  ns.node_node_armor_panels_001, -- 1
  ns.node_node_cockpit_pipes, -- 2
  ns.node_node_cockpit_detail_radiator, -- 3
  ns.node_node_cockpit_detail, -- 4
  ns.node_node_front_arm_slot_detail, -- 5
  ns.node_node_wings_detail, -- 6
  ns.node_node_fin_carbon_fiber, -- 7
  ns.node_node_rear_exhaust_detail, -- 8
  ns.node_node_rear_exhaust, -- 9
  ns.node_node_front_arm_separated_supports, -- 10
  ns.node_node_front_arm_separated, -- 11
  ns.node_node_front_arm_detail, -- 12
  ns.node_node_front_arms, -- 13
  ns.node_node_rear_center_engine, -- 14
  ns.node_node_armor_panels, -- 15
  ns.node_node_guns, -- 16
  ns.node_node_wings, -- 17
  ns.node_node_cockpit, -- 18
}
ns.inputs_list = {
  {
    elements = ns.input_elements_position_0_3_normal_0_3_texcoord_0_3,
    elements_count = 3,
  },
}
ns.descriptor = {
  nodes = ns.nodes,
  nodes_count = #ns.nodes,

  geometries = ns.geometries,
  nodes_count = #ns.geometries,

  inputs_list = ns.inputs_list,
  inputs_list_count = #ns.inputs_list,

  images = ns.images,
  images_count = #ns.images,

}

return {
  descriptor = ns.descriptor
}
