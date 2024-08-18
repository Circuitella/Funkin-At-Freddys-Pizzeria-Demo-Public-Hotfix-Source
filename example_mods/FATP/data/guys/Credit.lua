function OnCreate()
	makeLuaSprite('CreditNiko', 'songbys/template', 0, 0)
	scaleObject('CreditNiko', 1, 1);
  setObjectCamera('CreditNiko', 'hud')

	addLuaSprite('CreditNiko', true)
end

function onSongStart()
runTimer("balls","5","1")
end
function onTimerCompleted(tag)
  if tag == 'balls' then
    doTweenY(CreditTween, 'CreditNiko', -1000, 0.2, linear)
  end
end

