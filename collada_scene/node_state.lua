local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4
local scalar = _math.scalar

local collada_types = require 'collada_types'

local load_transform = function(transform)
   if transform.type == collada_types.transform_type.LOOKAT then
      assert(false)
   elseif transform.type == collada_types.transform_type.MATRIX then
      return mat4.load_table(transform.matrix)
   elseif transform.type == collada_types.transform_type.ROTATE then
      return vec4.load_table(transform.rotate)
   elseif transform.type == collada_types.transform_type.SCALE then
      return vec3.load_table(transform.scale)
   elseif transform.type == collada_types.transform_type.TRANSLATE then
      return vec3.load_table(transform.translate)
   else
      assert(false)
   end
end

local transform_matrix = function (loaded_transform)
   local type = loaded_transform.type
   local value = loaded_transform.value
   if type == collada_types.transform_type.LOOKAT then
      assert(false)
   elseif type == collada_types.transform_type.MATRIX then
      return value
   elseif type == collada_types.transform_type.ROTATE then
      if value.f[0] == 0 and value.f[1] == 0 and value.f[2] == 0 then
         -- WUT?
         return mat4.identity()
      end
      return mat4.rotation_axis(value, scalar.convert_to_radians(value.f[3]))
   elseif type == collada_types.transform_type.SCALE then
      return mat4.scaling_from_vector(value)
   elseif type == collada_types.transform_type.TRANSLATE then
      return mat4.translation_from_vector(value)
   else
      assert(false)
   end
end

local instance_transforms_from_node = function(node)
   local transforms = {}

   local transform_index = 0
   for _, transform in ipairs(node.transforms) do
      local value = load_transform(transform)
      local loaded_transform = {
         type = transform.type,
         value = value,
      }
      transforms[transform_index] = loaded_transform
      transform_index = transform_index + 1
   end

   return transforms
end

local find_node_index_by_name = function(nodes, name)
   local value = nil
   local node_index = 0
   for _, node in ipairs(nodes) do
      if node.node_name == name then
         return node_index
      end
      node_index = node_index + 1
   end
   print(name)
   assert(false)
end

local collada_scene_node_state

collada_scene_node_state = {
   __index = {
      node_instance_world = function(this, node, transforms)
         local world
         if node.parent_index >= 0 then
            world = this.node_instances[node.parent_index].world
            assert(world ~= nil)
         else
            world = mat4.identity()
         end

         local transforms_count = #node.transforms
         local transform_index = 0
         while transform_index < transforms_count do
            local m = transform_matrix(transforms[transform_index])
            world = m * world
            transform_index = transform_index + 1
         end
         return world
      end,

      node_instance_new = function(this, node)
         local transforms = instance_transforms_from_node(node)
         local world = this:node_instance_world(node, transforms)
         local node_instance = {
            transforms = transforms,
            transforms_count = transforms_count,
            world = world,
         }
         return node_instance
      end,

      node_instances_new = function(this, nodes)
         local node_index = 0
         for _, node in ipairs(nodes) do
            local node_instance = this:node_instance_new(node)
            this.node_instances[node_index] = node_instance
            node_index = node_index + 1
         end
      end,

      set_camera = function(this, camera_name, camera_target_name)
         this.camera = find_node_index_by_name(this.nodes, camera_name)
         this.camera_target = find_node_index_by_name(this.nodes, camera_target_name)
      end,

      set_light = function(this, light_name)
         this.light = find_node_index_by_name(this.nodes, light_name)
      end,
   },

   __call = function(_t, nodes)
      local value = {
         nodes = nodes,
         node_instances = {},
         camera = nil,
         camera_target = nil,
         light = nil,
      }
      setmetatable(value, collada_scene_node_state)
      value:node_instances_new(nodes)
      return value
   end,
}
setmetatable(collada_scene_node_state, collada_scene_node_state)

return collada_scene_node_state
