pragma solidity ^0.4.11;


import "./token/MintableToken.sol";


/**
 * @title BetmasterToken
 */
contract BetmasterToken is MintableToken {

  string public constant name = "Betmaster Token";
  string public constant symbol = "BETM";
  uint256 public constant decimals = 10;

  /**
  * @dev batchTransfer tokens to multiple recipients
  * @param _transfers - bytes 32 array, representing each transfer
  * first 12 bytes to represent _value as uint96
  * next 20 bytes to represent address of receiver
  */
  function batchTransfer(bytes32[] _transfers) returns (bool) {
    for (uint256 i = 0; i < _transfers.length; i++) {
      address to = address(_transfers[i]);
      uint96 value = uint96(_transfers[i] >> 160);
      _transfer(msg.sender, to, value);
    }
    return true;
  }

}
