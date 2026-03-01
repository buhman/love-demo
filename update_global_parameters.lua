local _font = require 'font'

local global_parameters = require "global_parameters"

local current_param_ix = 0

local get_max_param_ix = function()
   local param_ix = 0
   for key, values in pairs(global_parameters) do
      for subkey, _ in pairs(values) do
         param_ix = param_ix + 1
      end
   end
   return param_ix
end

local max_param_ix = get_max_param_ix()

local get_current_param_keys = function()
   local param_ix = 0
   for key, values in pairs(global_parameters) do
      for subkey, _ in pairs(values) do
         if param_ix == current_param_ix then
            return key, subkey
         end
         param_ix = param_ix + 1
      end
   end
   assert(false)
end

local update_parameter = function(f)
   key, subkey = get_current_param_keys()
   local value = global_parameters[key][subkey]
   local new_value = f(value)
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

   local param_ix = 0
   for key, values in pairs(global_parameters) do
      for subkey, value in pairs(values) do
         local prefix = "  "
         if param_ix == current_param_ix then
            prefix = "> "
         end
         local line = prefix .. key .. "." .. subkey .. ": " .. tostring(value)
         _font.draw_string(font, line, x, y)
         y = y + font.glyph_height
         param_ix = param_ix + 1
      end
   end
end

return {
   update_parameter = update_parameter,
   update_current_ix = update_current_ix,
   draw = draw,
}
