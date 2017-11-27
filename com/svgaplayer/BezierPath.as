package com.svgaplayer {

    import flash.display.Graphics;
	import flash.display.JointStyle;
	import com.svgaplayer.proto.ShapeEntity;
	import com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineCap;
	import com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineJoin;
	
	public class BezierPath {
		
		private static var validMethods = 'MLHVCSQRZmlhvcsqrz';
        private var d: String;
		
		public var transform: Transform = null;
		public var styles: Object = new Object();

		public function BezierPath(d: String) {
            this.d = d.replace(/([a-zA-Z])/g, '|||$1 ').replace(/,/g, ' ');
		}
		
		public function makeStyle(graphics: flash.display.Graphics) {
			if (this.styles) {
				if (this.styles.stroke) {
					graphics.lineStyle(this.styles.strokeWidth || 0.0, (this.styles.stroke.r * 255) << 16 | (this.styles.stroke.g * 255) << 8 | (this.styles.stroke.b * 255), this.styles.stroke.a || 1.0, false, "NORMAL", this.cap(), this.join(), this.styles.miterLimit || 10.0);
				}
				else {
					graphics.lineStyle(0, 0, 0);
				}
				if (this.styles.fill) {
					graphics.beginFill((this.styles.fill.r * 255) << 16 | (this.styles.fill.g * 255) << 8 | (this.styles.fill.b * 255), this.styles.fill.a || 1.0);
				}
				else {
					graphics.beginFill(0, 0);
				}
			}
			else {
				graphics.lineStyle(0, 0, 0);
				graphics.beginFill(0, 0.0);
			}
		}
		
		private function cap() {
			if (!this.styles.hasLineCap) {
				return null;
			}
			if (this.styles.lineCap == com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineCap.LineCap_BUTT) {
				return "butt";
			}
			else if (this.styles.lineCap == com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineCap.LineCap_ROUND) {
				return "round";
			}
			else if (this.styles.lineCap == com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineCap.LineCap_SQUARE) {
				return "square";
			}
			return null;
		}
		
		private function join() {
			if (!this.styles.hasLineJoin) {
				//return null;
			}
			if (this.styles.lineJoin == com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineJoin.LineJoin_BEVEL) {
				return "bevel";
			}
			else if (this.styles.lineJoin == com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineJoin.LineJoin_MITER) {
				return null;
			}
			else if (this.styles.lineJoin == com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineJoin.LineJoin_ROUND) {
				return "round";
			}
			return null;
		}

        public function drawPath(graphics: flash.display.Graphics) {
            var currentPoint = { x: 0, y: 0, x1: 0, y1: 0, x2: 0, y2: 0 };
			var startPoint = {x: undefined, y: undefined};
			var segments = this.d.split('|||');
			for (var idx: * in segments) {
				var segment = segments[idx];
				if (segment.length == 0) { continue; }
				var firstLetter = segment.substr(0, 1);
				if (BezierPath.validMethods.indexOf(firstLetter) >= 0) {
					var args = segment.substr(1).replace(/^\s+|\s+$/g, '').split(" ");
					this.drawElement(graphics, startPoint, currentPoint, firstLetter, args);
				}
			}
        }

        private function drawElement(ctx, startPoint, currentPoint, method, args) {
			switch (method) {
				case 'M':
					currentPoint.x = Number(args[0]);
					currentPoint.y = Number(args[1]);
					ctx.moveTo(currentPoint.x, currentPoint.y);
					break;
				case 'm':
					currentPoint.x += Number(args[0]);
					currentPoint.y += Number(args[1]);
					ctx.moveTo(currentPoint.x, currentPoint.y);
					break;
				case 'L':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.x = Number(args[0]);
					currentPoint.y = Number(args[1]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'l':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.x += Number(args[0]);
					currentPoint.y += Number(args[1]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'H':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.x = Number(args[0]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'h':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.x += Number(args[0]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'V':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.y = Number(args[0]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'v':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.y += Number(args[0]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'C':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.x1 = Number(args[0]);
					currentPoint.y1 = Number(args[1]);
					currentPoint.x2 = Number(args[2]);
					currentPoint.y2 = Number(args[3]);
					currentPoint.x = Number(args[4]);
					currentPoint.y = Number(args[5]);
					ctx.cubicCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
					break;
				case 'c':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.x1 = currentPoint.x + Number(args[0]);
					currentPoint.y1 = currentPoint.y + Number(args[1]);
					currentPoint.x2 = currentPoint.x + Number(args[2]);
					currentPoint.y2 = currentPoint.y + Number(args[3]);
					currentPoint.x += Number(args[4]);
					currentPoint.y += Number(args[5]);
					ctx.cubicCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
					break;
				case 'S':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					if (currentPoint.x1 && currentPoint.y1 && currentPoint.x2 && currentPoint.y2) {
						currentPoint.x1 = currentPoint.x - currentPoint.x2 + currentPoint.x;
						currentPoint.y1 = currentPoint.y - currentPoint.y2 + currentPoint.y;
						currentPoint.x2 = Number(args[0]);
						currentPoint.y2 = Number(args[1]);
						currentPoint.x = Number(args[2]);
						currentPoint.y = Number(args[3]);
						ctx.cubicCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
					} else {
						currentPoint.x1 = Number(args[0]);
						currentPoint.y1 = Number(args[1]);
						currentPoint.x = Number(args[2]);
						currentPoint.y = Number(args[3]);
						ctx.curveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
					}
					break;
				case 's':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					if (currentPoint.x1 && currentPoint.y1 && currentPoint.x2 && currentPoint.y2) {
						currentPoint.x1 = currentPoint.x - currentPoint.x2 + currentPoint.x;
						currentPoint.y1 = currentPoint.y - currentPoint.y2 + currentPoint.y;
						currentPoint.x2 = currentPoint.x + Number(args[0]);
						currentPoint.y2 = currentPoint.y + Number(args[1]);
						currentPoint.x += Number(args[2]);
						currentPoint.y += Number(args[3]);
						ctx.cubicCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
					} else {
						currentPoint.x1 = currentPoint.x + Number(args[0]);
						currentPoint.y1 = currentPoint.y + Number(args[1]);
						currentPoint.x += Number(args[2]);
						currentPoint.y += Number(args[3]);
						ctx.curveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
					}
					break;
				case 'Q':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.x1 = Number(args[0]);
					currentPoint.y1 = Number(args[1]);
					currentPoint.x = Number(args[2]);
					currentPoint.y = Number(args[3]);
					ctx.curveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
					break;
				case 'q':
					if (startPoint.x === undefined && startPoint.y === undefined) {
						startPoint.x = currentPoint.x;
						startPoint.y = currentPoint.y;
					}
					currentPoint.x1 = currentPoint.x + Number(args[0]);
					currentPoint.y1 = currentPoint.y + Number(args[1]);
					currentPoint.x += Number(args[2]);
					currentPoint.y += Number(args[3]);
					ctx.curveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
					break;
				case 'A':
					break;
				case 'a':
					break;
				case 'Z':
				case 'z':
					if (startPoint.x !== undefined && startPoint.y !== undefined) {
						ctx.lineTo(startPoint.x, startPoint.y);
					}
					break;
				default:
					break;
			}
		}

	}
	
}
