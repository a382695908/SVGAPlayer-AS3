package com.svgaplayer {
	
	import flash.display.Graphics;
	
	public class RectPath extends BezierPath {

		private var x = 0.0;
		private var y = 0.0;
		private var width = 0.0;
		private var height = 0.0;
		private var cornerRadius = 0.0;
		
		public function RectPath(x: Number, y: Number, width: Number, height: Number, cornerRadius: Number) {
			super("");
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
			this.cornerRadius = cornerRadius;
		}
		
		override public function drawPath(graphics: flash.display.Graphics) {
			graphics.drawRoundRect(this.x, this.y, this.width, this.height, this.cornerRadius);
		}

	}
	
}
