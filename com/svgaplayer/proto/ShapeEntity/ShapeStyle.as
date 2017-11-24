package com.svgaplayer.proto.ShapeEntity {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineJoin;
	import com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineCap;
	import com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ShapeStyle extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FILL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.ShapeEntity.ShapeStyle.fill", "fill", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor; });

		private var fill$field:com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor;

		public function clearFill():void {
			fill$field = null;
		}

		public function get hasFill():Boolean {
			return fill$field != null;
		}

		public function set fill(value:com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor):void {
			fill$field = value;
		}

		public function get fill():com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor {
			return fill$field;
		}

		/**
		 *  @private
		 */
		public static const STROKE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.svgaplayer.proto.ShapeEntity.ShapeStyle.stroke", "stroke", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor; });

		private var stroke$field:com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor;

		public function clearStroke():void {
			stroke$field = null;
		}

		public function get hasStroke():Boolean {
			return stroke$field != null;
		}

		public function set stroke(value:com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor):void {
			stroke$field = value;
		}

		public function get stroke():com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor {
			return stroke$field;
		}

		/**
		 *  @private
		 */
		public static const STROKEWIDTH:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.strokeWidth", "strokeWidth", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var strokeWidth$field:Number;

		private var hasField$0:uint = 0;

		public function clearStrokeWidth():void {
			hasField$0 &= 0xfffffffe;
			strokeWidth$field = new Number();
		}

		public function get hasStrokeWidth():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set strokeWidth(value:Number):void {
			hasField$0 |= 0x1;
			strokeWidth$field = value;
		}

		public function get strokeWidth():Number {
			return strokeWidth$field;
		}

		/**
		 *  @private
		 */
		public static const LINECAP:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("com.svgaplayer.proto.ShapeEntity.ShapeStyle.lineCap", "lineCap", (4 << 3) | com.netease.protobuf.WireType.VARINT, com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineCap);

		private var lineCap$field:int;

		public function clearLineCap():void {
			hasField$0 &= 0xfffffffd;
			lineCap$field = new int();
		}

		public function get hasLineCap():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set lineCap(value:int):void {
			hasField$0 |= 0x2;
			lineCap$field = value;
		}

		public function get lineCap():int {
			return lineCap$field;
		}

		/**
		 *  @private
		 */
		public static const LINEJOIN:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("com.svgaplayer.proto.ShapeEntity.ShapeStyle.lineJoin", "lineJoin", (5 << 3) | com.netease.protobuf.WireType.VARINT, com.svgaplayer.proto.ShapeEntity.ShapeStyle.LineJoin);

		private var lineJoin$field:int;

		public function clearLineJoin():void {
			hasField$0 &= 0xfffffffb;
			lineJoin$field = new int();
		}

		public function get hasLineJoin():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set lineJoin(value:int):void {
			hasField$0 |= 0x4;
			lineJoin$field = value;
		}

		public function get lineJoin():int {
			return lineJoin$field;
		}

		/**
		 *  @private
		 */
		public static const MITERLIMIT:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.miterLimit", "miterLimit", (6 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var miterLimit$field:Number;

		public function clearMiterLimit():void {
			hasField$0 &= 0xfffffff7;
			miterLimit$field = new Number();
		}

		public function get hasMiterLimit():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set miterLimit(value:Number):void {
			hasField$0 |= 0x8;
			miterLimit$field = value;
		}

		public function get miterLimit():Number {
			return miterLimit$field;
		}

		/**
		 *  @private
		 */
		public static const LINEDASHI:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.lineDashI", "lineDashI", (7 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var lineDashI$field:Number;

		public function clearLineDashI():void {
			hasField$0 &= 0xffffffef;
			lineDashI$field = new Number();
		}

		public function get hasLineDashI():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set lineDashI(value:Number):void {
			hasField$0 |= 0x10;
			lineDashI$field = value;
		}

		public function get lineDashI():Number {
			return lineDashI$field;
		}

		/**
		 *  @private
		 */
		public static const LINEDASHII:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.lineDashII", "lineDashII", (8 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var lineDashII$field:Number;

		public function clearLineDashII():void {
			hasField$0 &= 0xffffffdf;
			lineDashII$field = new Number();
		}

		public function get hasLineDashII():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set lineDashII(value:Number):void {
			hasField$0 |= 0x20;
			lineDashII$field = value;
		}

		public function get lineDashII():Number {
			return lineDashII$field;
		}

		/**
		 *  @private
		 */
		public static const LINEDASHIII:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.lineDashIII", "lineDashIII", (9 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var lineDashIII$field:Number;

		public function clearLineDashIII():void {
			hasField$0 &= 0xffffffbf;
			lineDashIII$field = new Number();
		}

		public function get hasLineDashIII():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set lineDashIII(value:Number):void {
			hasField$0 |= 0x40;
			lineDashIII$field = value;
		}

		public function get lineDashIII():Number {
			return lineDashIII$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFill) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, fill$field);
			}
			if (hasStroke) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, stroke$field);
			}
			if (hasStrokeWidth) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, strokeWidth$field);
			}
			if (hasLineCap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, lineCap$field);
			}
			if (hasLineJoin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, lineJoin$field);
			}
			if (hasMiterLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, miterLimit$field);
			}
			if (hasLineDashI) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, lineDashI$field);
			}
			if (hasLineDashII) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, lineDashII$field);
			}
			if (hasLineDashIII) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, lineDashIII$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var fill$count:uint = 0;
			var stroke$count:uint = 0;
			var strokeWidth$count:uint = 0;
			var lineCap$count:uint = 0;
			var lineJoin$count:uint = 0;
			var miterLimit$count:uint = 0;
			var lineDashI$count:uint = 0;
			var lineDashII$count:uint = 0;
			var lineDashIII$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (fill$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.fill cannot be set twice.');
					}
					++fill$count;
					this.fill = new com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.fill);
					break;
				case 2:
					if (stroke$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.stroke cannot be set twice.');
					}
					++stroke$count;
					this.stroke = new com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.stroke);
					break;
				case 3:
					if (strokeWidth$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.strokeWidth cannot be set twice.');
					}
					++strokeWidth$count;
					this.strokeWidth = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 4:
					if (lineCap$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.lineCap cannot be set twice.');
					}
					++lineCap$count;
					this.lineCap = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 5:
					if (lineJoin$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.lineJoin cannot be set twice.');
					}
					++lineJoin$count;
					this.lineJoin = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 6:
					if (miterLimit$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.miterLimit cannot be set twice.');
					}
					++miterLimit$count;
					this.miterLimit = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 7:
					if (lineDashI$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.lineDashI cannot be set twice.');
					}
					++lineDashI$count;
					this.lineDashI = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 8:
					if (lineDashII$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.lineDashII cannot be set twice.');
					}
					++lineDashII$count;
					this.lineDashII = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 9:
					if (lineDashIII$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeStyle.lineDashIII cannot be set twice.');
					}
					++lineDashIII$count;
					this.lineDashIII = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
