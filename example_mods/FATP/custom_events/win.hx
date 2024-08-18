
import flixel.FlxObject as Object;
import haxe.ds.StringMap;
import flixel.text.FlxText as Text;
import flixel.util.FlxSave as Save;
import backend.Mods;
import states.FreeplayState as Freeplay;
import flixel.sound.FlxSound as Sound;
import flixel.tweens.FlxTween as Tween;
import flixel.util.FlxTimer as Timer;
import openfl.filters.ShaderFilter;
import backend.MusicBeatState;

var win5:FlxSprite;
var win6:FlxSprite;
var winBg:FlxSprite;
var winAm:FlxSprite;
var winTop:FlxSprite;
var winBottom:FlxSprite;

final winAssets:String = 'win/';
var chimes:FlxSound;
var cheer:FlxSound;

var winValues = {
	a: 0,
	b: 0
}

var win5Twn:FlxTween;
var isFading:Bool = true;
var timedoneactive:Bool = false;

function onEvent(name, v1, v2)
{
    if (name != 'win')
        return;
    chimes.play();
		winBg.alpha = 1;
		win5.alpha = 1;
		win6.alpha = 1;
		winAm.alpha = 1;
		winTop.alpha = 1;
		winBottom.alpha = 1;
		win6.visible = true;
		isFading = false;

		win5Twn = Tween.tween(win5, {y: 186}, 5 / game.playbackRate, {onComplete: function() {
			cheer.play();
			winValues.a = 1;
		}});
}



function onCreate() {
	winBg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	add(winBg);
	winBg.camera = camOther;
	winBg.alpha = 0;

	chimes = new Sound().loadEmbedded(Paths.sound(winAssets + 'chimes 2'));
	chimes.pitch = game.playbackRate;
	FlxG.sound.list.add(chimes);

	cheer = new Sound().loadEmbedded(Paths.sound(winAssets + 'CROWD_SMALL_CHIL_EC049202'));
	cheer.pitch = game.playbackRate;
	FlxG.sound.list.add(cheer);

	win5 = new FlxSprite(549, 298).loadGraphic(Paths.image(winAssets + '5'));
	add(win5);
	win5.camera = camOther;
    win5.alpha = 0;

	win6 = new FlxSprite().loadGraphic(Paths.image(winAssets + '6'));
	add(win6);
	win6.camera = camOther;
	win6.alpha = 0;

	winTop = new FlxSprite(498, 169).makeGraphic(158, 118, FlxColor.BLACK);
	add(winTop);
	winTop.camera = camOther;
    winTop.alpha = 0;


	winBottom = new FlxSprite(499, 385).makeGraphic(158, 118, FlxColor.BLACK);
	add(winBottom);
	winBottom.camera = camOther;
    winBottom.alpha = 0;

	winAm = new FlxSprite(645, 296).loadGraphic(Paths.image(winAssets + 'am'));
	add(winAm);
	winAm.camera = camOther;
    winAm.alpha = 0;
}

function onUpdate(){
    if (timedoneactive = true)
        win6.x = win5.x + 4;
        win6.y = win5.y + 110;
        if (winValues.a == 1) winValues.b += 1 * game.playbackRate;

        if (winValues.b > 200 && !isFading) {
            win5.visible = false;
            isFading = true;
        }

        if (FlxG.keys.justPressed.ESCAPE && !isFading) {
            win5Twn.cancel();

            final fuckIt = new Sprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
            add(fuckIt);
            fuckIt.camera = camOther;
            fuckIt.alpha = 0;
            isFading = true;
        }
        else
            return;

}

function timedone(){
    winBg.alpha = 1;
    win5.alpha = 1;
    win6.alpha = 1;
    winam.alpha = 1;
    wintop.alpha = 1;
    winBottom.alpha = 1;
}