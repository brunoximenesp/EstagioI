--Objects

local physics = require "physics"
physics.start()

local background = display.newImage("background.png")
background:scale (0.61, 0.61)
background.x = display.contentWidth/3
background.y = display.contentHeight/3
background.x = display.contentCenterX
background.y = display.contentCenterY

local ground = display.newImage( "ground.png" )
ground.x, ground.y = 195,305
ground:scale (0.7, 0.7)


local groundShape ={-200,-30, 200,-30, 100,50, -100,90 }
physics.addBody( ground, "static", { friction=1.0, density=1.0, bounce=0, shape=groundShape } )

local myImage = display.newImage( "character.png" )
myImage:scale (0.25, 0.25)

physics.addBody( myImage,{ friction=1.0, density=1.0, bounce=0.3, radius=35 } )
myImage.isFixedRotation = true

local function onScreenTouch( event )
	if event.phase == "began" then
			-- make character jump forward
			myImage:applyForce( 300, -2000, myImage.x, myImage.y )
	end
		return true
end

myImage:addEventListener( "touch", onScreenTouch )

myImage.x = display.contentWidth/900
myImage.y = display.contentHeight/1.3