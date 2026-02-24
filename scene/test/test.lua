local collada_types = require 'collada_types'

local camera_camera_camera = {
  xfov = 45.0,
  yfov = 0.0,
  znear = 1.0,
  zfar = 1000.0,
  aspect_ratio = 0.0,
}
local light_environmentambientlight = {
  type = collada_types.light_type.AMBIENT,
  color = {0.0, 0.0, 0.0},
}
local light_omni001_light = {
  type = collada_types.light_type.POINT,
  color = {1.0, 1.0, 1.0},
}
-- logOnly_png
local image_logonly_png = {
  uri = "./images/0_logOnly.png",
}
local images = {
  image_logonly_png,
}
local effect_material__47 = {
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
      type = collada_types.color_or_texture_type.TEXTURE,
      texture = { image_index = 0 }, -- logOnly_png
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.36, 0.36, 0.36, 1.0},
    },
    shininess = 37.0,
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
local effect_coloreffectr153g228b184 = {
  type = collada_types.effect_type.PHONG,
  phong = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 0.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.6, 0.8941176, 0.7215686, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.6, 0.8941176, 0.7215686, 1.0},
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
local effect_material__46 = {
  type = collada_types.effect_type.BLINN,
  blinn = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 1.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.6941177, 0.1921569, 0.4039216, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.6941177, 0.1921569, 0.4039216, 1.0},
    },
    specular = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.27, 0.27, 0.27, 1.0},
    },
    shininess = 38.0,
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
local effect_coloreffectr5g54b179 = {
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
local material_coloreffectr153g228b184_material = {
  effect = effect_coloreffectr153g228b184,
}
local material_coloreffectr5g54b179_material = {
  effect = effect_coloreffectr5g54b179,
}
local material_material__47_material = {
  effect = effect_material__47,
}
local material_material__46_material = {
  effect = effect_material__46,
}
local input_elements_position_0_3_normal_0_3_texcoord_0_3 = {
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
local triangles_geom_plane = {
  {
    count = 20000, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
local geometry_geom_plane = {
  mesh = {
    triangles = triangles_geom_plane,
    triangles_count = 1,

    vertex_buffer_offset = 0,
    vertex_buffer_size = 367236,

    index_buffer_offset = 0,
    index_buffer_size = 240000,
  }
}
local triangles_geom_torus_knot23 = {
  {
    count = 4800, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
local geometry_geom_torus_knot23 = {
  mesh = {
    triangles = triangles_geom_torus_knot23,
    triangles_count = 1,

    vertex_buffer_offset = 367236,
    vertex_buffer_size = 94068,

    index_buffer_offset = 240000,
    index_buffer_size = 57600,
  }
}
local triangles_geom_torusknot25 = {
  {
    count = 2400, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
local geometry_geom_torusknot25 = {
  mesh = {
    triangles = triangles_geom_torusknot25,
    triangles_count = 1,

    vertex_buffer_offset = 461304,
    vertex_buffer_size = 86832,

    index_buffer_offset = 297600,
    index_buffer_size = 28800,
  }
}
local geometries = {
  geometry_geom_plane,
  geometry_geom_torus_knot23,
  geometry_geom_torusknot25,
}
local transforms_node_environmentambientlight = {
}
local instance_geometries_node_environmentambientlight = {
}
local instance_controllers_node_environmentambientlight = {
}
local instance_lights_node_environmentambientlight = {
  {
    light = light_environmentambientlight,
  }
}
local node_channels_node_environmentambientlight = {
}
local node_node_environmentambientlight = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_environmentambientlight,
  transforms_count = 0,

  instance_geometries = instance_geometries_node_environmentambientlight,
  instance_geometries_count = 0,

  instance_controllers = instance_controllers_node_environmentambientlight,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_environmentambientlight,
  instance_lights_count = 1,

  channels = node_channels_node_environmentambientlight,
  channels_count = 0,
}
local transforms_node_plane = {
}
local instance_geometry_instance_materials_node_plane_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = material_material__47_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = 0 },
    specular = { input_set = -1 },
  },
}
local instance_geometries_node_plane = {
  {
    geometry = geometry_geom_plane,

    instance_materials = instance_geometry_instance_materials_node_plane_0,
    instance_materials_count = 1,
  },
}
local instance_controllers_node_plane = {
}
local instance_lights_node_plane = {
}
local node_channels_node_plane = {
}
local node_node_plane = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_plane,
  transforms_count = 0,

  instance_geometries = instance_geometries_node_plane,
  instance_geometries_count = 1,

  instance_controllers = instance_controllers_node_plane,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_plane,
  instance_lights_count = 0,

  channels = node_channels_node_plane,
  channels_count = 0,
}
local transforms_node_torus_knot23 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-21.94384, -1.68812e-14, 45.45129},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {-1.0, -2.22051e-16, -2.22051e-16, -90.0},
  },
  {
    type = collada_types.transform_type.SCALE,
    scale = {0.5458366, 0.5458366, 0.5458366},
  },
}
local instance_geometry_instance_materials_node_torus_knot23_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = material_coloreffectr153g228b184_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
local instance_geometries_node_torus_knot23 = {
  {
    geometry = geometry_geom_torus_knot23,

    instance_materials = instance_geometry_instance_materials_node_torus_knot23_0,
    instance_materials_count = 1,
  },
}
local instance_controllers_node_torus_knot23 = {
}
local instance_lights_node_torus_knot23 = {
}
local node_channels_node_torus_knot23 = {
}
local node_node_torus_knot23 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_torus_knot23,
  transforms_count = 3,

  instance_geometries = instance_geometries_node_torus_knot23,
  instance_geometries_count = 1,

  instance_controllers = instance_controllers_node_torus_knot23,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_torus_knot23,
  instance_lights_count = 0,

  channels = node_channels_node_torus_knot23,
  channels_count = 0,
}
local transforms_node_torusknot25 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {3.281013, -28.30101, 45.45129},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.9075136, -0.007434183, 0.4199569, -178.1592},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.9893375, 0.0, 0.1456411, -1.382112},
  },
  {
    type = collada_types.transform_type.SCALE,
    scale = {0.5458366, 0.5458367, 0.5458366},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.9893375, 0.0, 0.1456411, 1.382112},
  },
}
local instance_geometry_instance_materials_node_torusknot25_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = material_material__46_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
local instance_geometries_node_torusknot25 = {
  {
    geometry = geometry_geom_torusknot25,

    instance_materials = instance_geometry_instance_materials_node_torusknot25_0,
    instance_materials_count = 1,
  },
}
local instance_controllers_node_torusknot25 = {
}
local instance_lights_node_torusknot25 = {
}
local node_channels_node_torusknot25 = {
}
local node_node_torusknot25 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_torusknot25,
  transforms_count = 5,

  instance_geometries = instance_geometries_node_torusknot25,
  instance_geometries_count = 1,

  instance_controllers = instance_controllers_node_torusknot25,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_torusknot25,
  instance_lights_count = 0,

  channels = node_channels_node_torusknot25,
  channels_count = 0,
}
local transforms_node_camerahelper = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-88.57101, -71.71298, 104.5738},
  },
}
local instance_geometries_node_camerahelper = {
}
local instance_controllers_node_camerahelper = {
}
local instance_lights_node_camerahelper = {
}
local node_channels_node_camerahelper = {
}
local node_node_camerahelper = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_camerahelper,
  transforms_count = 1,

  instance_geometries = instance_geometries_node_camerahelper,
  instance_geometries_count = 0,

  instance_controllers = instance_controllers_node_camerahelper,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_camerahelper,
  instance_lights_count = 0,

  channels = node_channels_node_camerahelper,
  channels_count = 0,
}
local transforms_node_camera = {
  {
    type = collada_types.transform_type.MATRIX,
    matrix = {0.5124585, -0.8587118, -3.72529e-08, 0.0, 0.4546754, 0.2713395, 0.848319, 0.0, -0.7284616, -0.4347285, 0.5294855, 0.0, -5.03627, 0.0, 3.688698, 1.0},
  },
}
local instance_geometries_node_camera = {
}
local instance_controllers_node_camera = {
}
local instance_lights_node_camera = {
}
local node_channels_node_camera = {
}
local node_node_camera = {
  parent_index = 4,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_camera,
  transforms_count = 1,

  instance_geometries = instance_geometries_node_camera,
  instance_geometries_count = 0,

  instance_controllers = instance_controllers_node_camera,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_camera,
  instance_lights_count = 0,

  channels = node_channels_node_camera,
  channels_count = 0,
}
local transforms_node_cameratargethelper = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-19.90239, -27.72767, 54.6898},
  },
}
local instance_geometries_node_cameratargethelper = {
}
local instance_controllers_node_cameratargethelper = {
}
local instance_lights_node_cameratargethelper = {
}
local node_channels_node_cameratargethelper = {
}
local node_node_cameratargethelper = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_cameratargethelper,
  transforms_count = 1,

  instance_geometries = instance_geometries_node_cameratargethelper,
  instance_geometries_count = 0,

  instance_controllers = instance_controllers_node_cameratargethelper,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_cameratargethelper,
  instance_lights_count = 0,

  channels = node_channels_node_cameratargethelper,
  channels_count = 0,
}
local transforms_node_camera_target = {
}
local instance_geometries_node_camera_target = {
}
local instance_controllers_node_camera_target = {
}
local instance_lights_node_camera_target = {
}
local node_channels_node_camera_target = {
}
local node_node_camera_target = {
  parent_index = 6,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_camera_target,
  transforms_count = 0,

  instance_geometries = instance_geometries_node_camera_target,
  instance_geometries_count = 0,

  instance_controllers = instance_controllers_node_camera_target,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_camera_target,
  instance_lights_count = 0,

  channels = node_channels_node_camera_target,
  channels_count = 0,
}
local transforms_node_omni001 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-2.48297e-06, -56.80384, 58.23672},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {-0.5773502, 0.5773503, 0.5773503, -120.0},
  },
}
local instance_geometries_node_omni001 = {
}
local instance_controllers_node_omni001 = {
}
local instance_lights_node_omni001 = {
  {
    light = light_omni001_light,
  }
}
local node_channels_node_omni001 = {
}
local node_node_omni001 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_omni001,
  transforms_count = 2,

  instance_geometries = instance_geometries_node_omni001,
  instance_geometries_count = 0,

  instance_controllers = instance_controllers_node_omni001,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_omni001,
  instance_lights_count = 1,

  channels = node_channels_node_omni001,
  channels_count = 0,
}
local nodes = {
  node_node_environmentambientlight, -- 0
  node_node_plane, -- 1
  node_node_torus_knot23, -- 2
  node_node_torusknot25, -- 3
  node_node_camerahelper, -- 4
  node_node_camera, -- 5
  node_node_cameratargethelper, -- 6
  node_node_camera_target, -- 7
  node_node_omni001, -- 8
}
local inputs_list = {
  {
    elements = input_elements_position_0_3_normal_0_3_texcoord_0_3,
    elements_count = 3,
  },
}
local descriptor = {
  nodes = nodes,
  nodes_count = #nodes,

  geometries = geometries,
  nodes_count = #geometries,

  inputs_list = inputs_list,
  inputs_list_count = #inputs_list,

  images = images,
  images_count = #images,

}

return {
  descriptor = descriptor
}
