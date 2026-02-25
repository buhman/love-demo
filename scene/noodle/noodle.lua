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
ns.light_omni001_light = {
  type = collada_types.light_type.POINT,
  color = {1.0, 1.0, 1.0},
}
ns.array_node_bone001_translation_x_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone001_translation_x_output_array = {
  0.0,
  0.0,
}
ns.array_node_bone001_translation_x_intangent_array = {
  -0.3329306, 0.0,
  2.223333, 0.0,
}
ns.array_node_bone001_translation_x_outtangent_array = {
  1.11, 0.0,
  3.666264, 0.0,
}
ns.array_node_bone001_translation_x_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone001_translation_x_sampler = {
  -- node_bone001_translation_x_input
  input = {
    float_array = ns.array_node_bone001_translation_x_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_translation_x_output
  output = {
    float_array = ns.array_node_bone001_translation_x_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_translation_x_intangent
  in_tangent = {
    float_array = ns.array_node_bone001_translation_x_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone001_translation_x_outtangent
  out_tangent = {
    float_array = ns.array_node_bone001_translation_x_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone001_translation_x_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_translation_x_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone001_translation_y_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone001_translation_y_output_array = {
  0.0,
  0.0,
}
ns.array_node_bone001_translation_y_intangent_array = {
  -0.3329306, 0.0,
  2.223333, 0.0,
}
ns.array_node_bone001_translation_y_outtangent_array = {
  1.11, 0.0,
  3.666264, 0.0,
}
ns.array_node_bone001_translation_y_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone001_translation_y_sampler = {
  -- node_bone001_translation_y_input
  input = {
    float_array = ns.array_node_bone001_translation_y_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_translation_y_output
  output = {
    float_array = ns.array_node_bone001_translation_y_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_translation_y_intangent
  in_tangent = {
    float_array = ns.array_node_bone001_translation_y_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone001_translation_y_outtangent
  out_tangent = {
    float_array = ns.array_node_bone001_translation_y_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone001_translation_y_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_translation_y_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone001_translation_z_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone001_translation_z_output_array = {
  0.0,
  0.0,
}
ns.array_node_bone001_translation_z_intangent_array = {
  -0.3329306, 0.0,
  2.223333, 0.0,
}
ns.array_node_bone001_translation_z_outtangent_array = {
  1.11, 0.0,
  3.666264, 0.0,
}
ns.array_node_bone001_translation_z_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone001_translation_z_sampler = {
  -- node_bone001_translation_z_input
  input = {
    float_array = ns.array_node_bone001_translation_z_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_translation_z_output
  output = {
    float_array = ns.array_node_bone001_translation_z_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_translation_z_intangent
  in_tangent = {
    float_array = ns.array_node_bone001_translation_z_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone001_translation_z_outtangent
  out_tangent = {
    float_array = ns.array_node_bone001_translation_z_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone001_translation_z_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_translation_z_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone001_rotationz_angle_input_array = {
  0.0,
  1.666667,
  3.333333,
}
ns.array_node_bone001_rotationz_angle_output_array = {
  0.0,
  0.0,
  0.0,
}
ns.array_node_bone001_rotationz_angle_intangent_array = {
  -0.3329306, 0.0,
  1.111667, 0.0,
  2.778333, 0.0,
}
ns.array_node_bone001_rotationz_angle_outtangent_array = {
  0.555, 0.0,
  2.221667, 0.0,
  3.666264, 0.0,
}
ns.array_node_bone001_rotationz_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone001_rotationz_angle_sampler = {
  -- node_bone001_rotationz_angle_input
  input = {
    float_array = ns.array_node_bone001_rotationz_angle_input_array,
    count = 3,
    stride = 1,
  },
  -- node_bone001_rotationz_angle_output
  output = {
    float_array = ns.array_node_bone001_rotationz_angle_output_array,
    count = 3,
    stride = 1,
  },
  -- node_bone001_rotationz_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone001_rotationz_angle_intangent_array,
    count = 3,
    stride = 2,
  },
  -- node_bone001_rotationz_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone001_rotationz_angle_outtangent_array,
    count = 3,
    stride = 2,
  },
  -- node_bone001_rotationz_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_rotationz_angle_interpolation_array,
    count = 3,
    stride = 1,
  },
}
ns.array_node_bone001_rotationy_angle_input_array = {
  0.0,
  1.666667,
  3.333333,
}
ns.array_node_bone001_rotationy_angle_output_array = {
  0.0,
  0.0,
  0.0,
}
ns.array_node_bone001_rotationy_angle_intangent_array = {
  -0.3329306, 0.0,
  1.111667, 0.0,
  2.778333, 0.0,
}
ns.array_node_bone001_rotationy_angle_outtangent_array = {
  0.555, 0.0,
  2.221667, 0.0,
  3.666264, 0.0,
}
ns.array_node_bone001_rotationy_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone001_rotationy_angle_sampler = {
  -- node_bone001_rotationy_angle_input
  input = {
    float_array = ns.array_node_bone001_rotationy_angle_input_array,
    count = 3,
    stride = 1,
  },
  -- node_bone001_rotationy_angle_output
  output = {
    float_array = ns.array_node_bone001_rotationy_angle_output_array,
    count = 3,
    stride = 1,
  },
  -- node_bone001_rotationy_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone001_rotationy_angle_intangent_array,
    count = 3,
    stride = 2,
  },
  -- node_bone001_rotationy_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone001_rotationy_angle_outtangent_array,
    count = 3,
    stride = 2,
  },
  -- node_bone001_rotationy_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_rotationy_angle_interpolation_array,
    count = 3,
    stride = 1,
  },
}
ns.array_node_bone001_rotationx_angle_input_array = {
  0.0,
  1.666667,
  3.333333,
}
ns.array_node_bone001_rotationx_angle_output_array = {
  0.0,
  55.0,
  0.0,
}
ns.array_node_bone001_rotationx_angle_intangent_array = {
  -0.3329306, 0.0,
  1.111667, 55.0,
  2.778333, 0.0,
}
ns.array_node_bone001_rotationx_angle_outtangent_array = {
  0.555, 0.0,
  2.221667, 55.0,
  3.666264, 0.0,
}
ns.array_node_bone001_rotationx_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone001_rotationx_angle_sampler = {
  -- node_bone001_rotationx_angle_input
  input = {
    float_array = ns.array_node_bone001_rotationx_angle_input_array,
    count = 3,
    stride = 1,
  },
  -- node_bone001_rotationx_angle_output
  output = {
    float_array = ns.array_node_bone001_rotationx_angle_output_array,
    count = 3,
    stride = 1,
  },
  -- node_bone001_rotationx_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone001_rotationx_angle_intangent_array,
    count = 3,
    stride = 2,
  },
  -- node_bone001_rotationx_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone001_rotationx_angle_outtangent_array,
    count = 3,
    stride = 2,
  },
  -- node_bone001_rotationx_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_rotationx_angle_interpolation_array,
    count = 3,
    stride = 1,
  },
}
ns.array_node_bone001_scale_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone001_scale_output_array = {
  1.0, 1.0, 1.0,
  1.0, 1.0, 1.0,
}
ns.array_node_bone001_scale_intangent_array = {
  -0.3329306, 1.0, -0.3329306, 1.0, -0.3329306, 1.0,
  2.223333, 1.0, 2.223333, 1.0, 2.223333, 1.0,
}
ns.array_node_bone001_scale_outtangent_array = {
  1.11, 1.0, 1.11, 1.0, 1.11, 1.0,
  3.666264, 1.0, 3.666264, 1.0, 3.666264, 1.0,
}
ns.array_node_bone001_scale_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone001_scale_sampler = {
  -- node_bone001_scale_input
  input = {
    float_array = ns.array_node_bone001_scale_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_scale_output
  output = {
    float_array = ns.array_node_bone001_scale_output_array,
    count = 2,
    stride = 3,
  },
  -- node_bone001_scale_intangent
  in_tangent = {
    float_array = ns.array_node_bone001_scale_intangent_array,
    count = 2,
    stride = 6,
  },
  -- node_bone001_scale_outtangent
  out_tangent = {
    float_array = ns.array_node_bone001_scale_outtangent_array,
    count = 2,
    stride = 6,
  },
  -- node_bone001_scale_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_scale_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone001_inversescaleaxisrotation_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone001_inversescaleaxisrotation_output_array = {
  0.0, 0.0, 0.0, -2.41484e-06,
  0.0, 0.0, 0.0, -2.41484e-06,
}
ns.array_node_bone001_inversescaleaxisrotation_interpolation_array = {
  collada_types.interpolation.LINEAR,
  collada_types.interpolation.LINEAR,
}
ns.sampler_node_bone001_inversescaleaxisrotation_sampler = {
  -- node_bone001_inversescaleaxisrotation_input
  input = {
    float_array = ns.array_node_bone001_inversescaleaxisrotation_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_inversescaleaxisrotation_output
  output = {
    float_array = ns.array_node_bone001_inversescaleaxisrotation_output_array,
    count = 2,
    stride = 4,
  },
  -- node_bone001_inversescaleaxisrotation_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_inversescaleaxisrotation_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone001_scaleaxisrotation_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone001_scaleaxisrotation_output_array = {
  0.0, 0.0, 0.0, 2.41484e-06,
  0.0, 0.0, 0.0, 2.41484e-06,
}
ns.array_node_bone001_scaleaxisrotation_interpolation_array = {
  collada_types.interpolation.LINEAR,
  collada_types.interpolation.LINEAR,
}
ns.sampler_node_bone001_scaleaxisrotation_sampler = {
  -- node_bone001_scaleaxisrotation_input
  input = {
    float_array = ns.array_node_bone001_scaleaxisrotation_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone001_scaleaxisrotation_output
  output = {
    float_array = ns.array_node_bone001_scaleaxisrotation_output_array,
    count = 2,
    stride = 4,
  },
  -- node_bone001_scaleaxisrotation_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone001_scaleaxisrotation_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone002_translation_x_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone002_translation_x_output_array = {
  7.378868,
  7.378868,
}
ns.array_node_bone002_translation_x_intangent_array = {
  -0.3329306, 7.378868,
  2.223333, 7.378868,
}
ns.array_node_bone002_translation_x_outtangent_array = {
  1.11, 7.378868,
  3.666264, 7.378868,
}
ns.array_node_bone002_translation_x_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone002_translation_x_sampler = {
  -- node_bone002_translation_x_input
  input = {
    float_array = ns.array_node_bone002_translation_x_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_translation_x_output
  output = {
    float_array = ns.array_node_bone002_translation_x_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_translation_x_intangent
  in_tangent = {
    float_array = ns.array_node_bone002_translation_x_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone002_translation_x_outtangent
  out_tangent = {
    float_array = ns.array_node_bone002_translation_x_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone002_translation_x_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_translation_x_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone002_translation_y_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone002_translation_y_output_array = {
  1.90735e-06,
  1.90735e-06,
}
ns.array_node_bone002_translation_y_intangent_array = {
  -0.3329306, 1.90735e-06,
  2.223333, 1.90735e-06,
}
ns.array_node_bone002_translation_y_outtangent_array = {
  1.11, 1.90735e-06,
  3.666264, 1.90735e-06,
}
ns.array_node_bone002_translation_y_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone002_translation_y_sampler = {
  -- node_bone002_translation_y_input
  input = {
    float_array = ns.array_node_bone002_translation_y_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_translation_y_output
  output = {
    float_array = ns.array_node_bone002_translation_y_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_translation_y_intangent
  in_tangent = {
    float_array = ns.array_node_bone002_translation_y_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone002_translation_y_outtangent
  out_tangent = {
    float_array = ns.array_node_bone002_translation_y_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone002_translation_y_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_translation_y_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone002_translation_z_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone002_translation_z_output_array = {
  -5.20561e-09,
  -5.20561e-09,
}
ns.array_node_bone002_translation_z_intangent_array = {
  -0.3329306, -5.20561e-09,
  2.223333, -5.20561e-09,
}
ns.array_node_bone002_translation_z_outtangent_array = {
  1.11, -5.20561e-09,
  3.666264, -5.20561e-09,
}
ns.array_node_bone002_translation_z_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone002_translation_z_sampler = {
  -- node_bone002_translation_z_input
  input = {
    float_array = ns.array_node_bone002_translation_z_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_translation_z_output
  output = {
    float_array = ns.array_node_bone002_translation_z_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_translation_z_intangent
  in_tangent = {
    float_array = ns.array_node_bone002_translation_z_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone002_translation_z_outtangent
  out_tangent = {
    float_array = ns.array_node_bone002_translation_z_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone002_translation_z_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_translation_z_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone002_rotationz_angle_input_array = {
  0.0,
  0.5,
  2.0,
  3.333333,
}
ns.array_node_bone002_rotationz_angle_output_array = {
  0.0,
  -45.0,
  35.0,
  0.0,
}
ns.array_node_bone002_rotationz_angle_intangent_array = {
  -0.3329306, 0.0,
  0.3335, -45.0,
  1.5005, 35.0,
  2.889333, 0.0,
}
ns.array_node_bone002_rotationz_angle_outtangent_array = {
  0.1665, 0.0,
  0.9995, -45.0,
  2.444, 35.0,
  3.666264, 0.0,
}
ns.array_node_bone002_rotationz_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone002_rotationz_angle_sampler = {
  -- node_bone002_rotationz_angle_input
  input = {
    float_array = ns.array_node_bone002_rotationz_angle_input_array,
    count = 4,
    stride = 1,
  },
  -- node_bone002_rotationz_angle_output
  output = {
    float_array = ns.array_node_bone002_rotationz_angle_output_array,
    count = 4,
    stride = 1,
  },
  -- node_bone002_rotationz_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone002_rotationz_angle_intangent_array,
    count = 4,
    stride = 2,
  },
  -- node_bone002_rotationz_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone002_rotationz_angle_outtangent_array,
    count = 4,
    stride = 2,
  },
  -- node_bone002_rotationz_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_rotationz_angle_interpolation_array,
    count = 4,
    stride = 1,
  },
}
ns.array_node_bone002_rotationy_angle_input_array = {
  0.0,
  0.5,
  2.0,
  3.333333,
}
ns.array_node_bone002_rotationy_angle_output_array = {
  0.0,
  0.0,
  0.0,
  0.0,
}
ns.array_node_bone002_rotationy_angle_intangent_array = {
  -0.3329306, 0.0,
  0.3335, 0.0,
  1.5005, 0.0,
  2.889333, 0.0,
}
ns.array_node_bone002_rotationy_angle_outtangent_array = {
  0.1665, 0.0,
  0.9995, 0.0,
  2.444, 0.0,
  3.666264, 0.0,
}
ns.array_node_bone002_rotationy_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone002_rotationy_angle_sampler = {
  -- node_bone002_rotationy_angle_input
  input = {
    float_array = ns.array_node_bone002_rotationy_angle_input_array,
    count = 4,
    stride = 1,
  },
  -- node_bone002_rotationy_angle_output
  output = {
    float_array = ns.array_node_bone002_rotationy_angle_output_array,
    count = 4,
    stride = 1,
  },
  -- node_bone002_rotationy_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone002_rotationy_angle_intangent_array,
    count = 4,
    stride = 2,
  },
  -- node_bone002_rotationy_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone002_rotationy_angle_outtangent_array,
    count = 4,
    stride = 2,
  },
  -- node_bone002_rotationy_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_rotationy_angle_interpolation_array,
    count = 4,
    stride = 1,
  },
}
ns.array_node_bone002_rotationx_angle_input_array = {
  0.0,
  0.5,
  2.0,
  3.333333,
}
ns.array_node_bone002_rotationx_angle_output_array = {
  0.0,
  0.0,
  0.0,
  0.0,
}
ns.array_node_bone002_rotationx_angle_intangent_array = {
  -0.3329306, 0.0,
  0.3335, 0.0,
  1.5005, 0.0,
  2.889333, 0.0,
}
ns.array_node_bone002_rotationx_angle_outtangent_array = {
  0.1665, 0.0,
  0.9995, 0.0,
  2.444, 0.0,
  3.666264, 0.0,
}
ns.array_node_bone002_rotationx_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone002_rotationx_angle_sampler = {
  -- node_bone002_rotationx_angle_input
  input = {
    float_array = ns.array_node_bone002_rotationx_angle_input_array,
    count = 4,
    stride = 1,
  },
  -- node_bone002_rotationx_angle_output
  output = {
    float_array = ns.array_node_bone002_rotationx_angle_output_array,
    count = 4,
    stride = 1,
  },
  -- node_bone002_rotationx_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone002_rotationx_angle_intangent_array,
    count = 4,
    stride = 2,
  },
  -- node_bone002_rotationx_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone002_rotationx_angle_outtangent_array,
    count = 4,
    stride = 2,
  },
  -- node_bone002_rotationx_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_rotationx_angle_interpolation_array,
    count = 4,
    stride = 1,
  },
}
ns.array_node_bone002_scale_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone002_scale_output_array = {
  1.0, 1.0, 1.0,
  1.0, 1.0, 1.0,
}
ns.array_node_bone002_scale_intangent_array = {
  -0.3329306, 1.0, -0.3329306, 1.0, -0.3329306, 1.0,
  2.223333, 1.0, 2.223333, 1.0, 2.223333, 1.0,
}
ns.array_node_bone002_scale_outtangent_array = {
  1.11, 1.0, 1.11, 1.0, 1.11, 1.0,
  3.666264, 1.0, 3.666264, 1.0, 3.666264, 1.0,
}
ns.array_node_bone002_scale_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone002_scale_sampler = {
  -- node_bone002_scale_input
  input = {
    float_array = ns.array_node_bone002_scale_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_scale_output
  output = {
    float_array = ns.array_node_bone002_scale_output_array,
    count = 2,
    stride = 3,
  },
  -- node_bone002_scale_intangent
  in_tangent = {
    float_array = ns.array_node_bone002_scale_intangent_array,
    count = 2,
    stride = 6,
  },
  -- node_bone002_scale_outtangent
  out_tangent = {
    float_array = ns.array_node_bone002_scale_outtangent_array,
    count = 2,
    stride = 6,
  },
  -- node_bone002_scale_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_scale_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone002_inversescaleaxisrotation_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone002_inversescaleaxisrotation_output_array = {
  0.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0,
}
ns.array_node_bone002_inversescaleaxisrotation_interpolation_array = {
  collada_types.interpolation.LINEAR,
  collada_types.interpolation.LINEAR,
}
ns.sampler_node_bone002_inversescaleaxisrotation_sampler = {
  -- node_bone002_inversescaleaxisrotation_input
  input = {
    float_array = ns.array_node_bone002_inversescaleaxisrotation_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_inversescaleaxisrotation_output
  output = {
    float_array = ns.array_node_bone002_inversescaleaxisrotation_output_array,
    count = 2,
    stride = 4,
  },
  -- node_bone002_inversescaleaxisrotation_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_inversescaleaxisrotation_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone002_scaleaxisrotation_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone002_scaleaxisrotation_output_array = {
  0.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0,
}
ns.array_node_bone002_scaleaxisrotation_interpolation_array = {
  collada_types.interpolation.LINEAR,
  collada_types.interpolation.LINEAR,
}
ns.sampler_node_bone002_scaleaxisrotation_sampler = {
  -- node_bone002_scaleaxisrotation_input
  input = {
    float_array = ns.array_node_bone002_scaleaxisrotation_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone002_scaleaxisrotation_output
  output = {
    float_array = ns.array_node_bone002_scaleaxisrotation_output_array,
    count = 2,
    stride = 4,
  },
  -- node_bone002_scaleaxisrotation_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone002_scaleaxisrotation_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone003_translation_x_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone003_translation_x_output_array = {
  9.380154,
  9.380154,
}
ns.array_node_bone003_translation_x_intangent_array = {
  -0.3329306, 9.380154,
  2.223333, 9.380154,
}
ns.array_node_bone003_translation_x_outtangent_array = {
  1.11, 9.380154,
  3.666264, 9.380154,
}
ns.array_node_bone003_translation_x_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone003_translation_x_sampler = {
  -- node_bone003_translation_x_input
  input = {
    float_array = ns.array_node_bone003_translation_x_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_translation_x_output
  output = {
    float_array = ns.array_node_bone003_translation_x_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_translation_x_intangent
  in_tangent = {
    float_array = ns.array_node_bone003_translation_x_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone003_translation_x_outtangent
  out_tangent = {
    float_array = ns.array_node_bone003_translation_x_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone003_translation_x_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_translation_x_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone003_translation_y_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone003_translation_y_output_array = {
  -6.48499e-05,
  -6.48499e-05,
}
ns.array_node_bone003_translation_y_intangent_array = {
  -0.3329306, -6.48499e-05,
  2.223333, -6.48499e-05,
}
ns.array_node_bone003_translation_y_outtangent_array = {
  1.11, -6.48499e-05,
  3.666264, -6.48499e-05,
}
ns.array_node_bone003_translation_y_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone003_translation_y_sampler = {
  -- node_bone003_translation_y_input
  input = {
    float_array = ns.array_node_bone003_translation_y_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_translation_y_output
  output = {
    float_array = ns.array_node_bone003_translation_y_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_translation_y_intangent
  in_tangent = {
    float_array = ns.array_node_bone003_translation_y_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone003_translation_y_outtangent
  out_tangent = {
    float_array = ns.array_node_bone003_translation_y_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone003_translation_y_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_translation_y_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone003_translation_z_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone003_translation_z_output_array = {
  -8.38796e-07,
  -8.38796e-07,
}
ns.array_node_bone003_translation_z_intangent_array = {
  -0.3329306, -8.38796e-07,
  2.223333, -8.38796e-07,
}
ns.array_node_bone003_translation_z_outtangent_array = {
  1.11, -8.38796e-07,
  3.666264, -8.38796e-07,
}
ns.array_node_bone003_translation_z_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone003_translation_z_sampler = {
  -- node_bone003_translation_z_input
  input = {
    float_array = ns.array_node_bone003_translation_z_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_translation_z_output
  output = {
    float_array = ns.array_node_bone003_translation_z_output_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_translation_z_intangent
  in_tangent = {
    float_array = ns.array_node_bone003_translation_z_intangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone003_translation_z_outtangent
  out_tangent = {
    float_array = ns.array_node_bone003_translation_z_outtangent_array,
    count = 2,
    stride = 2,
  },
  -- node_bone003_translation_z_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_translation_z_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone003_rotationz_angle_input_array = {
  0.0,
  0.5,
  1.0,
  1.5,
  2.0,
  2.5,
  3.333333,
}
ns.array_node_bone003_rotationz_angle_output_array = {
  0.0,
  45.0,
  45.0,
  45.0,
  35.49053,
  -49.19919,
  0.0,
}
ns.array_node_bone003_rotationz_angle_intangent_array = {
  -0.3329306, 0.0,
  0.3335, 45.0,
  0.8335, 45.0,
  1.3335, 45.0,
  1.8335, 44.99049,
  2.3335, -49.19919,
  3.055833, 0.0,
}
ns.array_node_bone003_rotationz_angle_outtangent_array = {
  0.1665, 0.0,
  0.6665, 45.0,
  1.1665, 45.0,
  1.6665, 45.0,
  2.1665, 25.99058,
  2.7775, -49.19919,
  3.666264, 0.0,
}
ns.array_node_bone003_rotationz_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone003_rotationz_angle_sampler = {
  -- node_bone003_rotationz_angle_input
  input = {
    float_array = ns.array_node_bone003_rotationz_angle_input_array,
    count = 7,
    stride = 1,
  },
  -- node_bone003_rotationz_angle_output
  output = {
    float_array = ns.array_node_bone003_rotationz_angle_output_array,
    count = 7,
    stride = 1,
  },
  -- node_bone003_rotationz_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone003_rotationz_angle_intangent_array,
    count = 7,
    stride = 2,
  },
  -- node_bone003_rotationz_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone003_rotationz_angle_outtangent_array,
    count = 7,
    stride = 2,
  },
  -- node_bone003_rotationz_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_rotationz_angle_interpolation_array,
    count = 7,
    stride = 1,
  },
}
ns.array_node_bone003_rotationy_angle_input_array = {
  0.0,
  0.5,
  1.0,
  1.5,
  2.0,
  2.5,
  3.333333,
}
ns.array_node_bone003_rotationy_angle_output_array = {
  0.0,
  0.0,
  49.99999,
  -45.0,
  68.42802,
  40.75458,
  0.0,
}
ns.array_node_bone003_rotationy_angle_intangent_array = {
  -0.3329306, 0.0,
  0.3335, 0.0,
  0.8335, 49.99999,
  1.3335, -45.0,
  1.8335, 68.42802,
  2.3335, 49.29953,
  3.055833, 0.0,
}
ns.array_node_bone003_rotationy_angle_outtangent_array = {
  0.1665, 0.0,
  0.6665, 0.0,
  1.1665, 49.99999,
  1.6665, -45.0,
  2.1665, 68.42802,
  2.7775, 26.513,
  3.666264, 0.0,
}
ns.array_node_bone003_rotationy_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone003_rotationy_angle_sampler = {
  -- node_bone003_rotationy_angle_input
  input = {
    float_array = ns.array_node_bone003_rotationy_angle_input_array,
    count = 7,
    stride = 1,
  },
  -- node_bone003_rotationy_angle_output
  output = {
    float_array = ns.array_node_bone003_rotationy_angle_output_array,
    count = 7,
    stride = 1,
  },
  -- node_bone003_rotationy_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone003_rotationy_angle_intangent_array,
    count = 7,
    stride = 2,
  },
  -- node_bone003_rotationy_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone003_rotationy_angle_outtangent_array,
    count = 7,
    stride = 2,
  },
  -- node_bone003_rotationy_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_rotationy_angle_interpolation_array,
    count = 7,
    stride = 1,
  },
}
ns.array_node_bone003_rotationx_angle_input_array = {
  0.0,
  0.5,
  1.0,
  1.5,
  2.0,
  2.5,
  3.333333,
}
ns.array_node_bone003_rotationx_angle_output_array = {
  1.36604e-05,
  1.36604e-05,
  1.36604e-05,
  1.36604e-05,
  -25.3435,
  -50.24762,
  1.36604e-05,
}
ns.array_node_bone003_rotationx_angle_intangent_array = {
  -0.3329306, 1.36604e-05,
  0.3335, 1.36604e-05,
  0.8335, 1.36604e-05,
  1.3335, 1.36604e-05,
  1.8335, -16.97727,
  2.3335, -50.24762,
  3.055833, 1.36604e-05,
}
ns.array_node_bone003_rotationx_angle_outtangent_array = {
  0.1665, 1.36604e-05,
  0.6665, 1.36604e-05,
  1.1665, 1.36604e-05,
  1.6665, 1.36604e-05,
  2.1665, -33.70973,
  2.7775, -50.24762,
  3.666264, 1.36604e-05,
}
ns.array_node_bone003_rotationx_angle_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone003_rotationx_angle_sampler = {
  -- node_bone003_rotationx_angle_input
  input = {
    float_array = ns.array_node_bone003_rotationx_angle_input_array,
    count = 7,
    stride = 1,
  },
  -- node_bone003_rotationx_angle_output
  output = {
    float_array = ns.array_node_bone003_rotationx_angle_output_array,
    count = 7,
    stride = 1,
  },
  -- node_bone003_rotationx_angle_intangent
  in_tangent = {
    float_array = ns.array_node_bone003_rotationx_angle_intangent_array,
    count = 7,
    stride = 2,
  },
  -- node_bone003_rotationx_angle_outtangent
  out_tangent = {
    float_array = ns.array_node_bone003_rotationx_angle_outtangent_array,
    count = 7,
    stride = 2,
  },
  -- node_bone003_rotationx_angle_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_rotationx_angle_interpolation_array,
    count = 7,
    stride = 1,
  },
}
ns.array_node_bone003_scale_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone003_scale_output_array = {
  0.9999999, 0.9999999, 1.0,
  0.9999999, 0.9999999, 1.0,
}
ns.array_node_bone003_scale_intangent_array = {
  -0.3329306, 0.9999999, -0.3329306, 0.9999999, -0.3329306, 1.0,
  2.223333, 0.9999999, 2.223333, 0.9999999, 2.223333, 1.0,
}
ns.array_node_bone003_scale_outtangent_array = {
  1.11, 0.9999999, 1.11, 0.9999999, 1.11, 1.0,
  3.666264, 0.9999999, 3.666264, 0.9999999, 3.666264, 1.0,
}
ns.array_node_bone003_scale_interpolation_array = {
  collada_types.interpolation.BEZIER,
  collada_types.interpolation.BEZIER,
}
ns.sampler_node_bone003_scale_sampler = {
  -- node_bone003_scale_input
  input = {
    float_array = ns.array_node_bone003_scale_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_scale_output
  output = {
    float_array = ns.array_node_bone003_scale_output_array,
    count = 2,
    stride = 3,
  },
  -- node_bone003_scale_intangent
  in_tangent = {
    float_array = ns.array_node_bone003_scale_intangent_array,
    count = 2,
    stride = 6,
  },
  -- node_bone003_scale_outtangent
  out_tangent = {
    float_array = ns.array_node_bone003_scale_outtangent_array,
    count = 2,
    stride = 6,
  },
  -- node_bone003_scale_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_scale_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone003_inversescaleaxisrotation_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone003_inversescaleaxisrotation_output_array = {
  0.0, 0.0, 0.0, -1.0526e-05,
  0.0, 0.0, 0.0, -1.0526e-05,
}
ns.array_node_bone003_inversescaleaxisrotation_interpolation_array = {
  collada_types.interpolation.LINEAR,
  collada_types.interpolation.LINEAR,
}
ns.sampler_node_bone003_inversescaleaxisrotation_sampler = {
  -- node_bone003_inversescaleaxisrotation_input
  input = {
    float_array = ns.array_node_bone003_inversescaleaxisrotation_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_inversescaleaxisrotation_output
  output = {
    float_array = ns.array_node_bone003_inversescaleaxisrotation_output_array,
    count = 2,
    stride = 4,
  },
  -- node_bone003_inversescaleaxisrotation_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_inversescaleaxisrotation_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.array_node_bone003_scaleaxisrotation_input_array = {
  0.0,
  3.333333,
}
ns.array_node_bone003_scaleaxisrotation_output_array = {
  0.0, 0.0, 0.0, 1.0526e-05,
  0.0, 0.0, 0.0, 1.0526e-05,
}
ns.array_node_bone003_scaleaxisrotation_interpolation_array = {
  collada_types.interpolation.LINEAR,
  collada_types.interpolation.LINEAR,
}
ns.sampler_node_bone003_scaleaxisrotation_sampler = {
  -- node_bone003_scaleaxisrotation_input
  input = {
    float_array = ns.array_node_bone003_scaleaxisrotation_input_array,
    count = 2,
    stride = 1,
  },
  -- node_bone003_scaleaxisrotation_output
  output = {
    float_array = ns.array_node_bone003_scaleaxisrotation_output_array,
    count = 2,
    stride = 4,
  },
  -- node_bone003_scaleaxisrotation_interpolation
  interpolation = {
    interpolation_array = ns.array_node_bone003_scaleaxisrotation_interpolation_array,
    count = 2,
    stride = 1,
  },
}
ns.node_channel_node_bone001_translation_x = {
  source_sampler = ns.sampler_node_bone001_translation_x_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.X,
}
ns.node_channel_node_bone001_translation_y = {
  source_sampler = ns.sampler_node_bone001_translation_y_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.Y,
}
ns.node_channel_node_bone001_translation_z = {
  source_sampler = ns.sampler_node_bone001_translation_z_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.Z,
}
ns.node_channel_node_bone001_rotationz_angle = {
  source_sampler = ns.sampler_node_bone001_rotationz_angle_sampler,
  target_transform_index = 1,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone001_rotationy_angle = {
  source_sampler = ns.sampler_node_bone001_rotationy_angle_sampler,
  target_transform_index = 2,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone001_rotationx_angle = {
  source_sampler = ns.sampler_node_bone001_rotationx_angle_sampler,
  target_transform_index = 3,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone001_scale = {
  source_sampler = ns.sampler_node_bone001_scale_sampler,
  target_transform_index = 5,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.node_channel_node_bone001_inversescaleaxisrotation = {
  source_sampler = ns.sampler_node_bone001_inversescaleaxisrotation_sampler,
  target_transform_index = 4,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.node_channel_node_bone001_scaleaxisrotation = {
  source_sampler = ns.sampler_node_bone001_scaleaxisrotation_sampler,
  target_transform_index = 6,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.node_channel_node_bone002_translation_x = {
  source_sampler = ns.sampler_node_bone002_translation_x_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.X,
}
ns.node_channel_node_bone002_translation_y = {
  source_sampler = ns.sampler_node_bone002_translation_y_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.Y,
}
ns.node_channel_node_bone002_translation_z = {
  source_sampler = ns.sampler_node_bone002_translation_z_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.Z,
}
ns.node_channel_node_bone002_rotationz_angle = {
  source_sampler = ns.sampler_node_bone002_rotationz_angle_sampler,
  target_transform_index = 1,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone002_rotationy_angle = {
  source_sampler = ns.sampler_node_bone002_rotationy_angle_sampler,
  target_transform_index = 2,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone002_rotationx_angle = {
  source_sampler = ns.sampler_node_bone002_rotationx_angle_sampler,
  target_transform_index = 3,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone002_scale = {
  source_sampler = ns.sampler_node_bone002_scale_sampler,
  target_transform_index = 5,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.node_channel_node_bone002_inversescaleaxisrotation = {
  source_sampler = ns.sampler_node_bone002_inversescaleaxisrotation_sampler,
  target_transform_index = 4,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.node_channel_node_bone002_scaleaxisrotation = {
  source_sampler = ns.sampler_node_bone002_scaleaxisrotation_sampler,
  target_transform_index = 6,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.node_channel_node_bone003_translation_x = {
  source_sampler = ns.sampler_node_bone003_translation_x_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.X,
}
ns.node_channel_node_bone003_translation_y = {
  source_sampler = ns.sampler_node_bone003_translation_y_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.Y,
}
ns.node_channel_node_bone003_translation_z = {
  source_sampler = ns.sampler_node_bone003_translation_z_sampler,
  target_transform_index = 0,
  target_attribute = collada_types.target_attribute.Z,
}
ns.node_channel_node_bone003_rotationz_angle = {
  source_sampler = ns.sampler_node_bone003_rotationz_angle_sampler,
  target_transform_index = 1,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone003_rotationy_angle = {
  source_sampler = ns.sampler_node_bone003_rotationy_angle_sampler,
  target_transform_index = 2,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone003_rotationx_angle = {
  source_sampler = ns.sampler_node_bone003_rotationx_angle_sampler,
  target_transform_index = 3,
  target_attribute = collada_types.target_attribute.ANGLE,
}
ns.node_channel_node_bone003_scale = {
  source_sampler = ns.sampler_node_bone003_scale_sampler,
  target_transform_index = 5,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.node_channel_node_bone003_inversescaleaxisrotation = {
  source_sampler = ns.sampler_node_bone003_inversescaleaxisrotation_sampler,
  target_transform_index = 4,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.node_channel_node_bone003_scaleaxisrotation = {
  source_sampler = ns.sampler_node_bone003_scaleaxisrotation_sampler,
  target_transform_index = 6,
  target_attribute = collada_types.target_attribute.ALL,
}
ns.images = {
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
ns.effect_coloreffectr6g134b58 = {
  type = collada_types.effect_type.PHONG,
  phong = {
    emission = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.0, 0.0, 0.0, 0.0},
    },
    ambient = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.02352941, 0.5254902, 0.227451, 1.0},
    },
    diffuse = {
      type = collada_types.color_or_texture_type.COLOR,
      color = {0.02352941, 0.5254902, 0.227451, 1.0},
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
ns.material_coloreffectr6g134b58_material = {
  effect = ns.effect_coloreffectr6g134b58,
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
ns.triangles_geom_box001 = {
  {
    count = 60, -- triangles
    index_offset = 0, -- indices
    inputs_index = 0, -- index into inputs_list
  },
}
ns.geometry_geom_box001 = {
  mesh = {
    triangles = ns.triangles_geom_box001,
    triangles_count = 1,

    vertex_buffer_offset = 0,
    vertex_buffer_size = 3456,

    index_buffer_offset = 0,
    index_buffer_size = 720,
  }
}
ns.geometries = {
  ns.geometry_geom_box001,
}
ns.inverse_bind_matrices_geom_box001_skin1 = {
  {
    4.37114e-08, -8.74228e-08, -1.0, 0.0,
    8.74228e-08, 1.0, -8.74228e-08, 0.0,
    1.0, -8.74228e-08, 4.37114e-08, 0.0,
    0.0, 0.0, 0.0, 1.0,
  },
  {
    3.45463e-08, 1.03685e-06, -1.0, 0.0,
    -4.60877e-14, 1.0, 1.03685e-06, 0.0,
    1.0, 1.57076e-14, 3.45463e-08, 0.0,
    -16.75902, 6.06573e-05, 1.77593e-07, 1.0,
  },
  {
    -4.37114e-08, 4.76837e-07, -1.0, 0.0,
    1.74846e-07, 1.0, 4.76837e-07, 0.0,
    1.0, -1.74846e-07, -4.37115e-08, 0.0,
    -7.378868, -1.26227e-06, 6.50286e-07, 1.0,
  },
}
ns.controller_geom_box001_skin1 = {
  skin = {
    geometry = ns.geometry_geom_box001,

    inverse_bind_matrices = ns.inverse_bind_matrices_geom_box001_skin1,

    vertex_buffer_offset = 0,
    vertex_buffer_size = 2304,
  }
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
ns.transforms_node_cameratargethelper = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-19.90239, -27.72767, 54.6898},
  },
}
ns.instance_geometries_node_cameratargethelper = {
}
ns.instance_controllers_node_cameratargethelper = {
}
ns.instance_lights_node_cameratargethelper = {
}
ns.node_channels_node_cameratargethelper = {
}
ns.node_node_cameratargethelper = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_cameratargethelper,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_cameratargethelper,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_cameratargethelper,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_cameratargethelper,
  instance_lights_count = 0,

  channels = ns.node_channels_node_cameratargethelper,
  channels_count = 0,
}
ns.transforms_node_camera_target = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-12.69313, 5.226418, -13.172},
  },
}
ns.instance_geometries_node_camera_target = {
}
ns.instance_controllers_node_camera_target = {
}
ns.instance_lights_node_camera_target = {
}
ns.node_channels_node_camera_target = {
}
ns.node_node_camera_target = {
  parent_index = 1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_camera_target,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_camera_target,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_camera_target,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_camera_target,
  instance_lights_count = 0,

  channels = ns.node_channels_node_camera_target,
  channels_count = 0,
}
ns.transforms_node_omni001 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-2.48297e-06, -56.80384, 58.23672},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {-0.5773502, 0.5773503, 0.5773503, -120.0},
  },
}
ns.instance_geometries_node_omni001 = {
}
ns.instance_controllers_node_omni001 = {
}
ns.instance_lights_node_omni001 = {
  {
    light = ns.light_omni001_light,
  }
}
ns.node_channels_node_omni001 = {
}
ns.node_node_omni001 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_omni001,
  transforms_count = 2,

  instance_geometries = ns.instance_geometries_node_omni001,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_omni001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_omni001,
  instance_lights_count = 1,

  channels = ns.node_channels_node_omni001,
  channels_count = 0,
}
ns.transforms_node_box001 = {
}
ns.instance_geometries_node_box001 = {
}
ns.joint_node_indices_node_box001_geom_box001_skin1 = {
  6, -- joint0 node_bone001
  8, -- joint1 node_bone003
  7, -- joint2 node_bone002
}
ns.instance_controller_instance_materials_node_box001_0 = {
  {
    element_index = 0, -- an index into mesh.triangles
    material = ns.material_coloreffectr6g134b58_material,

    emission = { input_set = -1 },
    ambient = { input_set = -1 },
    diffuse = { input_set = -1 },
    specular = { input_set = -1 },
  },
}
ns.instance_controllers_node_box001 = {
  {
    controller = ns.controller_geom_box001_skin1,

    joint_node_indices = ns.joint_node_indices_node_box001_geom_box001_skin1,
    joint_count = #ns.joint_node_indices_node_box001_geom_box001_skin1,

    instance_materials = ns.instance_controller_instance_materials_node_box001_0,
    instance_materials_count = 1,
  },
}
ns.instance_lights_node_box001 = {
}
ns.node_channels_node_box001 = {
}
ns.node_node_box001 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_box001,
  transforms_count = 0,

  instance_geometries = ns.instance_geometries_node_box001,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_box001,
  instance_controllers_count = 1,

  instance_lights = ns.instance_lights_node_box001,
  instance_lights_count = 0,

  channels = ns.node_channels_node_box001,
  channels_count = 0,
}
ns.transforms_node_bonehelper = {
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 1.0, 0.0, -90.00001},
  },
}
ns.instance_geometries_node_bonehelper = {
}
ns.instance_controllers_node_bonehelper = {
}
ns.instance_lights_node_bonehelper = {
}
ns.node_channels_node_bonehelper = {
}
ns.node_node_bonehelper = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_bonehelper,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_bonehelper,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_bonehelper,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_bonehelper,
  instance_lights_count = 0,

  channels = ns.node_channels_node_bonehelper,
  channels_count = 0,
}
ns.transforms_node_bone001 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {0.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 1.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 1.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {1.0, 0.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.SCALE,
    scale = {1.0, 1.0, 1.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 0.0, 0.0},
  },
}
ns.instance_geometries_node_bone001 = {
}
ns.instance_controllers_node_bone001 = {
}
ns.instance_lights_node_bone001 = {
}
ns.node_channels_node_bone001 = {
  ns.node_channel_node_bone001_rotationy_angle,
  ns.node_channel_node_bone001_translation_z,
  ns.node_channel_node_bone001_scaleaxisrotation,
  ns.node_channel_node_bone001_rotationz_angle,
  ns.node_channel_node_bone001_rotationx_angle,
  ns.node_channel_node_bone001_inversescaleaxisrotation,
  ns.node_channel_node_bone001_translation_x,
  ns.node_channel_node_bone001_translation_y,
  ns.node_channel_node_bone001_scale,
}
ns.node_node_bone001 = {
  parent_index = 5,

  type = collada_types.node_type.JOINT,

  transforms = ns.transforms_node_bone001,
  transforms_count = 7,

  instance_geometries = ns.instance_geometries_node_bone001,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_bone001,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_bone001,
  instance_lights_count = 0,

  channels = ns.node_channels_node_bone001,
  channels_count = 9,
}
ns.transforms_node_bone002 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {7.378868, 1.90735e-06, -5.20561e-09},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 1.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 1.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {1.0, 0.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.SCALE,
    scale = {1.0, 1.0, 1.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 0.0, 0.0},
  },
}
ns.instance_geometries_node_bone002 = {
}
ns.instance_controllers_node_bone002 = {
}
ns.instance_lights_node_bone002 = {
}
ns.node_channels_node_bone002 = {
  ns.node_channel_node_bone002_rotationx_angle,
  ns.node_channel_node_bone002_translation_y,
  ns.node_channel_node_bone002_inversescaleaxisrotation,
  ns.node_channel_node_bone002_translation_z,
  ns.node_channel_node_bone002_translation_x,
  ns.node_channel_node_bone002_scale,
  ns.node_channel_node_bone002_rotationz_angle,
  ns.node_channel_node_bone002_rotationy_angle,
  ns.node_channel_node_bone002_scaleaxisrotation,
}
ns.node_node_bone002 = {
  parent_index = 6,

  type = collada_types.node_type.JOINT,

  transforms = ns.transforms_node_bone002,
  transforms_count = 7,

  instance_geometries = ns.instance_geometries_node_bone002,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_bone002,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_bone002,
  instance_lights_count = 0,

  channels = ns.node_channels_node_bone002,
  channels_count = 9,
}
ns.transforms_node_bone003 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {9.380154, -6.48499e-05, -8.38796e-07},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 1.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 1.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {1.0, 0.0, 0.0, 1.36604e-05},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 0.0, 0.0},
  },
  {
    type = collada_types.transform_type.SCALE,
    scale = {0.9999999, 0.9999999, 1.0},
  },
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {0.0, 0.0, 0.0, 0.0},
  },
}
ns.instance_geometries_node_bone003 = {
}
ns.instance_controllers_node_bone003 = {
}
ns.instance_lights_node_bone003 = {
}
ns.node_channels_node_bone003 = {
  ns.node_channel_node_bone003_inversescaleaxisrotation,
  ns.node_channel_node_bone003_rotationx_angle,
  ns.node_channel_node_bone003_translation_z,
  ns.node_channel_node_bone003_translation_x,
  ns.node_channel_node_bone003_scale,
  ns.node_channel_node_bone003_rotationy_angle,
  ns.node_channel_node_bone003_translation_y,
  ns.node_channel_node_bone003_rotationz_angle,
  ns.node_channel_node_bone003_scaleaxisrotation,
}
ns.node_node_bone003 = {
  parent_index = 7,

  type = collada_types.node_type.JOINT,

  transforms = ns.transforms_node_bone003,
  transforms_count = 7,

  instance_geometries = ns.instance_geometries_node_bone003,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_bone003,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_bone003,
  instance_lights_count = 0,

  channels = ns.node_channels_node_bone003,
  channels_count = 9,
}
ns.transforms_node_camerahelper_1 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {-54.43401, -35.53392, 57.3912},
  },
}
ns.instance_geometries_node_camerahelper_1 = {
}
ns.instance_controllers_node_camerahelper_1 = {
}
ns.instance_lights_node_camerahelper_1 = {
}
ns.node_channels_node_camerahelper_1 = {
}
ns.node_node_camerahelper_1 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_camerahelper_1,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_camerahelper_1,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_camerahelper_1,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_camerahelper_1,
  instance_lights_count = 0,

  channels = ns.node_channels_node_camerahelper_1,
  channels_count = 0,
}
ns.transforms_node_camera001 = {
  {
    type = collada_types.transform_type.MATRIX,
    matrix = {0.546629, -0.8373749, -8.9407e-08, 0.0, 0.4692288, 0.3063076, 0.8282512, 0.0, -0.6935565, -0.4527462, 0.5603571, 0.0, 0.0, 0.0, 0.0, 1.0},
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
  parent_index = 9,

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
ns.transforms_node_cameratargethelper_1 = {
  {
    type = collada_types.transform_type.TRANSLATE,
    translate = {0.0, 0.0, 13.41141},
  },
}
ns.instance_geometries_node_cameratargethelper_1 = {
}
ns.instance_controllers_node_cameratargethelper_1 = {
}
ns.instance_lights_node_cameratargethelper_1 = {
}
ns.node_channels_node_cameratargethelper_1 = {
}
ns.node_node_cameratargethelper_1 = {
  parent_index = -1,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_cameratargethelper_1,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_cameratargethelper_1,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_cameratargethelper_1,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_cameratargethelper_1,
  instance_lights_count = 0,

  channels = ns.node_channels_node_cameratargethelper_1,
  channels_count = 0,
}
ns.transforms_node_camera001_target = {
  {
    type = collada_types.transform_type.ROTATE,
    rotate = {-0.6495421, 0.3687832, 0.6649015, -80.98797},
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
  parent_index = 11,

  type = collada_types.node_type.NODE,

  transforms = ns.transforms_node_camera001_target,
  transforms_count = 1,

  instance_geometries = ns.instance_geometries_node_camera001_target,
  instance_geometries_count = 0,

  instance_controllers = ns.instance_controllers_node_camera001_target,
  instance_controllers_count = 0,

  instance_lights = ns.instance_lights_node_camera001_target,
  instance_lights_count = 0,

  channels = ns.node_channels_node_camera001_target,
  channels_count = 0,
}
ns.nodes = {
  ns.node_node_environmentambientlight, -- 0
  ns.node_node_cameratargethelper, -- 1
  ns.node_node_camera_target, -- 2
  ns.node_node_omni001, -- 3
  ns.node_node_box001, -- 4
  ns.node_node_bonehelper, -- 5
  ns.node_node_bone001, -- 6
  ns.node_node_bone002, -- 7
  ns.node_node_bone003, -- 8
  ns.node_node_camerahelper_1, -- 9
  ns.node_node_camera001, -- 10
  ns.node_node_cameratargethelper_1, -- 11
  ns.node_node_camera001_target, -- 12
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
