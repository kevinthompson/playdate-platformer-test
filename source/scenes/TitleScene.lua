TitleScene = {}
class("TitleScene").extends(NobleScene)
local scene = TitleScene

function scene:enter()
  local level_name = "Level_0"
  LDtk.load_level(level_name)
  self.tilemap = LDtk.create_tilemap(level_name)
end

function scene:drawBackground(__x, __y, __width, __height)
  self.tilemap:draw(0, 0)
end

function scene:exit()
end
