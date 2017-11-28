package com.svgaplayer {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.*
	import flash.display.Graphics;
	import com.svgaplayer.FrameEntity
	import com.svgaplayer.SpriteEntity

	import flash.geom.Matrix;
	import flash.sampler.Sample;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Loader;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLLoaderDataFormat;
	import flash.display.BitmapData;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class Player {

		public var loops = 0;
		public var clearsAfterStop = true;
		
		public function Player(displayObject: MovieClip) {
			this.displayObject = displayObject;
		}
		
		public function setVideoItem(videoItem: VideoEntity) {
			this.currentFrame = 0;
			this.videoItem = videoItem;
			this.clear();
			this.draw();
		}
		
		public function setFrame(x: Number, y: Number, width: Number, height: Number) {
			this.frame = new Rect(x, y, width, height);
			this.update();
		}
		
		public function setContentMode(mode: String) {
			this.contentMode = mode;
			this.update();
		}
		
		public function setClipsToBounds(clipsToBounds) {
			this.clipsToBounds = clipsToBounds;
			if (this.rootLayer) {
				if (this.rootLayer.mask != null) {
					this.rootLayer.removeChild(this.rootLayer.mask)
				}
				if (this.clipsToBounds) {
					var clipMask: Shape = new Shape();
					clipMask.graphics.beginFill(0xffffff);
					clipMask.graphics.drawRect(0, 0, this.videoItem.videoSize.width, this.videoItem.videoSize.height);
					clipMask.graphics.endFill();
					this.rootLayer.mask = clipMask;
					this.rootLayer.addChild(clipMask);
				}
				else {
					this.rootLayer.mask = null;
				}
			}
		}
		
		public function startAnimation() {
			this.rootLayer.visible = true;
			this.stopAnimation(false);
			this.setupTicker();
		}
		
		public function pauseAnimation() {
			this.stopAnimation(false);
		}
		
		public function stopAnimation(clear: Boolean) {
			this.destoryTicker();
			if (clear) {
				this.clear();
			}
		}
		
		public function clear() {
			if (this.rootLayer) {
				this.rootLayer.visible = false;
			}
		}
		
		public function stepToFrame(frame: Number, andPlay: Boolean) {
			if (frame >= this.videoItem.frames || frame < 0) {
				return;
			}
			this.rootLayer.visible = true;
			this.pauseAnimation();
			this.currentFrame = frame;
			this.update();
			if (andPlay) {
				this.setupTicker();
			}
		}
		
		public function stepToPercentage(percentage: Number, andPlay: Boolean) {
			var frame = Math.floor(percentage * this.videoItem.frames);
			if (frame >= this.videoItem.frames && frame > 0) {
				frame = this.videoItem.frames - 1;
			}
			this.stepToFrame(frame, andPlay);
		}
		
		public function setImage(urlORBase64: String, forKey: String) {
			var self = this;
			var request = new URLRequest(urlORBase64);
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			loader.addEventListener(Event.COMPLETE, function() {
				var imgLoader = new Loader();
				imgLoader.contentLoaderInfo.addEventListener(Event.INIT, function():void {
					var bitmapData = new BitmapData(imgLoader.content.width, imgLoader.content.height, true, 0x00000000);
					bitmapData.draw(imgLoader);
					self.dynamicImages[forKey] = bitmapData;
					if (self.rootLayer != null && self.rootLayer != undefined) {
						for (var idx:* in self.videoItem.sprites) {
							var spriteItem: com.svgaplayer.SpriteEntity = self.videoItem.sprites[idx];
							if (spriteItem.imageKey === forKey) {
								var container: * = self.rootLayer.getChildAt(idx);
								var bitmapLayer: * = container.getChildAt(0);
								bitmapLayer.graphics.clear();
								bitmapLayer.graphics.beginBitmapFill(bitmapData, null, false, true);
								bitmapLayer.graphics.drawRect(0, 0, bitmapData.width, bitmapData.height);
								bitmapLayer.graphics.endFill();
							}
						}
					}
				});
				imgLoader.loadBytes(loader.data)
			})
			loader.load(request);
		}
		
		public function setText(textORMap: *, forKey: String) {
			var textObject: TextField = new TextField();
			if (textORMap is Object) {
				textObject.text = textORMap.text;
				var textFormat: TextFormat = new TextFormat();
				textFormat.size = parseInt(textORMap.size.replace("px", ""));
				textFormat.color = parseInt(textORMap.color.replace("#", "0x"));
				textFormat.align = "center";
				textObject.setTextFormat(textFormat);
			}
			this.dynamicTexts[forKey] = textObject;
		}
		
		public function clearDynamicObjects() {
			this.dynamicImages = [];
			this.dynamicTexts = [];
			this.draw();
		}
		
		public function onFinished(callback: Function) {
			this._onFinished = callback;
		}
		
		public function onFrame(callback: Function) {
			this._onFrame = callback;
		}
		
		public function onPercentage(callback: Function) {
			this._onPercentage = callback;
		}
		
		private var displayObject: MovieClip
		private var currentFrame = 0;
		private var currentTick = 0;
		private var videoItem: VideoEntity = null;
		private var loopCount = 0;
		private var rootLayer: Sprite = null;
		private var nextTickTime = 0;
		private var contentMode = "AspectFit"
		private var frame: Rect = new Rect(0, 0, 0, 0);
		private var clipsToBounds = false;
		private var dynamicImages: Object = new Object();
		private var dynamicTexts: Object = new Object();
		private var _onFinished: Function = null;
		private var _onFrame: Function = null;
		private var _onPercentage: Function = null;
		
		private function setupTicker() {
			this.displayObject.addEventListener(Event.ENTER_FRAME, this.onTick);
		}
		
		private function destoryTicker() {
			this.displayObject.removeEventListener(Event.ENTER_FRAME, this.onTick);
		}
		
		private function onTick(sender: *) {
			if (this.videoItem == null) { return; }
			var now = new Date().time;
			if (now < this.nextTickTime) {
				return;
			}
			this.nextTickTime = (1000 / this.videoItem.FPS) + now - (60 / this.videoItem.FPS) * 2
			this.currentFrame++;
			if (this.currentFrame >= this.videoItem.frames) {
				this.currentFrame = 0;
				this.loopCount++;
				if (this.loops > 0 && this.loopCount >= this.loops) {
					this.stopAnimation(this.clearsAfterStop);
					if (this._onFinished != null) {
						this._onFinished();
					}
					return;
				}
			}
			this.update()
			if (this._onFrame != null) {
				this._onFrame(this.currentFrame);
			}
			if (this._onPercentage != null) {
				this._onPercentage((this.currentFrame + 1) / this.videoItem.frames);
			}
		}
		
		private function draw() {
			if (this.rootLayer !== null) {
				this.displayObject.removeChild(this.rootLayer);
			}
			this.rootLayer = new Sprite()
			for (var idx:* in this.videoItem.sprites) {
				var spriteItem: com.svgaplayer.SpriteEntity = this.videoItem.sprites[idx];
				var container: Sprite = new Sprite();
				var bitmapLayer: Sprite = new Sprite();
				var bitmapData = this.dynamicImages[spriteItem.imageKey] || this.videoItem.images[spriteItem.imageKey];
				if (bitmapData != null && bitmapData != undefined) {
					bitmapLayer.graphics.beginBitmapFill(bitmapData, null, false, true);
					bitmapLayer.graphics.drawRect(0, 0, bitmapData.width, bitmapData.height);
					bitmapLayer.graphics.endFill();
				}
				container.addChild(bitmapLayer);
				container.addChild(new Sprite());
				this.rootLayer.addChild(container);
			}
			this.rootLayer.width = this.videoItem.videoSize.width;
			this.rootLayer.height = this.videoItem.videoSize.height;
			this.rootLayer.transform.matrix = new Matrix(1.0, 0.0, 0.0, 1.0, 0.0, 0.0)
			this.setClipsToBounds(this.clipsToBounds);
			this.displayObject.addChild(this.rootLayer);
			this.update();
		}
		
		private function resize() {
			var scaleX = 1.0; var scaleY = 1.0; var translateX = 0.0; var translateY = 0.0;
			var targetSize = this.frame;
			var imageSize = this.videoItem.videoSize;
			if (this.contentMode === "Fill") {
				scaleX = targetSize.width / imageSize.width;
				scaleY = targetSize.height / imageSize.height;
			}
			else if (this.contentMode === "AspectFit" || this.contentMode === "AspectFill") {
				var imageRatio = imageSize.width / imageSize.height;
				var viewRatio = targetSize.width / targetSize.height;
				if ((imageRatio >= viewRatio && this.contentMode === "AspectFit") || (imageRatio <= viewRatio && this.contentMode === "AspectFill")) {
					scaleX = scaleY = targetSize.width / imageSize.width;
					translateY = (targetSize.height - imageSize.height * scaleY) / 2.0
				}
				else if ((imageRatio < viewRatio && this.contentMode === "AspectFit") || (imageRatio > viewRatio && this.contentMode === "AspectFill")) {
					scaleX = scaleY = targetSize.height / imageSize.height;
					translateX = (targetSize.width - imageSize.width * scaleX) / 2.0
				}
			}
			this.displayObject.transform.matrix = new Matrix(1.0, 0, 0, 1.0, this.frame.x, this.frame.y);
			this.rootLayer.transform.matrix = new Matrix(scaleX, 0, 0, scaleY, translateX, translateY);
		}
		
		private function update() {
			if (this.videoItem == null){ return; }
			this.resize();
			for (var idx:* in this.videoItem.sprites) {
				var spriteItem: com.svgaplayer.SpriteEntity = this.videoItem.sprites[idx];
				var childSprite: * = this.rootLayer.getChildAt(idx)
				if (this.currentFrame < spriteItem.frames.length) {
					var frameItem: com.svgaplayer.FrameEntity = spriteItem.frames[this.currentFrame];
					childSprite.alpha = frameItem.alpha;
					var bitmapLayer: * = childSprite.getChildAt(0);
					if (this.dynamicImages[spriteItem.imageKey]) {
						var bitmapData = this.dynamicImages[spriteItem.imageKey];
						bitmapLayer.transform.matrix = new Matrix(frameItem.layout.width / bitmapData.width, 0.0, 0.0, frameItem.layout.height / bitmapData.height, 0.0, 0.0);
					}
					else {
						bitmapLayer.transform.matrix = null;
					}
					if (frameItem.shapes.length > 0) {
						var vectorLayer: * = childSprite.getChildAt(1);
						while (vectorLayer.numChildren > 0) {
							vectorLayer.removeChild(vectorLayer.getChildAt(0));
						}
						for (var vdx: * in frameItem.shapes) {
							var shapeLayer = new Shape();
							frameItem.shapes[vdx].makeStyle(shapeLayer.graphics);
							frameItem.shapes[vdx].drawPath(shapeLayer.graphics);
							shapeLayer.graphics.endFill();
							if (frameItem.shapes[vdx].transform) {
								var t = frameItem.shapes[vdx].transform;
								shapeLayer.transform.matrix = new Matrix(t.a, t.b, t.c, t.d, t.tx, t.ty);
							}
							vectorLayer.addChild(shapeLayer);
						}
					}
					if (this.dynamicTexts[spriteItem.imageKey]) {
						var textObject = this.dynamicTexts[spriteItem.imageKey];
						textObject.width = frameItem.layout.width;
						var textMetrics = textObject.getLineMetrics(0);
						textObject.transform.matrix = new Matrix(1.0, 0.0, 0.0, 1.0, 0.0, (frameItem.layout.height - textMetrics.ascent - textMetrics.descent) / 2);
						if (childSprite.numChildren < 3) {
							childSprite.addChild(textObject);
						}
						else {
							childSprite.removeChild(childSprite.getChildAt(2));
							childSprite.addChild(textObject);
						}
					}
					childSprite.transform.matrix = new Matrix(frameItem.transform.a, frameItem.transform.b, frameItem.transform.c, frameItem.transform.d, frameItem.transform.tx, frameItem.transform.ty);
					if (frameItem.maskPath !== null && frameItem.maskSprite === null) {
						frameItem.createMaskSprite();
					}
					if (frameItem.maskSprite != null) {
						this.displayObject.addChild(frameItem.maskSprite);
						frameItem.maskSprite.transform.matrix = new Matrix(frameItem.transform.a * this.rootLayer.transform.matrix.a, frameItem.transform.b, frameItem.transform.c, frameItem.transform.d * this.rootLayer.transform.matrix.d, (frameItem.transform.tx + this.rootLayer.transform.matrix.tx) * this.rootLayer.transform.matrix.a + this.displayObject.transform.matrix.tx, (frameItem.transform.ty + this.rootLayer.transform.matrix.ty) * this.rootLayer.transform.matrix.d + this.displayObject.transform.matrix.ty);
						childSprite.mask = frameItem.maskSprite;
						this.displayObject.removeChild(frameItem.maskSprite);
					}
					else {
						childSprite.mask = null;
					}
				}
			}
		}
		

	}
	
}
