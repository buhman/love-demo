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
local array_node_torus_knot23_translation_x_input_array = {
  0.0,
  1.0,
  2.0,
  3.0,
  3.333333,
}
local array_node_torus_knot23_translation_x_output_array = {
  -21.94384,
  17.57915,
  40.64392,
  -0.591423,
  -21.94384,
}
local array_node_torus_knot23_translation_x_intangent_array = {
  -0.3329306, -21.94384,
  0.667, 7.158293,
  1.667, 40.64392,
  2.667, 15.03987,
  3.222333, -21.94384,
}
local array_node_torus_knot23_translation_x_outtangent_array = {
  0.333, -21.94384,
  1.333, 28.00002,
  2.333, 40.64392,
  3.111, -5.801854,
  3.666264, -21.94384,
}
local array_node_torus_knot23_translation_x_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
local sampler_node_torus_knot23_translation_x_sampler = {
  -- node_torus_knot23_translation_x_input
  input = {
    float_array = array_node_torus_knot23_translation_x_input_array,
    count = 5,
    stride = 1,
  },
  -- node_torus_knot23_translation_x_output
  output = {
    float_array = array_node_torus_knot23_translation_x_output_array,
    count = 5,
    stride = 1,
  },
  -- node_torus_knot23_translation_x_intangent
  in_tangent = {
    float_array = array_node_torus_knot23_translation_x_intangent_array,
    count = 5,
    stride = 2,
  },
  -- node_torus_knot23_translation_x_outtangent
  out_tangent = {
    float_array = array_node_torus_knot23_translation_x_outtangent_array,
    count = 5,
    stride = 2,
  },
  -- node_torus_knot23_translation_x_interpolation
  interpolation = {
    interpolation_array = array_node_torus_knot23_translation_x_interpolation_array,
    count = 5,
    stride = 1,
  },
}
local array_node_torus_knot23_translation_y_input_array = {
  0.0,
  1.0,
  2.0,
  3.0,
  3.333333,
}
local array_node_torus_knot23_translation_y_output_array = {
  -1.68812e-14,
  24.27013,
  -12.4935,
  9.835234,
  -1.68812e-14,
}
local array_node_torus_knot23_translation_y_intangent_array = {
  -0.3329306, -1.68812e-14,
  0.667, 24.27013,
  1.667, -12.4935,
  2.667, 9.835234,
  3.222333, -1.68812e-14,
}
local array_node_torus_knot23_translation_y_outtangent_array = {
  0.333, -1.68812e-14,
  1.333, 24.27013,
  2.333, -12.4935,
  3.111, 9.835234,
  3.666264, -1.68812e-14,
}
local array_node_torus_knot23_translation_y_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
local sampler_node_torus_knot23_translation_y_sampler = {
  -- node_torus_knot23_translation_y_input
  input = {
    float_array = array_node_torus_knot23_translation_y_input_array,
    count = 5,
    stride = 1,
  },
  -- node_torus_knot23_translation_y_output
  output = {
    float_array = array_node_torus_knot23_translation_y_output_array,
    count = 5,
    stride = 1,
  },
  -- node_torus_knot23_translation_y_intangent
  in_tangent = {
    float_array = array_node_torus_knot23_translation_y_intangent_array,
    count = 5,
    stride = 2,
  },
  -- node_torus_knot23_translation_y_outtangent
  out_tangent = {
    float_array = array_node_torus_knot23_translation_y_outtangent_array,
    count = 5,
    stride = 2,
  },
  -- node_torus_knot23_translation_y_interpolation
  interpolation = {
    interpolation_array = array_node_torus_knot23_translation_y_interpolation_array,
    count = 5,
    stride = 1,
  },
}
local array_node_torus_knot23_translation_z_input_array = {
  0.0,
  1.0,
  2.0,
  3.0,
  3.333333,
}
local array_node_torus_knot23_translation_z_output_array = {
  45.45129,
  45.45129,
  45.45129,
  45.45129,
  45.45129,
}
local array_node_torus_knot23_translation_z_intangent_array = {
  -0.3329306, 45.45129,
  0.667, 45.45129,
  1.667, 45.45129,
  2.667, 45.45129,
  3.222333, 45.45129,
}
local array_node_torus_knot23_translation_z_outtangent_array = {
  0.333, 45.45129,
  1.333, 45.45129,
  2.333, 45.45129,
  3.111, 45.45129,
  3.666264, 45.45129,
}
local array_node_torus_knot23_translation_z_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
local sampler_node_torus_knot23_translation_z_sampler = {
  -- node_torus_knot23_translation_z_input
  input = {
    float_array = array_node_torus_knot23_translation_z_input_array,
    count = 5,
    stride = 1,
  },
  -- node_torus_knot23_translation_z_output
  output = {
    float_array = array_node_torus_knot23_translation_z_output_array,
    count = 5,
    stride = 1,
  },
  -- node_torus_knot23_translation_z_intangent
  in_tangent = {
    float_array = array_node_torus_knot23_translation_z_intangent_array,
    count = 5,
    stride = 2,
  },
  -- node_torus_knot23_translation_z_outtangent
  out_tangent = {
    float_array = array_node_torus_knot23_translation_z_outtangent_array,
    count = 5,
    stride = 2,
  },
  -- node_torus_knot23_translation_z_interpolation
  interpolation = {
    interpolation_array = array_node_torus_knot23_translation_z_interpolation_array,
    count = 5,
    stride = 1,
  },
}
local array_node_torusknot25_rotationz_angle_input_array = {
  0.0,
  0.5,
  1.0,
  1.5,
  2.0,
  2.5,
  3.333333,
}
local array_node_torusknot25_rotationz_angle_output_array = {
  -2.386905,
  -47.8331,
  -59.67817,
  -40.14935,
  -120.2731,
  -163.7238,
  -2.386905,
}
local array_node_torusknot25_rotationz_angle_intangent_array = {
  -0.3329306, -2.386905,
  0.3335, -38.2941,
  0.8335, -59.67817,
  1.3335, -40.14935,
  1.8335, -99.69791,
  2.3335, -163.7238,
  3.055833, -2.386905,
}
local array_node_torusknot25_rotationz_angle_outtangent_array = {
  0.1665, -2.386905,
  0.6665, -57.37209,
  1.1665, -59.67817,
  1.6665, -40.14935,
  2.1665, -140.8482,
  2.7775, -163.7238,
  3.666264, -2.386905,
}
local array_node_torusknot25_rotationz_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
local sampler_node_torusknot25_rotationz_angle_sampler = {
  -- node_torusknot25_rotationz_angle_input
  input = {
    float_array = array_node_torusknot25_rotationz_angle_input_array,
    count = 7,
    stride = 1,
  },
  -- node_torusknot25_rotationz_angle_output
  output = {
    float_array = array_node_torusknot25_rotationz_angle_output_array,
    count = 7,
    stride = 1,
  },
  -- node_torusknot25_rotationz_angle_intangent
  in_tangent = {
    float_array = array_node_torusknot25_rotationz_angle_intangent_array,
    count = 7,
    stride = 2,
  },
  -- node_torusknot25_rotationz_angle_outtangent
  out_tangent = {
    float_array = array_node_torusknot25_rotationz_angle_outtangent_array,
    count = 7,
    stride = 2,
  },
  -- node_torusknot25_rotationz_angle_interpolation
  interpolation = {
    interpolation_array = array_node_torusknot25_rotationz_angle_interpolation_array,
    count = 7,
    stride = 1,
  },
}
local array_node_torusknot25_rotationy_angle_input_array = {
  0.0,
  0.5,
  1.0,
  1.5,
  2.0,
  2.5,
  3.333333,
}
local array_node_torusknot25_rotationy_angle_output_array = {
  -49.62293,
  -15.37984,
  34.11597,
  -56.85069,
  -56.85069,
  -170.1778,
  -49.62293,
}
local array_node_torusknot25_rotationy_angle_intangent_array = {
  -0.3329306, -49.62293,
  0.3335, -29.32237,
  0.8335, 34.11597,
  1.3335, -56.85069,
  1.8335, -56.85069,
  2.3335, -170.1778,
  3.055833, -49.62293,
}
local array_node_torusknot25_rotationy_angle_outtangent_array = {
  0.1665, -49.62293,
  0.6665, -1.437308,
  1.1665, 34.11597,
  1.6665, -56.85069,
  2.1665, -56.85069,
  2.7775, -170.1778,
  3.666264, -49.62293,
}
local array_node_torusknot25_rotationy_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
local sampler_node_torusknot25_rotationy_angle_sampler = {
  -- node_torusknot25_rotationy_angle_input
  input = {
    float_array = array_node_torusknot25_rotationy_angle_input_array,
    count = 7,
    stride = 1,
  },
  -- node_torusknot25_rotationy_angle_output
  output = {
    float_array = array_node_torusknot25_rotationy_angle_output_array,
    count = 7,
    stride = 1,
  },
  -- node_torusknot25_rotationy_angle_intangent
  in_tangent = {
    float_array = array_node_torusknot25_rotationy_angle_intangent_array,
    count = 7,
    stride = 2,
  },
  -- node_torusknot25_rotationy_angle_outtangent
  out_tangent = {
    float_array = array_node_torusknot25_rotationy_angle_outtangent_array,
    count = 7,
    stride = 2,
  },
  -- node_torusknot25_rotationy_angle_interpolation
  interpolation = {
    interpolation_array = array_node_torusknot25_rotationy_angle_interpolation_array,
    count = 7,
    stride = 1,
  },
}
local array_node_torusknot25_rotationx_angle_input_array = {
  0.0,
  0.5,
  1.0,
  1.5,
  2.0,
  2.5,
  3.333333,
}
local array_node_torusknot25_rotationx_angle_output_array = {
  183.132,
  256.4932,
  196.3711,
  133.4248,
  133.4248,
  152.3479,
  183.132,
}
local array_node_torusknot25_rotationx_angle_intangent_array = {
  -0.3329306, 183.132,
  0.3335, 256.4932,
  0.8335, 216.862,
  1.3335, 133.4248,
  1.8335, 133.4248,
  2.3335, 146.1407,
  3.055833, 183.132,
}
local array_node_torusknot25_rotationx_angle_outtangent_array = {
  0.1665, 183.132,
  0.6665, 256.4932,
  1.1665, 175.8802,
  1.6665, 133.4248,
  2.1665, 133.4248,
  2.7775, 162.6932,
  3.666264, 183.132,
}
local array_node_torusknot25_rotationx_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
local sampler_node_torusknot25_rotationx_angle_sampler = {
  -- node_torusknot25_rotationx_angle_input
  input = {
    float_array = array_node_torusknot25_rotationx_angle_input_array,
    count = 7,
    stride = 1,
  },
  -- node_torusknot25_rotationx_angle_output
  output = {
    float_array = array_node_torusknot25_rotationx_angle_output_array,
    count = 7,
    stride = 1,
  },
  -- node_torusknot25_rotationx_angle_intangent
  in_tangent = {
    float_array = array_node_torusknot25_rotationx_angle_intangent_array,
    count = 7,
    stride = 2,
  },
  -- node_torusknot25_rotationx_angle_outtangent
  out_tangent = {
    float_array = array_node_torusknot25_rotationx_angle_outtangent_array,
    count = 7,
    stride = 2,
  },
  -- node_torusknot25_rotationx_angle_interpolation
  interpolation = {
    interpolation_array = array_node_torusknot25_rotationx_angle_interpolation_array,
    count = 7,
    stride = 1,
  },
}
local node_channel_node_torus_knot23_translation_x = {
  source_sampler = sampler_node_torus_knot23_translation_x_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.X,
}
local node_channel_node_torus_knot23_translation_y = {
  source_sampler = sampler_node_torus_knot23_translation_y_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.Y,
}
local node_channel_node_torus_knot23_translation_z = {
  source_sampler = sampler_node_torus_knot23_translation_z_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.Z,
}
local node_channel_node_torusknot25_rotationz_angle = {
  source_sampler = sampler_node_torusknot25_rotationz_angle_sampler,
  target_transform_index = 1,
  target_attribute = collada_types.target_attribute.ANGLE,
}
local node_channel_node_torusknot25_rotationy_angle = {
  source_sampler = sampler_node_torusknot25_rotationy_angle_sampler,
  target_transform_index = 2,
  target_attribute = collada_types.target_attribute.ANGLE,
}
local node_channel_node_torusknot25_rotationx_angle = {
  source_sampler = sampler_node_torusknot25_rotationx_angle_sampler,
  target_transform_index = 3,
  target_attribute = collada_types.target_attribute.ANGLE,
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
    vertex_buffer_size = 489648,

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

    vertex_buffer_offset = 489648,
    vertex_buffer_size = 125424,

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

    vertex_buffer_offset = 615072,
    vertex_buffer_size = 115776,

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
  node_channel_node_torus_knot23_translation_z,
  node_channel_node_torus_knot23_translation_x,
  node_channel_node_torus_knot23_translation_y,
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
  channels_count = 3,
}
local transforms_node_torusknot25 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {3.281013, -28.30101, 45.45129},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 1.0, -2.386906},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 1.0, 0.0, -49.62295},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {1.0, 0.0, 0.0, -176.868},
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
  node_channel_node_torusknot25_rotationy_angle,
  node_channel_node_torusknot25_rotationz_angle,
  node_channel_node_torusknot25_rotationx_angle,
}
local node_node_torusknot25 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = transforms_node_torusknot25,
  transforms_count = 7,

  instance_geometries = instance_geometries_node_torusknot25,
  instance_geometries_count = 1,

  instance_controllers = instance_controllers_node_torusknot25,
  instance_controllers_count = 0,

  instance_lights = instance_lights_node_torusknot25,
  instance_lights_count = 0,

  channels = node_channels_node_torusknot25,
  channels_count = 3,
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
