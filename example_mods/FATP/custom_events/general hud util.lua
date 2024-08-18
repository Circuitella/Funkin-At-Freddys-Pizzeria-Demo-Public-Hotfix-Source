function onEvent(eventName, value1, value2)
    if eventName == 'general hud util' then
        if value1 == 'camHUD show' then
            doTweenAlpha('hudFunne', 'camHUD', 1, 0.9, 'linear')

        elseif value1 == 'camHUD hide' then
            doTweenAlpha('camHUD', 'camHUD', 0, 0.9, 'linear')

        elseif value1 == 'midhide' then
            doTweenAlpha("bye hud STUFF1", 'scoreTxt', 0, 1)
            doTweenAlpha("bye hud STUFF2", 'healthBar', 0, 1)
            doTweenAlpha("bye hud STUFF3", 'iconP1', 0, 1)
            doTweenAlpha("bye hud STUFF4", 'iconP2', 0, 1)
            doTweenAlpha("bye hud STUFF5", 'timeTxt', 0, 1)
            doTweenAlpha("bye hud STUFF7", 'timeBar', 0, 1)

        elseif value1 == 'transition' then
            doTweenZoom('zom', 'camGame', 10, 1.7, 'cubeInOut')
            doTweenAngle('zim' ,'camGame', 360, 2.7, 'cubeInOut')

        elseif value1 == 'transitionend' then
            doTweenZoom('zom', 'camGame', 6, 0.1, 'cubeOut')
            cameraFlash('hud', "FFFFFF", 1.0, true)
            doTweenZoom('zmo', 'camHUD', 1.2, 0.1,'cubeOut')

        elseif value1 == 'show mid' then
            doTweenAlpha("bye hud STUFF1", 'scoreTxt', 1, 1)
            doTweenAlpha("bye hud STUFF2", 'healthBar', 1, 1)
            doTweenAlpha("bye hud STUFF3", 'iconP1', 1, 1)
            doTweenAlpha("bye hud STUFF4", 'iconP2', 1, 1)
            doTweenAlpha("bye hud STUFF5", 'timeTxt', 1, 1)
            doTweenAlpha("bye hud STUFF7", 'timeBar', 1, 1)
            
        elseif value1 == 'hideworld' then
            doTweenAlpha("byeballs", "CamGame", 0, 1)

        elseif value1 == 'cinematic hide' then
            doTweenAlpha("bye hud STUFF1", 'scoreTxt', 0, 1, 'bounceInOut')
            doTweenAlpha("bye hud STUFF2", 'healthBar', 0, 1, 'bounceInOut')
            doTweenAlpha("bye hud STUFF3", 'iconP1', 0, 1, 'bounceInOut')
            doTweenAlpha("bye hud STUFF4", 'iconP2', 0, 1, 'bounceInOut')
            doTweenAlpha("bye hud STUFF5", 'timeTxt', 0, 1, 'bounceInOut')
            doTweenAlpha("bye hud STUFF7", 'timeBar', 0, 1, 'bounceInOut')

        end
    end
    end