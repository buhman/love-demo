local _font = require 'font'

local global_parameters = require "global_parameters"

local parameter_order = {
   {"ssao", "bias"},
   {"ssao", "radius"},
   {"ssao", "occlusion_exponent"},
   {"ssao", "occlusion_offset"},

   {"ssao", "bias1"},
   {"ssao", "radius1"},
   {"ssao", "occlusion_exponent1"},
   {"ssao", "occlusion_offset1"},
}

local current_param_ix = 0

local get_max_param_ix = function()
   return #parameter_order
end

local max_param_ix = get_max_param_ix()

local get_current_param_keys = function()
   local params = parameter_order[current_param_ix + 1]
   return params[1], params[2]
end

local update_parameter = function(f)
   key, subkey = get_current_param_keys()
   local value = global_parameters[key][subkey]
   local new_value = f(value)
   print(value, new_value)
   global_parameters[key][subkey] = new_value
end

local update_current_ix = function(f)
   local ix = f(current_param_ix)
   if ix < 0 then
      ix = max_param_ix - 1
   end
   if ix >= max_param_ix then
      ix = 0
   end
   current_param_ix = ix
end

local draw = function(font)
   local init_x = 10
   local x = init_x
   local y = 10

   for param_ix, params in ipairs(parameter_order) do
      local prefix = "  "
      if (param_ix - 1) == current_param_ix then
         prefix = "> "
      end
      local key = params[1]
      local subkey = params[2]
      local value = global_parameters[key][subkey]
      local line = prefix .. key .. "." .. subkey .. ": " .. tostring(value)
      _font.draw_string(font, line, x, y)
      y = y + font.glyph_height
   end
end

return {
   update_parameter = update_parameter,
   update_current_ix = update_current_ix,
   draw = draw,
}
