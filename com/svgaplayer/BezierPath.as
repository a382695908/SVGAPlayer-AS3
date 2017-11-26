package com.svgaplayer {

    import flash.display.Graphics;
	
	public class BezierPath {
		
        private var d: String;

		public function BezierPath(d: String) {
            this.d = d;
		}

        public function drawPath(graphics: flash.display.Graphics) {
            var currentPoint = { x: 0, y: 0, x1: 0, y1: 0, x2: 0, y2: 0 }
			var d = this.d.replace(/([a-zA-Z])/g, '|||$1 ').replace(/,/g, ' ');
			var segments = d.split('|||');
			for (var idx: * in segments) {
				var segment = segments[idx];
				if (segment.length == 0) { return; }
				var firstLetter = segment.substr(0, 1);
				if ('MLHVCSQRZ'.indexOf(firstLetter) >= 0) {
					var args = segment.substr(1).replace(/^\s+|\s+$/g, '').split(" ");
					this.drawElement(graphics, currentPoint, firstLetter, args);
				}
			}
        }

        private function drawElement(ctx, currentPoint, method, args) {
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
					currentPoint.x = Number(args[0]);
					currentPoint.y = Number(args[1]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'l':
					currentPoint.x += Number(args[0]);
					currentPoint.y += Number(args[1]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'H':
					currentPoint.x = Number(args[0]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'h':
					currentPoint.x += Number(args[0]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'V':
					currentPoint.y = Number(args[0]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'v':
					currentPoint.y += Number(args[0]);
					ctx.lineTo(currentPoint.x, currentPoint.y);
					break;
				case 'C':
					currentPoint.x1 = Number(args[0]);
					currentPoint.y1 = Number(args[1]);
					currentPoint.x2 = Number(args[2]);
					currentPoint.y2 = Number(args[3]);
					currentPoint.x = Number(args[4]);
					currentPoint.y = Number(args[5]);
					ctx.cubicCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
					break;
				case 'c':
					currentPoint.x1 = currentPoint.x + Number(args[0]);
					currentPoint.y1 = currentPoint.y + Number(args[1]);
					currentPoint.x2 = currentPoint.x + Number(args[2]);
					currentPoint.y2 = currentPoint.y + Number(args[3]);
					currentPoint.x += Number(args[4]);
					currentPoint.y += Number(args[5]);
					ctx.cubicCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
					break;
				case 'S':
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
					currentPoint.x1 = Number(args[0]);
					currentPoint.y1 = Number(args[1]);
					currentPoint.x = Number(args[2]);
					currentPoint.y = Number(args[3]);
					ctx.curveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
					break;
				case 'q':
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
					ctx.closePath();
					break;
				default:
					break;
			}
		}

	}
	
}
