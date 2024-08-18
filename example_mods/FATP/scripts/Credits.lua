local creditstillexist = true
local crediticon = 'Circuitella'
local creditYOffset = 10
local creditXOffset = 240

function onCreate()
    creditIconName()


    makeLuaSprite('creditBG', 'songbys/Template', -600, 606) --make its X Cord -600 and have it slide in then out after a few seconds later
    setObjectCamera('creditBG', 'camOther')
    addLuaSprite('creditBG', true)

    makeLuaText("CreditTxt", getTextFromFile('data/'..songPath..'/Credits.txt')) --cords dont matter since gonna tie it to the BG
    setTextAlignment('CreditTxt', left)
    setTextSize('CreditTxt', 16.5)
    setObjectCamera('CreditTxt', 'camOther')
    addLuaText('CreditTxt', true)
    setTextFont('CreditTxt', 'creditbs.ttf')

    makeLuaSprite('CreditIcon', 'credits/'..crediticon..'' , 0, 0) --me as placeholder incase it doesn't work properly
    setObjectCamera('CreditIcon', 'camOther')
    setProperty('CreditIcon.antialiasing', false)
    addLuaSprite('CreditIcon', true)
end

function onSongStart()
    doTweenX('Credit Appear', 'creditBG', 0, 1, 'quintOut')
    runTimer('Credit Idle', 2.5)
end

function onUpdate(elapsed)
    if creditstillexist == true then
    setProperty('CreditTxt.x', getProperty('creditBG.x'))
    setProperty('CreditTxt.y', getProperty('creditBG.y'))
    setProperty('CreditIcon.y', getProperty('creditBG.y') + creditYOffset)
    setProperty('CreditIcon.x', getProperty('creditBG.x') + creditXOffset)
    end
end

function onTimerCompleted(tag)
    if tag == 'Credit Idle' then
    doTweenX('Credit Bye', 'creditBG', -600, 1, 'quintOut')
    elseif tag == 'Credit Bye' then
        removeLuaText('CreditTxt', true)
        removeLuaSprite('CreditIcon', true)
        removeLuaSprite('CreditBG', true)
    end
end


function creditIconName()
    if songPath == 'power' then
        crediticon = 'nik'
        creditYOffset = -28
        creditXOffset = 300
    end
    if songPath == 'guys' then
        crediticon = 'Circuitella'
        creditYOffset = -25
        creditXOffset = 350
        setTextSize('CreditTxt', 24)
    end
    if songPath == 'rockin' then
        crediticon = 'pik'
        creditYOffset = -5
        creditXOffset = 300
    end
    return crediticon
end