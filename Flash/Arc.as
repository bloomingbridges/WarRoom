﻿package {		import flash.display.Sprite;	import flash.display.Shape;	import flash.geom.Point;	import com.greensock.TweenMax;	import com.greensock.easing.*;		public class Arc extends Sprite {				public var spacing:Number;		private var myMask:Sprite = new Sprite();		private var myMissile:Shape = new Shape();		private var myCurve:Shape = new Shape();		private var myPreCurve:Shape = new Shape();		private var origin:Point;				public function Arc(target:Point, travelTime:int) {			var arc:Shape = new Shape();			var x1 = 175 * (WarRoom.bW + WarRoom.bS);			var y1 = 37 * (WarRoom.bH + WarRoom.bS);			origin = new Point(x1,x2);			var x2 = target.x;			// var x2 = target.x * (WarRoom.bW + WarRoom.bS);			var y2 = target.y;			// var y2 = target.y * (WarRoom.bH + WarRoom.bS);			var phi = (40 * Math.PI / 180.0);			var x3, y3;			if (x2 > x1) {				x3 = x2 + ((x1-x2)*Math.cos(phi)-(y1-y2)* Math.sin(phi))/(2* Math.cos(phi));				y3 = y2 + ((y1-y2)*Math.cos(phi)+(x1-x2)* Math.sin(phi))/(2* Math.cos(phi));			} else {				x3 = x2 + ((x1-x2)*Math.cos(phi)+(y1-y2)* Math.sin(phi))/(2* Math.cos(phi));				y3 = y2 + ((y1-y2)*Math.cos(phi)-(x1-x2)* Math.sin(phi))/(2* Math.cos(phi));			}			// addChild(arc);			// arc.graphics.lineStyle(3, 0x00cccc, 1); 			// arc.graphics.moveTo(x1, y1); 			// arc.graphics.curveTo(x3, y3, x2, y2); 			addChild(myPreCurve);			myPreCurve.graphics.lineStyle(2, 0x00FFFF, 1);			myPreCurve.graphics.moveTo(x1, y1);			myPreCurve.graphics.curveTo(x3, y3, x2, y2);			//addChild(myCurve);			myCurve.graphics.lineStyle(2, 0xFF0000, 1);			myCurve.graphics.moveTo(x1, y1);			myCurve.graphics.curveTo(x3, y3, x2, y2);			myMissile.x = x1;			myMissile.y = y1;			myMissile.graphics.beginFill(0xFFFFFF);			myMissile.graphics.drawCircle(x1, y1, 5);			//addChild(myMissile);			//TweenMax.to(myMissile,1,{bezier:[{x:x3,y:y3},{x:x2,y:y2}],orientToBezier:true,ease:Sine.easeIn,onComplete:onHit,onUpdate:updateCurve});			//myMask.graphics.beginFill(0x000000);			//myMask.graphics.drawCircle(x1, y1, 5);			//myCurve.mask = myMask;		}		private function updateCurve() {			trace("yo");			//myMissile.graphics.clear();			//.graphics.lineStyle(2, 0xFFFFFF, 1);			//myMissile.graphics.moveTo(origin.x, origin.y);			//myMissile.graphics.drawCircle(origin.x, origin.y, 5);		}		private function onHit() {			trace("HIT!");		}			}	}