package {		import flash.display.Sprite;	import flash.events.Event;	import flash.events.TimerEvent;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.geom.Point;	import flash.utils.Timer;	import map.MapUnit;		public class MapGenerator extends Sprite {				public  var spacing:Number;		public  var blockWidth:Number;		public  var blockHeight:Number;				private var nrows:int = 142;		private var ncols:int = 360;		private var mapData:Array;		private var blocks:Array;		private var lastDestination:Point;		private var shuffle:Timer;				public function MapGenerator() {						spacing = WarRoom.bS;			blockWidth = WarRoom.bW;			blockHeight = WarRoom.bH;			var myLoader:URLLoader = new URLLoader();			myLoader.addEventListener(Event.COMPLETE, onDataLoaded);			myLoader.load(new URLRequest("http://localhost:8888/mapdata.asc"));						lastDestination = new Point(0,0);			shuffle = new Timer(1000, 0);			// shuffle.addEventListener(TimerEvent.TIMER, pickNewDestination);					}		public function lockDownCurrentPosition():Point {			shuffle.stop();			return lastDestination;		}		public function unlock():void {			shuffle.reset();			shuffle.start();		}		public function getBlockProperties():Object {			return {				width: blockWidth,				height: blockHeight,				spacing: spacing			}		}				private function onDataLoaded(e:Event):void {			var popData:Array = e.target.data.split(/\n/);			popData.splice(0,6);			mapData = popData;			generateMap();			// centreMap();			this.cacheAsBitmap = true;			dispatchEvent(new MapEvent("onReady"));			shuffle.start();		}				private function generateMap():void {			blocks = new Array(nrows);			var values:Array = new Array();			for (var i=0; i<=nrows; i++) {				values = mapData[i].split(' ');				blocks[i] = new Array();				for (var j=0; j<=ncols; j++) {					var block:MapUnit = new MapUnit(values[j]);					block.y = i * (block.height + spacing);					block.x = j * (block.width + spacing);					blocks[i].push(block);					addChild(block.drawBlock());				}			}		}		private function centreMap():void {			var mapWidth:int = (ncols*(blockWidth+spacing)) - spacing;			if (stage.stageWidth > mapWidth)				x = (WarRoom.FULL_WIDTH - mapWidth) / 2;			else				x = WarRoom.HALF_WIDTH - (mapWidth / 2);			x = Math.floor(x);			y = 100;		}		public function pickNewDestination():Point {			var r:Point, block, point:Point;			r = getRand();			block = blocks[r.x][r.y];			while (block.population === 0) {				r = getRand();				block = blocks[r.x][r.y];			}			point = new Point(block.x,block.y);			return point			// blocks[lastDestination.x][lastDestination.y].deselect();			// lastDestination = new Point( x , y );			// var evt = new MapEvent("onShuffle");			// evt.newDestination = lastDestination;			// dispatchEvent(evt);			// blocks[x][y].select();		}		private function getRand():Point {			var point:Point = new Point(					Math.floor( Math.random() * nrows ), 					Math.floor( Math.random() * ncols )				);			return point;		}			}	}