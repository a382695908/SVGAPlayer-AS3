package com.svgaplayer.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.svgaplayer.proto.FrameEntity;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpriteEntity extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IMAGEKEY:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.svgaplayer.proto.SpriteEntity.imageKey", "imageKey", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var imageKey$field:String;

		public function clearImageKey():void {
			imageKey$field = null;
		}

		public function get hasImageKey():Boolean {
			return imageKey$field != null;
		}

		public function set imageKey(value:String):void {
			imageKey$field = value;
		}

		public function get imageKey():String {
			return imageKey$field;
		}

		/**
		 *  @private
		 */
		public static const FRAMES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.SpriteEntity.frames", "frames", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.FrameEntity; });

		[ArrayElementType("com.svgaplayer.proto.FrameEntity")]
		public var frames:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasImageKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, imageKey$field);
			}
			for (var frames$index:uint = 0; frames$index < this.frames.length; ++frames$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.frames[frames$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var imageKey$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (imageKey$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpriteEntity.imageKey cannot be set twice.');
					}
					++imageKey$count;
					this.imageKey = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					this.frames.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new com.svgaplayer.proto.FrameEntity()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
