﻿package {		import flash.display.Sprite;	import flash.display.Shape;	import flash.events.Event;	import flash.events.TimerEvent;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.geom.Point;	import flash.utils.Timer;		public class Arc extends Sprite {				public var spacing:Number;				public function Arc(target:Point) {						// trace(target);			var my_shape:Shape = new Shape();			var myCurve:Shape = new Shape();			// addChild(my_shape);			var x1 = 175 * (WarRoom.bW + WarRoom.bS);			var y1 = 37 * (WarRoom.bH + WarRoom.bS);			var x2 = target.x * (WarRoom.bW + WarRoom.bS);			var y2 = target.y * (WarRoom.bH + WarRoom.bS);			// my_shape.graphics.lineStyle(3, 0xFF0000, 1);			// my_shape.graphics.moveTo(x1, y1); 			// my_shape.graphics.lineTo(x2, y2);			var phi = (40 * Math.PI / 180.0);			var x3, y3;			if (x2 > x1) {				x3 = x2 + ((x1-x2)*Math.cos(phi)-(y1-y2)* Math.sin(phi))/(2* Math.cos(phi));				y3 = y2 + ((y1-y2)*Math.cos(phi)+(x1-x2)* Math.sin(phi))/(2* Math.cos(phi));			} else {				x3 = x2 + ((x1-x2)*Math.cos(phi)+(y1-y2)* Math.sin(phi))/(2* Math.cos(phi));				y3 = y2 + ((y1-y2)*Math.cos(phi)-(x1-x2)* Math.sin(phi))/(2* Math.cos(phi));			}			// addChild(myCurve);			// myCurve.graphics.lineStyle(2, 0xFF0000, 1);			// myCurve.graphics.moveTo(x1, y1);			// myCurve.graphics.curveTo(x3, y3, x2, y2);			// var my_shape:Shape = new Shape();			addChild(my_shape);			my_shape.graphics.lineStyle(3, 0x00cccc, 1); 			my_shape.graphics.moveTo(x1, y1); 			my_shape.graphics.curveTo(x3, y3, x2, y2); 		}					}	}