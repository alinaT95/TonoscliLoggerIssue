pragma ever-solidity >= 0.35.0;
pragma AbiHeader expire;

contract Accumulator {

	event TryEvent(uint summ);

	uint public sum = 2;

	constructor() public {
		// check that contract's public key is set
		require(tvm.pubkey() != 0, 101);
		// Check that message has signature (msg.pubkey() is not zero) and message is signed with the owner's private key
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
	}


	// Function that adds its argument to the state variable.
	function add(uint value) public  {
		//require(false, 788);
		tvm.accept();
		sum += value;
		emit TryEvent(sum);
	}

	function reset() public  {
		require(false, 788);
		tvm.accept();
		sum = 0;
	}

	function getSum() public returns(uint){
		tvm.accept();
		return sum;
	}

	/*function make_stake_cell(
		uint32 stake_at
	) public pure returns (TvmCell) {
		tvm.accept();
		TvmBuilder builder;
		//builder.storeUnsigned(0x654c5074, 32);
		builder.store(stake_at);
		return builder.toCell();
	}

	function make_stake_cell_hash(
		uint32 stake_at
	) public pure returns (uint256) {
		tvm.accept();
		TvmBuilder builder;
		//builder.storeUnsigned(0x654c5074, 32);
		builder.store(stake_at);
		return tvm.hash(builder.toCell());
	}

	function validateSignature(uint32 stake_at, bytes signature) public returns (bool) {
		tvm.accept();
        TvmBuilder builder;
        builder.store(stake_at);
        TvmCell payload = builder.toCell();
        //bool res = tvm.checkSign(tvm.hash(payload), signature.toSlice(), tvm.pubkey());
		bool res = tvm.checkSign(payload.toSlice(), signature.toSlice(), tvm.pubkey());
        return res;
    }

	function check_signature(
		TvmCell cell, bytes signature
	) public returns (bool) {
		tvm.accept();
		TvmBuilder b;
		b.store(signature);
		TvmSlice s = b.toSlice().loadRefAsSlice();
		require(s.bits() == 512);
		return tvm.checkSign(cell.toSlice(), s, tvm.pubkey());
	}*/
}
