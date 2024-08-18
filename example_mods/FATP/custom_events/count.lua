local camDefaultZoom = nil
local camZoomEnable = false
local hudAlphaChanged = false


function onCreate()
    makeLuaSprite('RockinCount1', 'count/three', 250, 50)
    setScrollFactor('RockinCount1', 0, 0)
    setObjectCamera('RockinCount1', 'other')

    makeLuaSprite('RockinCount2', 'count/two', 250, 50)
    setScrollFactor('RockinCount2', 0, 0)
    setObjectCamera('RockinCount2', 'other')


    makeLuaSprite('RockinCount3', 'count/one', 250, 50)
    setScrollFactor('RockinCount3', 0, 0)
    setObjectCamera('RockinCount3', 'other')

    makeLuaSprite('RockinCount4', 'count/go', 250, 50)
    setScrollFactor('RockinCount4', 0, 0)
    setObjectCamera('RockinCount4', 'other')
end
function onUpdate()
    if camZoomEnable == false then
        camDefaultZoom = getProperty('defaultCamZoom')
    end

    for Rockin = 1,4 do
        setProperty('RockinCount'..Rockin..'.y', getProperty('RockinCount'..Rockin..'.y') + 5)
    end
end
function onEvent(name, value1, value2)
    if name == 'count' then
        addLuaSprite('RockinCount'..value1, true)
        setProperty('RockinCount'..value1..'.alpha', 1)
        setProperty('RockinCount'..value1..'.y', 0)
        runTimer('RockinCount'..value1..' Bye', 0.001, 1)
        
        
        if tonumber(value1) < 4 then
            camZoomEnable = true
            setProperty('defaultCamZoom',getProperty('defaultCamZoom') + 0.1)
            if value2 == 'true' or value2 == '' then
                doTweenAlpha('wowInvisible','camHUD',0,0.5,'linear')
                hudAlphaChanged = true
            else
                if hudAlphaChanged == true then
                    doTweenAlpha('wowInvisible','camHUD',1,0.5,'linear')
                    hudAlphaChanged = false
                end
            end
        else
            doTweenAlpha('wowInvisible','camHUD',1,0.5,'linear')
            setProperty('defaultCamZoom',camDefaultZoom)
            camZoomEnable = false
        end
    end
end


function onTimerCompleted(tag)
    if tag == 'RockinCount3 Bye' then
        doTweenAlpha('RockinCount3 Tween', 'RockinCount3', 0, 0.3, 'linear')
    end
    if tag == 'RockinCount2 Bye' then
        doTweenAlpha('RockinCount2 Tween', 'RockinCount2', 0, 0.3, 'linear')
    end
    if tag == 'RockinCount1 Bye' then
        doTweenAlpha('1 Tween', 'RockinCount1', 0, 0.3, 'linear')
    end
    if tag == 'RockinCount4 Bye' then
        doTweenAlpha('RockinCount4 Tween', 'RockinCount4', 0, 0.3, 'linear')
    end
end

function onTweenCompleted(tag)
    for Rockin = 1,4 do
        if tag == 'RockinCount'..Rockin..' Bye' then
            removeLuaSprite('RockinCount'..Rockin, false)
            scaleObject('RockinCount'..Rockin,1,1)
        end
    end
end