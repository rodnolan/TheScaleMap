package vo {
	public class Bitfield {
		
		var iData:uint;
		static const iIndexMax:int = 11; // 12 bits
		
		function Bitfield(iInit:uint = 0):void {
			iData = iInit;
		}
		
		function Clear():void {
			iData = 0;
		}
		
		function Data():uint {
			return iData;
		}
		
		function SetBit(iIndex:int, bState:Boolean):void {
			var iMask1:uint = 1 << iIndex;
			var iMask2:uint = ~iMask1;
			
			iData &= iMask2;
			if (bState) {
				iData |= iMask1;
			}
		}
		
		function GetBit(iIndex:int):Boolean {
			var iMask1:uint = 1 << iIndex;
			return (iData & iMask1) > 0;
		}
		
		function NumBits():int {
			var iNum:int = 0, iCopy:uint = iData, iMask:uint = 0x01;
			
			while (iCopy > 0) {
				iNum += iCopy & iMask;
				iCopy >>= 1;
			}
			
			return iNum;
		}
	}
}