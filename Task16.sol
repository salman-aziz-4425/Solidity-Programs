//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract builtIn2{


//1) assert(bool condition): This function is used to ensure that a condition is true, and will throw an exception and revert the transaction if the condition is false.
function myFunction1(uint x) public {
    assert(x > 0);
    // do something with x
     }
//2) require(bool condition): This function is similar to assert(), but it will refund the unused gas instead of throwing an exception.
function myFunction(uint x) public {
    require(x > 0, "Value of x must be greater than 0");
    // do something with x
}
//3) keccak256(bytes memory data): This function is used to compute the Keccak-256 hash of the input data.
bytes32 public hash = keccak256(abi.encodePacked("Hello, world!"));
//4) sha256(bytes memory data): This function is used to compute the SHA-256 hash of the input data.
bytes32 public hash256 = sha256(abi.encodePacked("Hello, world!"));

//5) addmod(uint x, uint y, uint k) returns (uint): This function returns (x + y) % k with arbitrary precision.
function myFunction5(uint x, uint y, uint k) public pure returns (uint) {
    return addmod(x, y, k);
}

//6) mulmod(uint x, uint y, uint k) returns (uint): This function returns (x * y) % k with arbitrary precision.
function myFunction6(uint x, uint y, uint k) public pure returns (uint) {
    return mulmod(x, y, k);
}

//7) abi.decode(bytes memory encodedData, (uint256, address, bytes32)[] memory decodeTypes): This function is used to decode a byte array into its specified types.
function decodeData(bytes memory encodedData) public pure returns (uint256, address, bytes32) {
    (uint256 uintData, address addressData, bytes32 bytesData) = abi.decode(encodedData, (uint256, address, bytes32));
    return (uintData, addressData, bytesData);
}

//8) abi.encode(...): This function is used to encode arguments into a single byte array.
bytes  myBytes12 = abi.encode("Hello", 123);

//9) ripemd160(bytes memory data): This function is used to compute the RIPEMD-160 hash of a byte array.
bytes20 hash22 = ripemd160(abi.encodePacked("Hello", "world!"));

//10) ecrecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s): This function is used to recover the address that signed a message.

function recoverAddress(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
    return ecrecover(hash, v, r, s);
}

// 11) selfdestruct(address payable recipient): This function is used to destroy the current contract and send its remaining ether to the specified address.

function destroy() public {
    selfdestruct(payable(msg.sender));
}


//12) gasleft(): This function is used to get the amount of gas remaining for the current transaction.

function myFunction3() public {
    uint gasStart = gasleft();
    // do something
    uint gasEnd = gasleft();
    uint gasUsed = gasStart - gasEnd;
}

//13) blockhash(uint blockNumber): This function is used to get the hash of a past block.
bytes32 hash45 = blockhash(block.number - 1);

//14) block.coinbase: This function is used to get the address of the miner that mined the current block.
function getCurrentMiner() public view returns (address) {
    return block.coinbase;
}

//15) abi.encodeWithSelector(bytes4 selector, ...): This function is used to encode the function selector and arguments into a single byte array.
bytes myData = abi.encodeWithSelector(bytes4(keccak256("myFunction(uint256)")), 123);



}