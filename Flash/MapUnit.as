﻿package  {	import BlockUnit;	import flash.display.Shape;		public class MapUnit extends BlockUnit {				private var brightness:Number;		public function MapUnit(population:Number = 0, bW = 2, bH = 3) {						super(false, bW, bH);			brightness = population;			lit = false;			adoptColour();		}		public function select():void {			lit = true;			//drawBlock();		}		public function deselect():void {			lit = false;			//drawBlock();		}		private function adoptColour():void {			switch (true) {				case (brightness > 700000):					colour = 0xFF00FF;					break;				case (brightness > 500000):					colour = 0xEE00EE;					break;				case (brightness > 100000):					colour = 0xCC00CC;					break;				case (brightness > 50000):					colour = 0x990099;					break;				case (brightness > 100):					colour = 0x660066;					break;				case (brightness > 0):					colour = 0x330033;					break;				default:					colour = 0x111111;					break;			}		}		public function drawBlock():Shape {			if (lit)				graphics.beginFill(0xFFFFFF);			else 				graphics.beginFill(colour);			graphics.drawRect(0, 0, w, h);			graphics.endFill();			return this;		}	}	}