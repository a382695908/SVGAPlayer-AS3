package com.svgaplayer {
	import com.svgaplayer.proto.FrameEntity;
	import com.svgaplayer.proto.Layout;
	import com.svgaplayer.proto.Transform;
	import com.svgaplayer.Transform;
	import com.svgaplayer.BezierPath;
	import flash.display.Sprite;
	import com.svgaplayer.proto.ShapeEntity;
	import com.svgaplayer.proto.ShapeEntity.ShapeType;
	import com.svgaplayer.proto.ShapeEntity.ShapeArgs;
	
	public class FrameEntity {

		public var alpha: Number = 0.0;
		public var transform: com.svgaplayer.Transform = new com.svgaplayer.Transform(1.0, 0.0, 0.0, 1.0, 0.0, 0.0);
		public var layout: Rect = new Rect(0, 0, 0, 0);
		public var maskPath: com.svgaplayer.BezierPath = null;
		public var maskSprite: flash.display.Shape = null;
		public var shapes = [];
		
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
			if (spec[com.svgaplayer.proto.FrameEntity.SHAPES]) {
				var shapesData = spec[com.svgaplayer.proto.FrameEntity.SHAPES];
				for (var idx: * in shapesData) {
					var shapeData = shapesData[idx];
					var path: * = null;
					if (shapeData.type == com.svgaplayer.proto.ShapeEntity.ShapeType.SHAPE && shapeData.shape.hasD) {
						path = new BezierPath(shapeData.shape.d);
					}
					else if (shapeData.type == com.svgaplayer.proto.ShapeEntity.ShapeType.ELLIPSE && shapeData.hasEllipse) {
						path = new EllipsePath(shapeData.ellipse.x || 0.0, shapeData.ellipse.y || 0.0, shapeData.ellipse.radiusX || 0.0, shapeData.ellipse.radiusY || 0.0);
					}
					else if (shapeData.type == com.svgaplayer.proto.ShapeEntity.ShapeType.RECT && shapeData.hasRect) {
						path = new RectPath(shapeData.rect.x || 0.0, shapeData.rect.y || 0.0, shapeData.rect.width || 0.0, shapeData.rect.height || 0.0, shapeData.rect.cornerRadius || 0.0);
					}
					else if (shapeData.type == com.svgaplayer.proto.ShapeEntity.ShapeType.KEEP) {
						this.shapes = FrameEntity.lastShapes;
					}
					if (path != null) {
						if (shapeData.transform) {
							path.transform = new com.svgaplayer.Transform(
								shapeData.transform.a || 1.0, shapeData.transform.b || 0.0, shapeData.transform.c || 0.0, shapeData.transform.d || 1.0, shapeData.transform.tx || 0.0, shapeData.transform.ty || 0.0
							);
						}
						if (shapeData.styles) {
							path.styles = shapeData.styles;
						}
						this.shapes.push(path);
					}
				}
				FrameEntity.lastShapes = this.shapes;
			}
		}

		public function createMaskSprite() {
			this.maskSprite = new flash.display.Shape();
			this.maskSprite.graphics.beginFill(0xffffff);
			this.maskPath.drawPath(this.maskSprite.graphics);
			this.maskSprite.graphics.endFill();
		}
		
		static private var lastShapes = [];
		
		

	}
	
}
