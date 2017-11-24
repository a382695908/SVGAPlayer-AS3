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
	public dynamic final class Transform extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const A:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Transform.a", "a", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var a$field:Number;

		private var hasField$0:uint = 0;

		public function clearA():void {
			hasField$0 &= 0xfffffffe;
			a$field = new Number();
		}

		public function get hasA():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set a(value:Number):void {
			hasField$0 |= 0x1;
			a$field = value;
		}

		public function get a():Number {
			return a$field;
		}

		/**
		 *  @private
		 */
		public static const B:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Transform.b", "b", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var b$field:Number;

		public function clearB():void {
			hasField$0 &= 0xfffffffd;
			b$field = new Number();
		}

		public function get hasB():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set b(value:Number):void {
			hasField$0 |= 0x2;
			b$field = value;
		}

		public function get b():Number {
			return b$field;
		}

		/**
		 *  @private
		 */
		public static const C:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Transform.c", "c", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var c$field:Number;

		public function clearC():void {
			hasField$0 &= 0xfffffffb;
			c$field = new Number();
		}

		public function get hasC():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set c(value:Number):void {
			hasField$0 |= 0x4;
			c$field = value;
		}

		public function get c():Number {
			return c$field;
		}

		/**
		 *  @private
		 */
		public static const D:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Transform.d", "d", (4 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var d$field:Number;

		public function clearD():void {
			hasField$0 &= 0xfffffff7;
			d$field = new Number();
		}

		public function get hasD():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set d(value:Number):void {
			hasField$0 |= 0x8;
			d$field = value;
		}

		public function get d():Number {
			return d$field;
		}

		/**
		 *  @private
		 */
		public static const TX:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Transform.tx", "tx", (5 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var tx$field:Number;

		public function clearTx():void {
			hasField$0 &= 0xffffffef;
			tx$field = new Number();
		}

		public function get hasTx():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set tx(value:Number):void {
			hasField$0 |= 0x10;
			tx$field = value;
		}

		public function get tx():Number {
			return tx$field;
		}

		/**
		 *  @private
		 */
		public static const TY:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Transform.ty", "ty", (6 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var ty$field:Number;

		public function clearTy():void {
			hasField$0 &= 0xffffffdf;
			ty$field = new Number();
		}

		public function get hasTy():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set ty(value:Number):void {
			hasField$0 |= 0x20;
			ty$field = value;
		}

		public function get ty():Number {
			return ty$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasA) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, a$field);
			}
			if (hasB) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, b$field);
			}
			if (hasC) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, c$field);
			}
			if (hasD) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, d$field);
			}
			if (hasTx) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, tx$field);
			}
			if (hasTy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, ty$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var a$count:uint = 0;
			var b$count:uint = 0;
			var c$count:uint = 0;
			var d$count:uint = 0;
			var tx$count:uint = 0;
			var ty$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (a$count != 0) {
						throw new flash.errors.IOError('Bad data format: Transform.a cannot be set twice.');
					}
					++a$count;
					this.a = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 2:
					if (b$count != 0) {
						throw new flash.errors.IOError('Bad data format: Transform.b cannot be set twice.');
					}
					++b$count;
					this.b = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 3:
					if (c$count != 0) {
						throw new flash.errors.IOError('Bad data format: Transform.c cannot be set twice.');
					}
					++c$count;
					this.c = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 4:
					if (d$count != 0) {
						throw new flash.errors.IOError('Bad data format: Transform.d cannot be set twice.');
					}
					++d$count;
					this.d = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 5:
					if (tx$count != 0) {
						throw new flash.errors.IOError('Bad data format: Transform.tx cannot be set twice.');
					}
					++tx$count;
					this.tx = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 6:
					if (ty$count != 0) {
						throw new flash.errors.IOError('Bad data format: Transform.ty cannot be set twice.');
					}
					++ty$count;
					this.ty = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
