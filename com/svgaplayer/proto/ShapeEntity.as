package com.svgaplayer.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.svgaplayer.proto.ShapeEntity.EllipseArgs;
	import com.svgaplayer.proto.ShapeEntity.RectArgs;
	import com.svgaplayer.proto.ShapeEntity.ShapeStyle;
	import com.svgaplayer.proto.ShapeEntity.ShapeArgs;
	import com.svgaplayer.proto.Transform;
	import com.svgaplayer.proto.ShapeEntity.ShapeType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ShapeEntity extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("com.svgaplayer.proto.ShapeEntity.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT, com.svgaplayer.proto.ShapeEntity.ShapeType);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const SHAPE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.ShapeEntity.shape", "shape", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.ShapeEntity.ShapeArgs; });

		private var shape$field:com.svgaplayer.proto.ShapeEntity.ShapeArgs;

		public function clearShape():void {
			shape$field = null;
		}

		public function get hasShape():Boolean {
			return shape$field != null;
		}

		public function set shape(value:com.svgaplayer.proto.ShapeEntity.ShapeArgs):void {
			shape$field = value;
		}

		public function get shape():com.svgaplayer.proto.ShapeEntity.ShapeArgs {
			return shape$field;
		}

		/**
		 *  @private
		 */
		public static const RECT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.ShapeEntity.rect", "rect", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.ShapeEntity.RectArgs; });

		private var rect$field:com.svgaplayer.proto.ShapeEntity.RectArgs;

		public function clearRect():void {
			rect$field = null;
		}

		public function get hasRect():Boolean {
			return rect$field != null;
		}

		public function set rect(value:com.svgaplayer.proto.ShapeEntity.RectArgs):void {
			rect$field = value;
		}

		public function get rect():com.svgaplayer.proto.ShapeEntity.RectArgs {
			return rect$field;
		}

		/**
		 *  @private
		 */
		public static const ELLIPSE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.ShapeEntity.ellipse", "ellipse", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.ShapeEntity.EllipseArgs; });

		private var ellipse$field:com.svgaplayer.proto.ShapeEntity.EllipseArgs;

		public function clearEllipse():void {
			ellipse$field = null;
		}

		public function get hasEllipse():Boolean {
			return ellipse$field != null;
		}

		public function set ellipse(value:com.svgaplayer.proto.ShapeEntity.EllipseArgs):void {
			ellipse$field = value;
		}

		public function get ellipse():com.svgaplayer.proto.ShapeEntity.EllipseArgs {
			return ellipse$field;
		}

		/**
		 *  @private
		 */
		public static const STYLES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.ShapeEntity.styles", "styles", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.ShapeEntity.ShapeStyle; });

		private var styles$field:com.svgaplayer.proto.ShapeEntity.ShapeStyle;

		public function clearStyles():void {
			styles$field = null;
		}

		public function get hasStyles():Boolean {
			return styles$field != null;
		}

		public function set styles(value:com.svgaplayer.proto.ShapeEntity.ShapeStyle):void {
			styles$field = value;
		}

		public function get styles():com.svgaplayer.proto.ShapeEntity.ShapeStyle {
			return styles$field;
		}

		/**
		 *  @private
		 */
		public static const TRANSFORM:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.ShapeEntity.transform", "transform", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.Transform; });

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, type$field);
			}
			if (hasShape) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, shape$field);
			}
			if (hasRect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, rect$field);
			}
			if (hasEllipse) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, ellipse$field);
			}
			if (hasStyles) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, styles$field);
			}
			if (hasTransform) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, transform$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var shape$count:uint = 0;
			var rect$count:uint = 0;
			var ellipse$count:uint = 0;
			var styles$count:uint = 0;
			var transform$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeEntity.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (shape$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeEntity.shape cannot be set twice.');
					}
					++shape$count;
					this.shape = new com.svgaplayer.proto.ShapeEntity.ShapeArgs();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.shape);
					break;
				case 3:
					if (rect$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeEntity.rect cannot be set twice.');
					}
					++rect$count;
					this.rect = new com.svgaplayer.proto.ShapeEntity.RectArgs();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.rect);
					break;
				case 4:
					if (ellipse$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeEntity.ellipse cannot be set twice.');
					}
					++ellipse$count;
					this.ellipse = new com.svgaplayer.proto.ShapeEntity.EllipseArgs();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.ellipse);
					break;
				case 10:
					if (styles$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeEntity.styles cannot be set twice.');
					}
					++styles$count;
					this.styles = new com.svgaplayer.proto.ShapeEntity.ShapeStyle();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.styles);
					break;
				case 11:
					if (transform$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeEntity.transform cannot be set twice.');
					}
					++transform$count;
					this.transform = new com.svgaplayer.proto.Transform();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.transform);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
