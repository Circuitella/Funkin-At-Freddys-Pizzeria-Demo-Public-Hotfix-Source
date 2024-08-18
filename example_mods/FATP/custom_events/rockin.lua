function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'rockin' then
        if value1 == 'slidetotheleft' then
            doTweenX("byebonnie", 'dad', -6000, 3.5, "expoOut")
        elseif value1 == 'shutdoor' then
            cameraShake('camGame', 0.03, 0.5)
        end
    end
end