package com.svgaplayer {
	import com.svgaplayer.proto.SpriteEntity;
	
	public class SpriteEntity {

		
		public var imageKey: String = ""
		
		public var frames = []
		
		public function SpriteEntity(spec: com.svgaplayer.proto.SpriteEntity) {
			this.imageKey = spec[com.svgaplayer.proto.SpriteEntity.IMAGEKEY];
			var framesData = spec[com.svgaplayer.proto.SpriteEntity.FRAMES];
			for (var idx: * in framesData) {
				this.frames.push(new FrameEntity(framesData[idx]))
			}
		}

	}
	
}
