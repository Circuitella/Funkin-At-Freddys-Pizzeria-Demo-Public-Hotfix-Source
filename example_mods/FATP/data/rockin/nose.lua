local canClick = true

function onCreate()
	makeLuaSprite('celebrateposternose','',340,350)
	makeGraphic("celebrateposternose", 50, 40, 'FFFF0000')
	setProperty("celebrateposternose.alpha", 1)
    --addLuaSprite('celebrateposternose',true)
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
end

function onCreatePost()
    runHaxeCode([[
		FlxG.mouse.visible = true;
	]])

end

function onUpdate()
    setProperty('mouseT.x', getMouseX('camGame'))
    setProperty('mouseT.y', getMouseY('camGame'))

	if mouseOverlaps('celebrateposternose', 'camGame') and mousePressed('left') and canClick == true then
        canClick = false
		playSound("boop", 1)
        runTimer("boopcooldown", '0.4', '1')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'boopcooldown' then
    canClick = true 
   end
end

function mouseOverlaps(s, camera)
    local mX = getMouseX(camera or 'camHUD') + getProperty(camera .. '.scroll.x')
    local mY = getMouseY(camera or 'camHUD') + getProperty(camera .. '.scroll.y')
    local x = getProperty(s .. '.x')
    local y = getProperty(s .. '.y')
    local width = getProperty(s .. '.width')
    local height = getProperty(s .. '.height')
    return (mX > x) and (mX < x + width) and (mY > y) and (mY < y + height)
end