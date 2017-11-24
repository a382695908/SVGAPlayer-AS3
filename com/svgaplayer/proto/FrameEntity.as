package com.svgaplayer.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.svgaplayer.proto.ShapeEntity;
	import com.svgaplayer.proto.Layout;
	import com.svgaplayer.proto.Transform;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FrameEntity extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ALPHA:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.FrameEntity.alpha", "alpha", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var alpha$field:Number;

		private var hasField$0:uint = 0;

		public function clearAlpha():void {
			hasField$0 &= 0xfffffffe;
			alpha$field = new Number();
		}

		public function get hasAlpha():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set alpha(value:Number):void {
			hasField$0 |= 0x1;
			alpha$field = value;
		}

		public function get alpha():Number {
			return alpha$field;
		}

		/**
		 *  @private
		 */
		public static const LAYOUT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.FrameEntity.layout", "layout", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.Layout; });

		private var layout$field:com.svgaplayer.proto.Layout;

		public function clearLayout():void {
			layout$field = null;
		}

		public function get hasLayout():Boolean {
			return layout$field != null;
		}

		public function set layout(value:com.svgaplayer.proto.Layout):void {
			layout$field = value;
		}

		public function get layout():com.svgaplayer.proto.Layout {
			return layout$field;
		}

		/**
		 *  @private
		 */
		public static const TRANSFORM:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.FrameEntity.transform", "transform", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.Transform; });

		private var transform$field:com.svgaplayer.proto.Transform;

		public function clearTransform():void {
			transform$field = null;
		}

		public function get hasTransform():Boolean {
			return transform$field != null;
		}

		public function set transform(value:com.svgaplayer.proto.Transform):void {
			transform$field = value;
		}

		public function get transform():com.svgaplayer.proto.Transform {
			return transform$field;
		}

		/**
		 *  @private
		 */
		public static const CLIPPATH:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.svgaplayer.proto.FrameEntity.clipPath", "clipPath", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var clipPath$field:String;

		public function clearClipPath():void {
			clipPath$field = null;
		}

		public function get hasClipPath():Boolean {
			return clipPath$field != null;
		}

		public function set clipPath(value:String):void {
			clipPath$field = value;
		}

		public function get clipPath():String {
			return clipPath$field;
		}

		/**
		 *  @private
		 */
		public static const SHAPES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.FrameEntity.shapes", "shapes", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.ShapeEntity; });

		[ArrayElementType("com.svgaplayer.proto.ShapeEntity")]
		public var shapes:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAlpha) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, alpha$field);
			}
			if (hasLayout) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, layout$field);
			}
			if (hasTransform) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, transform$field);
			}
			if (hasClipPath) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, clipPath$field);
			}
			for (var shapes$index:uint = 0; shapes$index < this.shapes.length; ++shapes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.shapes[shapes$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var alpha$count:uint = 0;
			var layout$count:uint = 0;
			var transform$count:uint = 0;
			var clipPath$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (alpha$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrameEntity.alpha cannot be set twice.');
					}
					++alpha$count;
					this.alpha = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 2:
					if (layout$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrameEntity.layout cannot be set twice.');
					}
					++layout$count;
					this.layout = new com.svgaplayer.proto.Layout();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.layout);
					break;
				case 3:
					if (transform$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrameEntity.transform cannot be set twice.');
					}
					++transform$count;
					this.transform = new com.svgaplayer.proto.Transform();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.transform);
					break;
				case 4:
					if (clipPath$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrameEntity.clipPath cannot be set twice.');
					}
					++clipPath$count;
					this.clipPath = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					this.shapes.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new com.svgaplayer.proto.ShapeEntity()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
