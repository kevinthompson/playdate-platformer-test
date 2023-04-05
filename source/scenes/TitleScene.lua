TitleScene = {}
class("TitleScene").extends(NobleScene)
local scene = TitleScene

function scene:init()
  scene.super.init(self)
  self.tilemap = LDtk.create_tilemap("Level_0")
end

function scene:enter()
  scene.super.enter(self)
  LDtk.load_level("Level_0")
end

function scene:start()
  scene.super.start(self)
end

function scene:drawBackground()
  scene.super.drawBackground(self)
  self.tilemap:draw(0, 0)
end

function scene:update()
  scene.super.update(self)
  Noble.Text.setFont(Noble.Text.FONT_SMALL)
  playdate.graphics.setImageDrawMode(playdate.graphics.kDrawModeInverted)
  Noble.Text.draw("PLAYDATE PLATFORMER", 64, 64)
  playdate.graphics.setImageDrawMode(playdate.graphics.kDrawModeCopy)
end

function scene:exit()
  scene.super.exit(self)
end

function scene:finish()
  scene.super.finish(self)
end
