TitleScene = {}
class("TitleScene").extends(NobleScene)
local scene = TitleScene

scene.backgroundColor = Graphics.kColorBlack

function scene:enter()
  local level_name = "Level_0"
  LDtk.load_level(level_name)
  playdate.graphics.sprite.removeAll()

  local layerSprites = {}
  for layer_name, layer in pairs(LDtk.get_layers(level_name)) do
    if not layer.tiles then
      goto continue
    end

    local tilemap = LDtk.create_tilemap(level_name, layer_name)

    local layerSprite = playdate.graphics.sprite.new()
    layerSprite:setTilemap(tilemap)
    layerSprite:moveTo(0, 0)
    layerSprite:setCenter(0, 0)
    layerSprite:setZIndex(layer.zIndex)
    layerSprite:add()
    layerSprites[layer_name] = layerSprite

    local emptyTiles = LDtk.get_empty_tileIDs(level_name, "Solid", layer_name)

    if emptyTiles then
      playdate.graphics.sprite.addWallSprites(tilemap, emptyTiles)
    end

    ::continue::
  end

  for index, entity in ipairs(LDtk.get_entities(level_name)) do
    if entity.name == "Player" then
      if entity.fields.EntranceDirection == direction then
        player.sprite:add()
        player.init(entity)
      end
    end
  end

  playdate.graphics.sprite.setAlwaysRedraw(true)
end

function scene:exit()

end
