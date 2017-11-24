package com.svgaplayer {
	
	public class Transform {

		public var a = 1.0;
		public var b = 0.0;
		public var c = 0.0;
		public var d = 1.0;
		public var tx = 0.0;
		public var ty = 0.0;
		
		public function Transform(a: Number, b: Number, c: Number, d: Number, tx: Number, ty: Number) {
			this.a = a;
			this.b = b;
			this.c = c;
			this.d = d;
			this.tx = tx;
			this.ty = ty;
		}

	}
	
}
