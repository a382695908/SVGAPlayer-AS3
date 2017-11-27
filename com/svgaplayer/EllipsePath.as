package com.svgaplayer {
	
	import flash.display.Graphics;	
	
	public class EllipsePath extends BezierPath {

		private var x = 0.0;
		private var y = 0.0;
		private var radiusX = 0.0;
		private var radiusY = 0.0;
		
		public function EllipsePath(x: Number, y: Number, radiusX: Number, radiusY: Number) {
			super("");
			this.x = x;
			this.y = y;
			this.radiusX = radiusX;
			this.radiusY = radiusY;
		}
		
		override public function drawPath(graphics: flash.display.Graphics) {
			graphics.drawEllipse(this.x - this.radiusX, this.y - this.radiusY, this.radiusX * 2, this.radiusY * 2);
		}

	}
	
}
