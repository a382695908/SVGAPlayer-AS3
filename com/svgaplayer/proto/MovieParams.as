package com.svgaplayer.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MovieParams extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VIEWBOXWIDTH:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.MovieParams.viewBoxWidth", "viewBoxWidth", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var viewBoxWidth$field:Number;

		private var hasField$0:uint = 0;

		public function clearViewBoxWidth():void {
			hasField$0 &= 0xfffffffe;
			viewBoxWidth$field = new Number();
		}

		public function get hasViewBoxWidth():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set viewBoxWidth(value:Number):void {
			hasField$0 |= 0x1;
			viewBoxWidth$field = value;
		}

		public function get viewBoxWidth():Number {
			return viewBoxWidth$field;
		}

		/**
		 *  @private
		 */
		public static const VIEWBOXHEIGHT:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.MovieParams.viewBoxHeight", "viewBoxHeight", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var viewBoxHeight$field:Number;

		public function clearViewBoxHeight():void {
			hasField$0 &= 0xfffffffd;
			viewBoxHeight$field = new Number();
		}

		public function get hasViewBoxHeight():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set viewBoxHeight(value:Number):void {
			hasField$0 |= 0x2;
			viewBoxHeight$field = value;
		}

		public function get viewBoxHeight():Number {
			return viewBoxHeight$field;
		}

		/**
		 *  @private
		 */
		public static const FPS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("com.svgaplayer.proto.MovieParams.fps", "fps", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fps$field:int;

		public function clearFps():void {
			hasField$0 &= 0xfffffffb;
			fps$field = new int();
		}

		public function get hasFps():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set fps(value:int):void {
			hasField$0 |= 0x4;
			fps$field = value;
		}

		public function get fps():int {
			return fps$field;
		}

		/**
		 *  @private
		 */
		public static const FRAMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("com.svgaplayer.proto.MovieParams.frames", "frames", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var frames$field:int;

		public function clearFrames():void {
			hasField$0 &= 0xfffffff7;
			frames$field = new int();
		}

		public function get hasFrames():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set frames(value:int):void {
			hasField$0 |= 0x8;
			frames$field = value;
		}

		public function get frames():int {
			return frames$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasViewBoxWidth) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, viewBoxWidth$field);
			}
			if (hasViewBoxHeight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, viewBoxHeight$field);
			}
			if (hasFps) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fps$field);
			}
			if (hasFrames) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, frames$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var viewBoxWidth$count:uint = 0;
			var viewBoxHeight$count:uint = 0;
			var fps$count:uint = 0;
			var frames$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (viewBoxWidth$count != 0) {
						throw new flash.errors.IOError('Bad data format: MovieParams.viewBoxWidth cannot be set twice.');
					}
					++viewBoxWidth$count;
					this.viewBoxWidth = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 2:
					if (viewBoxHeight$count != 0) {
						throw new flash.errors.IOError('Bad data format: MovieParams.viewBoxHeight cannot be set twice.');
					}
					++viewBoxHeight$count;
					this.viewBoxHeight = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 3:
					if (fps$count != 0) {
						throw new flash.errors.IOError('Bad data format: MovieParams.fps cannot be set twice.');
					}
					++fps$count;
					this.fps = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (frames$count != 0) {
						throw new flash.errors.IOError('Bad data format: MovieParams.frames cannot be set twice.');
					}
					++frames$count;
					this.frames = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
