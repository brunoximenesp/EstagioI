
local composer = require( "composer" )

local scene = composer.newScene()



-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local physics = require "physics"
physics.start()
physics.setGravity(0,0)

local background = display.newImage("background2.png")
background:scale (0.61, 0.61)
background.x = display.contentWidth/3
background.y = display.contentHeight/3
background.x = display.contentCenterX
background.y = display.contentCenterY

-- Set Variables
 _W = display.contentWidth; -- Get the width of the screen
 _H = display.contentHeight; -- Get the height of the screen
 motionx = 0; -- Variable used to move character along x axis
 motionzombie = 0;
 speed = 2; -- Set Walking Speed
 speedzombie = 1;

local ground = display.newImage( "ground.png" )
ground.x, ground.y = 195,340
ground:scale (0.7, 0.7)

 local sheetData ={
    width = 416,
    height = 416,
    numFrames = 5
}
local sheet_run = graphics.newImageSheet("run.png", sheetData)

local sequenceData ={
	{ name = "normalRun",
	start = 1,
	count = 5,
	time = 800,
	loopCount = 0,
	loopDirection = "forward"
	}
}

  local animation = display.newSprite( sheet_run, sequenceData )
 animation:scale ( 0.23, 0.23)
 animation.x = display.contentWidth/25
 animation.y = display.contentHeight/1.333


local groundShape ={-285,-67, 285,-67, 285,67, -285,67 }

physics.addBody( ground, "static", { friction=1.0, density=1.0, bounce=0, shape=groundShape } )

local myImage = display.newImage( "character.png" )
myImage.x = display.contentWidth/25
myImage.y = display.contentHeight/1.333
myImage:scale (0.25, 0.25)
physics.addBody( myImage,{ friction=1.0, density=1.0, bounce=0,  radius=35 } )
myImage.myName = "myImage"

local zombie1 = display.newImage( "zombie1.png")
zombie1.x = display.contentWidth/1.2
zombie1.y = display.contentHeight/1.333
zombie1:scale (0.25, 0.25)
physics.addBody( zombie1,{ friction=1.0, density=1.0, bounce=0,  radius=35 } )
zombie1.myName = "zombie1"


local zumbi2 = display.newImage( "zombie2.png")
zumbi2.x = display.contentWidth/1
zumbi2.y = display.contentHeight/1.333
zumbi2:scale (0.25, 0.25)
physics.addBody( zumbi2,{ friction=1.0, density=1.0, bounce=0,  radius=35 } )
zumbi2.myName = "zumbi2"

local zumbi3 = display.newImage( "zombie2.png")
zumbi3.x = display.contentWidth/1.1
zumbi3.y = display.contentHeight/1.333
zumbi3:scale (0.25, 0.25)
physics.addBody( zumbi3,{ friction=1.0, density=1.0, bounce=0,  radius=35 } )
zumbi3.myName = "zumbi3"

local zumbi4 = display.newImage( "zombie1.png")
zumbi4.x = display.contentWidth/1.05
zumbi4.y = display.contentHeight/1.333
zumbi4:scale (0.25, 0.25)
physics.addBody( zumbi4,{ friction=1.0, density=1.0, bounce=0,  radius=35 } )
zumbi4.myName = "zumbi4"





myImage.isFixedRotation = true
-- Add player
 
 animation.isVisible = false

 -- Add left joystick button
 local left = display.newImage("arrowleft.png")
 left:scale(0.4, 0.4)
 left.x = 30; left.y = 298;

-- Add right joystick button
 local right = display.newImage("arrowright.png")
 right:scale(0.4, 0.4)
 right.x = _W - 30; right.y = 298;
 
 
 -- When left arrow is touched, move character left
 function left:touch()
 motionx = -speed;
myImage.isVisible = false
animation.isVisible = true
 animation:play()

 end
 left:addEventListener("touch",left)

-- When right arrow is touched, move character right
 function right:touch()
 motionx = speed;
myImage.isVisible = false
animation.isVisible = true
 animation:play()

 end
 right:addEventListener("touch",right)
 
-- Move character
 local function movePlayer (event)
animation.x = animation.x + motionx;
myImage.x = myImage.x + motionx;
 end
 Runtime:addEventListener("enterFrame", movePlayer)
 
 
 -- Stop character movement when no arrow is pushed
local function stop (event)
 if event.phase =="ended" then
  motionx = 0;
animation:pause()
animation.isVisible = false
myImage.isVisible = true

 end
end
Runtime:addEventListener("touch", stop )

  local function moveZombies (event)
 zombie1:setLinearVelocity(-10, 0)
 zumbi2:setLinearVelocity(-10, 0)
 end
 Runtime:addEventListener("enterFrame", moveZombies)


 function zombie1:touch()
  motionx = 0;
zombie1.isVisible = false
end
zombie1:addEventListener("touch", zombie1)
 
function zumbi2:touch()
  motionx = 0;
zumbi2.isVisible = false
end
zumbi2:addEventListener("touch", zumbi2)

function zumbi3:touch()
  motionx = 0;
zumbi3.isVisible = false
end
zumbi3:addEventListener("touch", zumbi3)

function zumbi4:touch()
  motionx = 0;
zumbi4.isVisible = false
end
zumbi4:addEventListener("touch", zumbi4)


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	physics.pause()

	
    -- Set up display groups
    backGroup = display.newGroup()  -- Display group for the background image
    sceneGroup:insert( backGroup )  -- Insert into the scene's view group
 
    mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
    sceneGroup:insert( mainGroup )  -- Insert into the scene's view group
 
    uiGroup = display.newGroup()    -- Display group for UI objects like the score
    sceneGroup:insert( uiGroup )    -- Insert into the scene's view group
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()


return scene
