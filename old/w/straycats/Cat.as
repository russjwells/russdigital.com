﻿package {	import flash.display.Sprite;	import flash.display.MovieClip;	import flash.display.SimpleButton;	import flash.events.Event;	import flash.events.*;	import flash.utils.*;	import flash.filters.*;	import globalvars;	public class Cat extends MovieClip {		private var _petName:String;		private var _idNum:int;		private var _gender:String;		private var _infected:Boolean;		private var _age:Number;		private var _lifeStage:String;		private var _pregnant:Boolean;		private var _offspring:Number;		private var _timesMated:Number;		private var _dead:Boolean;		private var _babyCounter:int;		private var _isSelected:Boolean;		private var _lifeSpan:int =30;		private var _kittenSpan:int = 3;		//constructor		public function Cat(initialGender:String = "",initialInfected:Boolean=false, initialDead:Boolean=false, motherid:int=0) {			this.addEventListener(MouseEvent.CLICK, catClick);			addEventListener(MouseEvent.MOUSE_OVER, setHoverText);			_idNum=globalvars.catArray.length;			_age=0;			_petName="Unnamed";			_lifeStage="Kitten";//kitten, regcat, oldcat			_pregnant=false;			_offspring=0;			_timesMated=0;			_infected=initialInfected;			_dead=initialDead;			_babyCounter=0;			_isSelected=false;			if (initialGender=="") {				var ran:Number;				ran=Math.round(Math.random());				if (ran<=.5) {					_gender="female";				} else {					_gender="male";				}			} else {				_gender=initialGender;			}			trace("A new " + _gender + " cat is born");			//random male/female		}				function setHoverText(event:MouseEvent):void{				var hoverText:String="";			hoverText="#"+ _idNum + ", " + _petName;			trace("parent: " + (parent as MovieClip));			trace(_idNum);			trace(_petName);			(parent as MovieClip).catAreaHover_txt.text=hoverText;		}				public function catClick(e:Event):void {			var lastCatID:int = globalvars.g.focusedCatId;			trace("Old SELECTED: " + lastCatID);			if (globalvars.g.focusedCatId>-1) {				globalvars.catArray[lastCatID].isSelected=false;			}			globalvars.g.focusedCatId=_idNum;			globalvars.g.focusedCatName=_petName;			globalvars.g.focusedCatGender=_gender;			globalvars.g.focusedCatAge=_age;			globalvars.g.focusedCatPregnant=_pregnant;			globalvars.g.focusedCatLifeStage=_lifeStage;			trace(globalvars.g.focusedCatId);			trace("--------------------------FOCUS SET-------------------------");			if (lastCatID>-1) {				globalvars.catArray[lastCatID].isSelected=false;			}			this.isSelected=true;			//this.filter			//menuMain_mc.menuI.name_txt.text=_petName;			//menuMain_mc.menuI.gender_txt.text=_gender;			//menuMain_mc.menuI.age_txt.text=_age;			//menuMain_mc.menuI.pregnant.text=_pregnant;			//menuMain_mc.menuI.lifeStage_txt.text=_lifetStage;			//trace("Pet Name: " + _petName);			//trace("ID: " + _idNum);			//trace("Gender: " + _gender);			//trace("Age: " + _age);			//trace("Pregnant: " + _pregnant);			//trace("Infected: " + _infected);			//trace("Offspring: " + _offspring);			//trace("Has Mated: " + _timesMated);			//trace("Dead? " + _dead);		}				public function catHighlight():void{					}				public function faceRight():void{			this.gotoAndStop(2);		}				public function faceLeft():void{			this.gotoAndStop(1);		}						//GETS		public function get petName():String {			return _petName;		}		public function get isSelected():Boolean {			return _isSelected;		}		public function get idNum():int {			return _idNum;		}		public function get gender():String {			return _gender;		}		public function get age():Number {			return _age;		}		public function get lifeStage():String {			return _lifeStage;		}		public function get pregnant():Boolean {			return _pregnant;		}		public function get infected():Boolean {			return _infected;		}		public function get offsping():Number {			return _offspring;		}		public function get timesMated():Number {			return _timesMated;		}		public function get dead():Boolean {			return _dead;		}		//SETS		public function set petName(a:String):void {			_petName=a;		}		public function set isSelected(a:Boolean):void {			var myGlow:GlowFilter = new GlowFilter();			if (_isSelected) {				this.filters = [myGlow];			} else {				this.filters = [];			}			_isSelected=a;		}		public function set idNum(a:int):void {			_idNum=a;		}		public function set gender(a:String):void {			_gender=a;		}		public function set age(a:Number):void {			_age=a;		}		public function set pregnant(a:Boolean):void {			_pregnant=a;		}		public function set infected(a:Boolean):void {			_infected=a;		}		public function set offsping(a:Number):void {			_offspring=a;		}		public function set timesMated(a:Number):void {			_timesMated=a;		}		public function set dead(a:Boolean):void {			_dead=a;		}								//BEHAVIORS		public function randomMove():void {			//trace("randomMove()");			var mran:Number;			mran=Math.round(Math.random()*10);			var topBound:Number=0;			var leftBound:Number=0;			var botBound:Number=450;//CatArea_mc.height;			var rightBound:Number=550;//CatArea_mc.width;			var moveDistance:Number=5;			if (mran<3) {				if (this.x+moveDistance<rightBound) {					this.x=this.x+moveDistance;				} else {					this.x=this.x-moveDistance;				}			} else if (mran<6) {				if (this.x-moveDistance>leftBound) {					this.x=this.x-moveDistance;				} else {					this.x=this.x+moveDistance;				}			} else if (mran<8) {				if (this.y+moveDistance<botBound) {					this.y=this.y+moveDistance;				} else {					this.y=this.y-moveDistance;				}			} else {				if (this.y-moveDistance>topBound) {					this.y=this.y-moveDistance;				} else {					this.y=this.y+moveDistance;				}			}		}		public function ageUp():String {			//trace("ageUp()");			if (_pregnant==true) {				_babyCounter++;				if (_babyCounter>2) {					haveBabies();					_babyCounter=0;					_pregnant=false;					globalvars.g.numPregnant--;				}			}			if (_dead==false) {				var didChange:String ="";				_age++;				if (_age>_kittenSpan && _lifeStage=="Kitten") {					_lifeStage="Cat";					didChange=_lifeStage;					this.width = this.width*1.5;					this.scaleY = this.scaleX;					globalvars.g.numYoung--;					globalvars.g.numAdult++;					trace("Cat " + idNum + " has grown up.");				} else if (_age>_lifeSpan && _lifeStage=="Cat") {					_lifeStage="Dead";					didChange=_lifeStage;					_dead=true;					this.visible=false;					globalvars.g.numAdult--;					globalvars.g.numDead++;					trace("Cat " + idNum + " has died.");				}			}			return didChange;		}		public function knockedUp():void {			trace("knockedUp()");			//this.alpha=60;			if (globalvars.g.numMale>0){				_pregnant=true;				globalvars.g.numPregnant++;			} else {				trace("lol no male cats");			}			//var pregTimer:Timer = new Timer(1000, 3);			//pregTimer.addEventListener(TimerEvent.TIMER, onTick);			//pregTimer.addEventListener(TimerEvent.TIMER_COMPLETE, haveBabies);		}		//private function onTick(event:TimerEvent):void {		//}		private function haveBabies():void {			trace(_idNum +" had Babies.");			/*			spawnCat("female", false, false, this.x, this.y);			globalvars.g.numYoung++;			globalvars.g.numFemale++;			spawnCat("male", false, false, this.x, this.y);			globalvars.g.numYoung++;			globalvars.g.numMale++;			spawnCat("female", false, false, this.x, this.y);			globalvars.g.numYoung++;			globalvars.g.numFemale++;*/			var numsomeBabies:int=0;			var ran:Number;			for (numsomeBabies=0; numsomeBabies<3; numsomeBabies++){				ran=Math.round(Math.random());				if (ran<=.5) {					spawnCat("male", false, false, this.x, this.y);					globalvars.g.numYoung++;					globalvars.g.numMale++;				} else {					spawnCat("female", false, false, this.x, this.y);					globalvars.g.numYoung++;					globalvars.g.numFemale++;				}			}			_pregnant=false;		}		function spawnCat(gender:String, sick:Boolean, dead:Boolean, xPos:int, yPos:int):void {			trace("spawnCat()");			//trace("total num: " + numTotal);			var c:Cat = new Cat(gender, false, false);			globalvars.catArray.push(c);			parent.addChild(c);			//trace("New Baby Cat: "+c.idNum);			c.x=xPos;			c.y=yPos;		}		//numTotal++;		//trace("+1 Total");		//numYoung++;		//trace("+1 Young");		//if (gender=="male"){		//numMale++;		//trace("+1 Male");		//} else if (gender=="female"){		//numFemale++;		//trace("+1 Female");	}	//trace("Total Cats: " + numTotal);///////////////////////////////////////////	} 