package substates;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import Sys;
import psychlua.FunkinLua;

import objects.Alphabet;
import backend.*;
import states.*;
import openfl.events.UncaughtErrorEvent;
import haxe.CallStack;
import haxe.io.Path;
import lime.app.Application;

class CrashReportSubstate extends FlxState {
	var underText:FlxText;
	var errorimagetext:FlxSprite;
    public var error:String;
    public var errorName:String;
	
	var errMsg:String = "";
	var path:String;
	var callStack:Array<StackItem> = CallStack.exceptionStack(true);
	var dateNow:String = Date.now().toString();

	public function new(prevState:FlxState, error:String, errorName:String):Void {
        this.error = error;
        this.errorName = errorName;
        super();
	}

    override public function create(){
        super.create();

		FlxG.sound.music.stop(); //this just kills sound lol
        FlxG.state.persistentUpdate = false;
		FlxG.state.persistentDraw = true;
		
        var bg:FlxSprite = new FlxSprite().makeGraphic(1, 1, 0xFFFF0000);
		bg.scrollFactor.set();
		bg.alpha = 0;
		bg.loadGraphic(Paths.image("uhoh"));
		bg.setGraphicSize(1280, 720);
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		var coolText:Alphabet = new Alphabet(0, 32, "UNCATCHABLE ERROR", true);
		coolText.screenCenter(X);
		coolText.color = flixel.util.FlxColor.RED;
		add(coolText);

		var formattedErrorMessage:String = ' \n\n\n${error}\n\nplease report this error to circuitella on discord (if unmodified build use)';

		var report:FlxText = new FlxText(0, 0, FlxG.width / 1.5, formattedErrorMessage);
		report.setFormat(Paths.font('trebuc.ttf'), 16, 0xFFFFFFFF, CENTER, OUTLINE, 0xFF000000);
		report.screenCenter(XY);
		report.borderSize = 1.5;
		add(report);

		underText = new FlxText(0, FlxG.height - 64, FlxG.width, "Press SPACE to return to the Menu Screen.");
		underText.setFormat(Paths.font('trebuc.ttf'), 12, 0xFFFFFFFF, CENTER, OUTLINE, 0xFF000000);
		underText.y = FlxG.height - underText.height - 16;
		underText.borderSize = 1;
		underText.screenCenter(X);
		add(underText);

		underText = new FlxText(0, FlxG.height - 32, FlxG.width, "Press ESCAPE to Close The Game.");
		underText.setFormat(Paths.font('trebuc.ttf'), 12, 0xFFFFFFFF, CENTER, OUTLINE, 0xFF000000);
		underText.y = FlxG.height - underText.height - 16;
		underText.borderSize = 1;
		underText.screenCenter(X);
		add(underText);

		var errorimagetext:FlxSprite = new FlxSprite().makeGraphic(1, 1, 0xFF000000);
		errorimagetext.scrollFactor.set();
		errorimagetext.alpha = 1;
		errorimagetext.loadGraphic(Paths.image("error"));
		errorimagetext.setGraphicSize(861, 171);
		errorimagetext.y = 36;
		errorimagetext.updateHitbox();
		errorimagetext.screenCenter(X);
		add(errorimagetext);

		FlxTween.tween(bg, {alpha: 0.6}, 0.6, {ease: FlxEase.cubeOut});
		FlxTween.tween(errorimagetext, {alpha: 1}, 0.6, {ease: FlxEase.cubeOut});


		this.camera = FlxG.cameras.list[FlxG.cameras.list.length - 1];


		dateNow = dateNow.replace(" ", "_");
		dateNow = dateNow.replace(":", "'");

		path = "./crash/" + "PsychEngine_" + dateNow + ".txt";

		for (stackItem in callStack)
		{
			switch (stackItem)
			{
				case FilePos(s, file, line, column):
					errMsg += file + " (line " + line + ")\n";
				default:
					Sys.println(stackItem);
			}
		}

		if (!FileSystem.exists("./crash/"))
			FileSystem.createDirectory("./crash/");

		File.saveContent(path, formattedErrorMessage + "\n");
		
		


    }

	override function update(elapsed:Float):Void {
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE){
			MusicBeatState.switchState(new states.TitleState());  
	    }
		if (FlxG.keys.justPressed.ESCAPE){
			Sys.exit(0);  
	    }
	}
}