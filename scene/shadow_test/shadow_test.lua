local collada_types = require 'collada_types'

local ns = {}
ns.camera_camera001_camera = {
  xfov = 45.0,
  yfov = 0.0,
  znear = 1.0,
  zfar = 1000.0,
  aspect_ratio = 0.0,
}
ns.light_environmentambientlight = {
  type = collada_types.light_type.AMBIENT,
  color = {0.0, 0.0, 0.0},
}
ns.light_direct001_light = {
  type = collada_types.light_type.DIRECTIONAL,
  color = {1.0, 1.0, 1.0},
}
ns.images = {
}
ns.effect_material__148 = {
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
ns.effect_coloreffectr5g54b179 = {
  type = collada_types.effect_type.PHONG,
  phong = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 0.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.01960784, 0.2117647, 0.7019608, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.01960784, 0.2117647, 0.7019608, 1.0},
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
ns.effect_coloreffectr134g110b8 = {
  type = collada_types.effect_type.PHONG,
  phong = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 0.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.5254902, 0.4313725, 0.03137255, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.5254902, 0.4313725, 0.03137255, 1.0},
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
ns.effect_coloreffectr255g229b0 = {
  type = collada_types.effect_type.PHONG,
  phong = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 0.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 0.8980392, 0.0, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {1.0, 0.8980392, 0.0, 1.0},
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
ns.effect_coloreffectr6g134b6 = {
  type = collada_types.effect_type.PHONG,
  phong = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 0.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.02352941, 0.5254902, 0.02352941, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.02352941, 0.5254902, 0.02352941, 1.0},
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
ns.effect_coloreffectr88g88b225 = {
  type = collada_types.effect_type.PHONG,
  phong = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 0.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.345098, 0.345098, 0.8823529, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.345098, 0.345098, 0.8823529, 1.0},
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
ns.material_coloreffectr5g54b179_material = {
  effect = ns.effect_coloreffectr5g54b179,
}
ns.material_coloreffectr134g110b8_material = {
  effect = ns.effect_coloreffectr134g110b8,
}
ns.material_coloreffectr255g229b0_material = {
  effect = ns.effect_coloreffectr255g229b0,
}
ns.material_coloreffectr6g134b6_material = {
  effect = ns.effect_coloreffectr6g134b6,
}
ns.material_coloreffectr88g88b225_material = {
  effect = ns.effect_coloreffectr88g88b225,
}
ns.material_material__148_material = {
  effect = ns.effect_material__148,
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
ns.triangles_geom_plane001 = {
  {
    count = 20000, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_plane001 = {
  mesh = {
    triangles = ns.triangles_geom_plane001,
    triangles_count = 1,

    vertex_buffer_offset = 0,
    vertex_buffer_size = 489648,

    index_buffer_offset = 0,
    index_buffer_size = 240000,
  }
}
ns.triangles_geom_torus_knot001 = {
  {
    count = 2880, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_torus_knot001 = {
  mesh = {
    triangles = ns.triangles_geom_torus_knot001,
    triangles_count = 1,

    vertex_buffer_offset = 489648,
    vertex_buffer_size = 75504,

    index_buffer_offset = 240000,
    index_buffer_size = 34560,
  }
}
ns.triangles_geom_cone001 = {
  {
    count = 288, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_cone001 = {
  mesh = {
    triangles = ns.triangles_geom_cone001,
    triangles_count = 1,

    vertex_buffer_offset = 565152,
    vertex_buffer_size = 9984,

    index_buffer_offset = 274560,
    index_buffer_size = 3456,
  }
}
ns.triangles_geom_box001 = {
  {
    count = 32, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_box001 = {
  mesh = {
    triangles = ns.triangles_geom_box001,
    triangles_count = 1,

    vertex_buffer_offset = 575136,
    vertex_buffer_size = 3840,

    index_buffer_offset = 278016,
    index_buffer_size = 384,
  }
}
ns.geometries = {
  ns.geometry_geom_plane001,
  ns.geometry_geom_torus_knot001,
  ns.geometry_geom_cone001,
  ns.geometry_geom_box001,
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
  node_name = "node_environmentambientlight",

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
ns.transforms_node_plane001 = {
}
ns.instance_geometry_instance_materials_node_plane001_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_material__148_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_plane001 = {
  {
    geometry = ns.geometry_geom_plane001,

    instance_materials = ns.instance_geometry_instance_materials_node_plane001_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_plane001 = {
}
ns.instance_lights_node_plane001 = {
}
ns.node_channels_node_plane001 = {
}
ns.node_node_plane001 = {
  node_name = "node_plane001",

  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_plane001,
  transforms_count = 0,

  instance_geometries = ns.instance_geometries_node_plane001,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_plane001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_plane001,
  instance_lights_count = 0,

  channels = ns.node_channels_node_plane001,
  channels_count = 0,
}
ns.transforms_node_camera001 = {
  {
    type = collada_types.transform_type.MATRIX,
    matrix = {-0.8666914, -0.4987199, -0.01115339, 0.0, 0.377458, -0.6702487, 0.6389774, 0.0, -0.3261463, 0.5495863, 0.7691447, 0.0, -85.35754, 169.1221, 269.2574, 1.0},
  },
}
ns.instance_geometries_node_camera001 = {
}
ns.instance_controllers_node_camera001 = {
}
ns.instance_lights_node_camera001 = {
}
ns.node_channels_node_camera001 = {
}
ns.node_node_camera001 = {
  node_name = "node_camera001",

  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_camera001,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_camera001,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_camera001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_camera001,
  instance_lights_count = 0,

  channels = ns.node_channels_node_camera001,
  channels_count = 0,
}
ns.transforms_node_camera001_target = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {10.26849, 7.983534, 43.74428},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {-0.7700763, 0.318976, 0.5524825, -73.7201},
  },
}
ns.instance_geometries_node_camera001_target = {
}
ns.instance_controllers_node_camera001_target = {
}
ns.instance_lights_node_camera001_target = {
}
ns.node_channels_node_camera001_target = {
}
ns.node_node_camera001_target = {
  node_name = "node_camera001_target",

  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_camera001_target,
  transforms_count = 2,

  instance_geometries = ns.instance_geometries_node_camera001_target,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_camera001_target,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_camera001_target,
  instance_lights_count = 0,

  channels = ns.node_channels_node_camera001_target,
  channels_count = 0,
}
ns.transforms_node_torus_knot001 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-6.954298, 40.46052, 74.58796},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {-0.5773502, 0.5773503, 0.5773503, -120.0},
  },
}
ns.instance_geometry_instance_materials_node_torus_knot001_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_coloreffectr134g110b8_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_torus_knot001 = {
  {
    geometry = ns.geometry_geom_torus_knot001,

    instance_materials = ns.instance_geometry_instance_materials_node_torus_knot001_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_torus_knot001 = {
}
ns.instance_lights_node_torus_knot001 = {
}
ns.node_channels_node_torus_knot001 = {
}
ns.node_node_torus_knot001 = {
  node_name = "node_torus_knot001",

  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_torus_knot001,
  transforms_count = 2,

  instance_geometries = ns.instance_geometries_node_torus_knot001,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_torus_knot001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_torus_knot001,
  instance_lights_count = 0,

  channels = ns.node_channels_node_torus_knot001,
  channels_count = 0,
}
ns.transforms_node_direct001 = {
  {
    type = collada_types.transform_type.MATRIX,
    matrix = {-0.5428072, 0.8398573, 0.0, 0.0, -0.7717882, -0.4988136, 0.3943704, 0.0, 0.3312148, 0.2140671, 0.9189516, 0.0, 60.17801, 38.89358, 166.9632, 1.0},
  },
}
ns.instance_geometries_node_direct001 = {
}
ns.instance_controllers_node_direct001 = {
}
ns.instance_lights_node_direct001 = {
  {
    light = ns.light_direct001_light,
  }
}
ns.node_channels_node_direct001 = {
}
ns.node_node_direct001 = {
  node_name = "node_direct001",

  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_direct001,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_direct001,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_direct001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_direct001,
  instance_lights_count = 1,

  channels = ns.node_channels_node_direct001,
  channels_count = 0,
}
ns.transforms_node_direct001_target = {
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {-0.5773502, 0.5773503, 0.5773503, -120.0},
  },
}
ns.instance_geometries_node_direct001_target = {
}
ns.instance_controllers_node_direct001_target = {
}
ns.instance_lights_node_direct001_target = {
}
ns.node_channels_node_direct001_target = {
}
ns.node_node_direct001_target = {
  node_name = "node_direct001_target",

  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_direct001_target,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_direct001_target,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_direct001_target,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_direct001_target,
  instance_lights_count = 0,

  channels = ns.node_channels_node_direct001_target,
  channels_count = 0,
}
ns.transforms_node_cone001 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-70.49181, -17.80504, 52.78688},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {1.0, 0.0, 0.0, -89.7081},
  },
}
ns.instance_geometry_instance_materials_node_cone001_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_coloreffectr6g134b6_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_cone001 = {
  {
    geometry = ns.geometry_geom_cone001,

    instance_materials = ns.instance_geometry_instance_materials_node_cone001_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_cone001 = {
}
ns.instance_lights_node_cone001 = {
}
ns.node_channels_node_cone001 = {
}
ns.node_node_cone001 = {
  node_name = "node_cone001",

  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_cone001,
  transforms_count = 2,

  instance_geometries = ns.instance_geometries_node_cone001,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_cone001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_cone001,
  instance_lights_count = 0,

  channels = ns.node_channels_node_cone001,
  channels_count = 0,
}
ns.transforms_node_box001 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {72.78688, -2.19274e-06, 50.16393},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {-1.0, 0.0, 0.0, -90.0},
  },
}
ns.instance_geometry_instance_materials_node_box001_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_coloreffectr88g88b225_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_geometries_node_box001 = {
  {
    geometry = ns.geometry_geom_box001,

    instance_materials = ns.instance_geometry_instance_materials_node_box001_0,
    instance_materials_count = 1,
  },
}
ns.instance_controllers_node_box001 = {
}
ns.instance_lights_node_box001 = {
}
ns.node_channels_node_box001 = {
}
ns.node_node_box001 = {
  node_name = "node_box001",

  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_box001,
  transforms_count = 2,

  instance_geometries = ns.instance_geometries_node_box001,
  instance_geometries_count = 1,

  instance_controllers = ns.instance_controllers_node_box001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_box001,
  instance_lights_count = 0,

  channels = ns.node_channels_node_box001,
  channels_count = 0,
}
ns.nodes = {
  ns.node_node_environmentambientlight, -- 0
  ns.node_node_plane001, -- 1
  ns.node_node_camera001, -- 2
  ns.node_node_camera001_target, -- 3
  ns.node_node_torus_knot001, -- 4
  ns.node_node_direct001, -- 5
  ns.node_node_direct001_target, -- 6
  ns.node_node_cone001, -- 7
  ns.node_node_box001, -- 8
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
