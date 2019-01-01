
pragma solidity ^0.4.23;

contract TronAds {
  using SafeMath for uint256;
    
  // Define variable message of type string
  /*** DATATYPES ***/
  struct User {
    address name; // user address
    uint256 tan; // user current
  }

  uint256 KEY_UNIT;
  mapping (address => User) public users;
  address ownerAddress;

  /*** ACCESS MODIFIERS ***/
  /// @dev Access modifier for owner-only functionality
  modifier onlyOwner() {
    require(msg.sender == ownerAddress);
    _;
  }

  /*** CONSTRUCTOR ***/
  constructor () public{
    ownerAddress = msg.sender;
    KEY_UNIT = 1 trx;
  }

  function transfer (uint256 amountQuant) public payable {
    require (msg.value >= 1 * KEY_UNIT, "Minimum purchase is 1 TRX.");
    require (amountQuant >= transferAmount, "Buyin amount is not enough.");

    uint256 transferAmount = msg.value;
    User memory user = users[address(msg.sender)];
    if (user.name == 0x0) {
      user = User({
        name: address(msg.sender),
        tan: transferAmount
      });
    } else {
      user.tan = user.tan.add(transferAmount);
    }
    users[address(msg.sender)] = user;
  }
        
  function claim (uint256 amount) public onlyOwner {
    require (address(this).balance >= amount, "Game does not have enough balance.");
    ownerAddress.transfer(amount);
  }


  event displayAds(string ads, string userId, uint256 t);

  // Write function to change the value of variable message
  function ads(string adsFormat, string userId, uint256 t) public returns (string) {
    return adsFormat;
  }

  // Write function to change the value of variable message
  function vote(string adId, string userId, string advertiserId, uint256 t) public returns (string) {
    return adId;
  }

  // Write function to change the value of variable message
  function stake(string advertiserId, uint256 volume) public returns (uint256) {
    return volume;
  }

  // Write function to change the value of variable message
  function unstake(string advertiserId, uint256 volume) public returns (uint256) {
    return volume;
  }
}



library SafeMath {
  
  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
  
  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}
            
