local bfx = 80;
local bfy = 80;
local zoomshit = 0;
function onUpdate()
    if mustHitSection == false then
        setProperty('defaultCamZoom', 0.7)
    elseif mustHitSection == true then
        setProperty('defaultCamZoom', 0.9)
    end
    zoomshit = getProperty('camGame.zoom')/0.6;
end