package com.svgaplayer.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.svgaplayer.proto.MovieParams;
	import com.svgaplayer.proto.MovieEntity.ImagesEntry;
	import com.svgaplayer.proto.SpriteEntity;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MovieEntity extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VERSION:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.svgaplayer.proto.MovieEntity.version", "version", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var version$field:String;

		public function clearVersion():void {
			version$field = null;
		}

		public function get hasVersion():Boolean {
			return version$field != null;
		}

		public function set version(value:String):void {
			version$field = value;
		}

		public function get version():String {
			return version$field;
		}

		/**
		 *  @private
		 */
		public static const PARAMS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.MovieEntity.params", "params", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.MovieParams; });

		private var params$field:com.svgaplayer.proto.MovieParams;

		public function clearParams():void {
			params$field = null;
		}

		public function get hasParams():Boolean {
			return params$field != null;
		}

		public function set params(value:com.svgaplayer.proto.MovieParams):void {
			params$field = value;
		}

		public function get params():com.svgaplayer.proto.MovieParams {
			return params$field;
		}

		/**
		 *  @private
		 */
		public static const IMAGES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.MovieEntity.images", "images", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.MovieEntity.ImagesEntry; });

		[ArrayElementType("com.svgaplayer.proto.MovieEntity.ImagesEntry")]
		public var images:Array = [];

		/**
		 *  @private
		 */
		public static const SPRITES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.MovieEntity.sprites", "sprites", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.SpriteEntity; });

		[ArrayElementType("com.svgaplayer.proto.SpriteEntity")]
		public var sprites:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, version$field);
			}
			if (hasParams) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, params$field);
			}
			for (var images$index:uint = 0; images$index < this.images.length; ++images$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.images[images$index]);
			}
			for (var sprites$index:uint = 0; sprites$index < this.sprites.length; ++sprites$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.sprites[sprites$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var version$count:uint = 0;
			var params$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (version$count != 0) {
						throw new flash.errors.IOError('Bad data format: MovieEntity.version cannot be set twice.');
					}
					++version$count;
					this.version = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (params$count != 0) {
						throw new flash.errors.IOError('Bad data format: MovieEntity.params cannot be set twice.');
					}
					++params$count;
					this.params = new com.svgaplayer.proto.MovieParams();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.params);
					break;
				case 3:
					this.images.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new com.svgaplayer.proto.MovieEntity.ImagesEntry()));
					break;
				case 4:
					this.sprites.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new com.svgaplayer.proto.SpriteEntity()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
