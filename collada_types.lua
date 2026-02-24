local input_format = {
   FLOAT1 = {},
   FLOAT2 = {},
   FLOAT3 = {},
   FLOAT4 = {},
   INT1 = {},
   INT2 = {},
   INT3 = {},
   INT4 = {}
}

local light_type = {
   AMBIENT = {},
   DIRECTIONAL = {},
   POINT = {},
   SPOT = {}
}

local color_or_texture_type = {
   COLOR = {},
   TEXTURE = {}
}

local effect_type = {
   BLINN = {},
   LAMBERT = {},
   PHONG = {},
   CONSTANT = {}
}

local transform_type = {
   LOOKAT = {},
   MATRIX = {},
   ROTATE = {},
   SCALE = {},
   SKEW = {},
   TRANSLATE = {}
}

local node_type = {
   JOINT = {},
   NODE = {}
}

local interpolation = {
   LINEAR = {},
   BEZIER = {}
}

local target_attribute = {
   A = {}, -- alpha color component
   ANGLE = {}, -- euler angle
   B = {}, -- blue color component
   G = {}, -- green color component
   P = {}, -- third texture component
   Q = {}, -- fourth texture component
   R = {}, -- red color component
   S = {}, -- first texture coordinate
   T = {}, -- second texture coordinate
   TIME = {}, -- time in seconds
   U = {}, -- first generic parameter
   V = {}, -- second generic parameter
   W = {}, -- fourth cartesian coordinate
   X = {}, -- first cartesian coordinate
   Y = {}, -- second cartesian coordinate
   Z = {}, -- third cartesian coordinate
   ALL = {}
}

local rotate_target_attributes = {
   target_attribute.X,
   target_attribute.Y,
   target_attribute.Z,
   target_attribute.ANGLE,
}

local translate_scale_target_attributes = {
   target_attribute.X,
   target_attribute.Y,
   target_attribute.Z,
}

return {
   input_format = input_format,
   light_type = light_type,
   color_or_texture_type = color_or_texture_type,
   effect_type = effect_type,
   transform_type = transform_type,
   node_type = node_type,
   interpolation = interpolation,
   target_attribute = target_attribute,
   rotate_target_attributes = rotate_target_attributes,
   translate_scale_target_attributes = translate_scale_target_attributes,
}
