---@class Game : Plugin
---@field player Node
---@field beacons Vector3[]
---@field frags number
---@field wounds number
---@field hud Text
Game = script_class()

---@param scene_path string
function Game:init(scene_path)
	if not scene_path then
		scene_path = "data/scene.rgs"
	end
	Scene:load_async(scene_path)

	self.hud = Text:new({
		font_size = 40,
		foreground = Brush:solid(Color.BLACK)
	})
	self.beacons = {}
end

function Game:update()
	self.hud:set_text_async(string.format("Wounds: %s\nKilled Guards: %s", self.wounds, self.frags))
end

function Game:inc_frags()
	self.frags = self.frags + 1
end

function Game:inc_wounds()
	self.wounds = self.wounds + 1
end
