local playaX = 700
local playaY = 570
local icon = 'iconP1'
local oppX = 430
local oppY = 550
local icon2 = 'iconP2'
local swap = true
local notePositions = {}

function onCreatePost()
	makeLuaSprite('HealthBattery', 'healthBarBattery')
	setObjectCamera('HealthBattery', 'hud')
	addLuaSprite('HealthBattery', true)
    setProperty('HealthBattery.x', 578)
	setProperty('HealthBattery.y', 'healthBar.y')
    if dadName == 'freddy-flipx' or dadname == 'chica' or dadName == 'freddy-flipx-powerout' then
        swap = true
        if not middlescroll then
        notePositions = {
            defaultPlayerStrumX0,
            defaultPlayerStrumX1,
            defaultPlayerStrumX2,
            defaultPlayerStrumX3,
            defaultOpponentStrumX0,
            defaultOpponentStrumX1,
            defaultOpponentStrumX2,
            defaultOpponentStrumX3
        }       
        for i = 1, 8, 1 do
            noteTweenX('noteTween'..i, i-1, notePositions[i], 0.01, 'linear')
        end
    end
    else
        swap = false
    end
    if dadName == 'freddy' or dadName == 'freddy-flipx' then
        for i = 0,4 do
            noteTweenAlpha("byenotealpha"..i , i-1, 0.25, 0.001, "linear")
        end
    end
end

function onUpdatePost()
    if not swap then 
    setProperty(icon .. '.x', playaX)
    setProperty(icon2 .. '.x', oppX)
    setProperty('iconP1.y', getProperty('healthBar.y') - 60)
    setProperty('iconP2.y', getProperty('iconP1.y') - 10)
    --setProperty('healthBar.y', 0)
    setProperty('healthBar.angle', 0)


    else
        setProperty(icon .. '.x', 430)
        --setProperty(icon .. '.y', 570)
        setProperty(icon2 .. '.x', 700)
        setProperty('iconP1.y', getProperty('healthBar.y') - 60)
        setProperty('iconP2.y', getProperty('iconP1.y') - 10)
        --setProperty('healthBar.y', 620)
        setProperty('healthBar.angle', 180)
    end
    setProperty('HealthBattery.alpha', 'healthBar.alpha')

    if not downscroll then --so sorry i forgot this downscroll users, forgive me pls
        setProperty('scoreTxt.y', getProperty("healthBar.y") +55)
    else
        setProperty('scoreTxt.y', getProperty("healthBar.y") +65)
    end
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'hidemosthud' then
		doTweenAlpha("healthbye", "healthBar", 0, 1)
		doTweenAlpha("iconp1", "iconP1", 0, 1)
		doTweenAlpha("iconp2", "iconP2", 0, 1)
		doTweenAlpha("scorebye", "scoreTxt", 0, 1)
		doTweenAlpha("time", "timeTxt", 0, 1)
		doTweenAlpha("time2", "timeBar", 0, 1)
    end
    if eventName == 'powerout' then
        for i = 0,4 do
            noteTweenAlpha("byenotealpha"..i , i-1, 0.001, 1.5, "linear")
        end
        for i = 5,8 do
            noteTweenAlpha("byenotealpha"..i , i-1, 0.25, 1.5, "linear")
        end
    end
    if eventName == 'blackout' then
        triggerEvent("hidemosthud")
        for i = 0,4 do
            noteTweenAlpha("byenotealpha"..i , i-1, 0.001, 1, "linear")
        end
        for i = 5,8 do
            noteTweenAlpha("byenotealpha"..i , i-1, 0.001, 1, "linear")
        end
    end
end
