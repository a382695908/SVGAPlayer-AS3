package com.svgaplayer {
	import com.svgaplayer.proto.FrameEntity;
	import com.svgaplayer.proto.Layout;
	import com.svgaplayer.proto.Transform;
	import com.svgaplayer.Transform;
	import com.svgaplayer.BezierPath;
	import flash.display.Sprite;
	
	public class FrameEntity {

		public var alpha: Number = 0.0;
		public var transform: com.svgaplayer.Transform = new com.svgaplayer.Transform(1.0, 0.0, 0.0, 1.0, 0.0, 0.0);
		public var layout: Rect = new Rect(0, 0, 0, 0);
		public var maskPath: com.svgaplayer.BezierPath = null;
		public var maskSprite: flash.display.Sprite = null;
		
		public function FrameEntity(spec: com.svgaplayer.proto.FrameEntity) {
			this.alpha = spec[com.svgaplayer.proto.FrameEntity.ALPHA] || 0.0;
			if (spec[com.svgaplayer.proto.FrameEntity.LAYOUT]) {
				this.layout.x = spec[com.svgaplayer.proto.FrameEntity.LAYOUT][com.svgaplayer.proto.Layout.X] || 0.0;
				this.layout.y = spec[com.svgaplayer.proto.FrameEntity.LAYOUT][com.svgaplayer.proto.Layout.Y] || 0.0;
				this.layout.width = spec[com.svgaplayer.proto.FrameEntity.LAYOUT][com.svgaplayer.proto.Layout.WIDTH] || 0.0;
				this.layout.height = spec[com.svgaplayer.proto.FrameEntity.LAYOUT][com.svgaplayer.proto.Layout.HEIGHT] || 0.0;
			}
			if (spec[com.svgaplayer.proto.FrameEntity.TRANSFORM]) {
				this.transform.a = spec[com.svgaplayer.proto.FrameEntity.TRANSFORM][com.svgaplayer.proto.Transform.A] || 1.0;
				this.transform.b = spec[com.svgaplayer.proto.FrameEntity.TRANSFORM][com.svgaplayer.proto.Transform.B] || 0.0;
				this.transform.c = spec[com.svgaplayer.proto.FrameEntity.TRANSFORM][com.svgaplayer.proto.Transform.C] || 0.0;
				this.transform.d = spec[com.svgaplayer.proto.FrameEntity.TRANSFORM][com.svgaplayer.proto.Transform.D] || 1.0;
				this.transform.tx = spec[com.svgaplayer.proto.FrameEntity.TRANSFORM][com.svgaplayer.proto.Transform.TX] || 0.0;
				this.transform.ty = spec[com.svgaplayer.proto.FrameEntity.TRANSFORM][com.svgaplayer.proto.Transform.TY] || 0.0;
			}
			if (spec[com.svgaplayer.proto.FrameEntity.CLIPPATH]) {
				this.maskPath = new BezierPath(spec[com.svgaplayer.proto.FrameEntity.CLIPPATH]);
			}
		}

		public function createMaskSprite() {
			this.maskSprite = new Sprite();
			this.maskSprite.graphics.beginFill(0xffffff);
			this.maskPath.drawPath(this.maskSprite.graphics);
			this.maskSprite.graphics.endFill();
		}

	}
	
}
