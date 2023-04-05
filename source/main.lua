import '../toyboxes/toyboxes.lua'
import 'libraries/noble/Noble'
import 'utilities/Utilities'

-- scenes
import 'scenes/TitleScene'
import 'scenes/GameScene'

-- levels
local use_ldtk_precomputed_levels = not playdate.isSimulator
LDtk.load("levels/world.ldtk", use_ldtk_precomputed_levels)
if playdate.isSimulator then
  LDtk.export_to_lua_files()
end

-- fonts
Noble.Text.FONT_SMALL = Graphics.font.new("assets/fonts/A.B. Cop")

-- Noble.Settings.setup({
--   Difficulty = "Medium"
-- })

-- Noble.GameData.setup({
--   Score = 0
-- })

Noble.showFPS = true

Noble.new(TitleScene, 1.5, Noble.TransitionType.CROSS_DISSOLVE)
